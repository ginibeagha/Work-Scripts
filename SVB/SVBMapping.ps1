Import-Module Tridion-CoreService
Import-Module Tridion.TopologyManager.Automation

##Credentials are used when working from an external box
#$password=ConvertTo-SecureString 'Sbv2017!' -AsPlainText -force
#$credential=New-Object System.Management.Automation.PSCredential("AVGibeag",$password)

Set-TridionCoreServiceSettings -HostName 'app0503' 
#-Version "Web-8.1" -UserName 'SVB\AVGibeag' #-ConnectionType 'Default' #-Credential (Get-Credential)
$client= Get-TridionCoreServiceClient
Get-TridionGroups

<# This is code to get bpt data and play with whenever I need to
$BPT=$client.GetBusinessProcessTypes('Staging_LiveID')
$bptdata=$client.Read($BPT.IdRef, $null)
$bptdata.TargetTypes
#>
#-and $_.Title -notlike '*gbp*'

 [System.Collections.ArrayList] $pubidlist=@()
Get-TridionPublicationTargets|?{$_.Title -notlike '*werken*' -and $_.Title -notmatch '\bgip\b' -and  
    $_.Title -notmatch '\b[bg][bg]p\b' }|%{
    $pubtarget= $client.Read($_.Id, $null)
    
    #THis is to be sure I am on track
    Write-Host("{0}:{1}" -f $pubtarget.Title,$pubtarget.Publications.Count)
    
    $pubid=$pubtarget.Publications.IdRef
    $pubid|%{$pubidlist+=($_.Split("-")[1])}
    }
     #Remove publications that are no longer in use here. Just add to excess the pubid
     $xcess=@('134','335','128')
     $xcess|%{$pubidlist.Remove($_)}

     $pubidlist=$pubidlist|Sort-Object -Unique
     
     #This is needed as svb.nl need to find the contexturl in a component
     $svbpubid_svb= 127,132,133,129,130,131,175,297,296
     $svbpubid_others=87,86,215,216,278,277,280

Get-TridionPublications|?{$_.Id.Split('-')[1] -in $pubidlist}|%{
    $pub=$client.Read($_.Id, $Null)
    $mapid=$pub.Id.Split("-")[1]
    $MappingId= "{0}{1}"-f "mapping_", $mapid
   
   #Next if method is to handle svb.nl specific context url solution
       if($mapid -in $svbpubid_svb){
            $component=$client.Read("tcm:"+$mapid+"-218606",$null)
            $langvalue=($component.Content -split "<CONFIG_TEXT>")[1].Substring(0,2)
        
            $PubMapping= New-Object  Tridion.TopologyManager.Client.MappingData
            #$PubMapping.Id=$MappingId
            $PubMapping.CmEnvironmentId='DEV_ContentManager'
            $PubMapping.PublicationId=$pub.Id
            $PubMapping.WebApplicationId='SVB_Live_RootWebApp'
            $PubMapping.RelativeUrl='/'+$langvalue
            Add-TtmMapping -Data $PubMapping
            $PubMapping.WebApplicationId='SVB_Staging_RootWebApp'
             Add-TtmMapping -Data $PubMapping 
            }
    #Now to handle grensinfo
        if($mapid -eq 277){
            $langvalue='nl'
            $PubMapping= New-Object  Tridion.TopologyManager.Client.MappingData
            #$PubMapping.Id=$MappingId
            $PubMapping.CmEnvironmentId='DEV_ContentManager'
            $PubMapping.PublicationId=$pub.Id
            $PubMapping.WebApplicationId='Grensinfo_Live_RootWebApp'
            $PubMapping.RelativeUrl='/'+$langvalue
            Add-TtmMapping -Data $PubMapping
            $PubMapping.WebApplicationId='Grensinfo_Staging_RootWebApp'
            Add-TtmMapping -Data $PubMapping
        }
        if($mapid -eq 278){
            $langvalue='de'
            $PubMapping= New-Object  Tridion.TopologyManager.Client.MappingData
            #$PubMapping.Id=$MappingId
            $PubMapping.CmEnvironmentId='DEV_ContentManager'
            $PubMapping.PublicationId=$pub.Id
            $PubMapping.WebApplicationId='Grensinfo_Live_RootWebApp'
            $PubMapping.RelativeUrl='/'+$langvalue
            Add-TtmMapping -Data $PubMapping
            $PubMapping.WebApplicationId='Grensinfo_Staging_RootWebApp'
            Add-TtmMapping -Data $PubMapping
        }

        #Now for extranet websites we have 2 with no languages 
        if($mapid -in (215,216)){
            $PubMapping= New-Object  Tridion.TopologyManager.Client.MappingData
            #$PubMapping.Id=$MappingId
            $PubMapping.CmEnvironmentId='DEV_ContentManager'
            $PubMapping.PublicationId=$pub.Id
            $PubMapping.WebApplicationId='Extranet_Live_RootWebApp'
            $PubMapping.RelativeUrl='/fvp'
            Add-TtmMapping -Data $PubMapping
            $PubMapping.RelativeUrl='/ssp'
            $PubMapping.WebApplicationId='Extranet_Staging_RootWebApp'
            Add-TtmMapping -Data $PubMapping
        }
         if($mapid -in (87,86)){
            $PubMapping= New-Object  Tridion.TopologyManager.Client.MappingData
            #$PubMapping.Id=$MappingId
            $PubMapping.CmEnvironmentId='DEV_ContentManager'
            $PubMapping.PublicationId=$pub.Id
            $PubMapping.WebApplicationId='Paradocs_Live_RootWebApp'
            $PubMapping.RelativeUrl='/jsp/paradocs_portal'
            Add-TtmMapping -Data $PubMapping
            $PubMapping.WebApplicationId='Paradocs_Staging_RootWebApp'
            Add-TtmMapping -Data $PubMapping
        }
    Write-Host *****************************
}
Close-TridionCoreServiceClient

#$Bpt=$client.GetBusinessProcessTypes()

   
   