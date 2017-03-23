Import-Module Tridion-CoreService
Set-TridionCoreServiceSettings -HostName cm-web-4bc94a-dev-us-west-2-sdlr5.tridion.sdlproducts.com -Version "Web-8.2" `
-UserName "SDLPS\Gibeagha" -Password "x6Bw37DJ" -ConnectionType 'BASIC-SSL'

Import-Module Tridion-CoreService

Set-TridionCoreServiceSettings -HostName 'app0503' -Version "Web-8.5" -ConnectionType 'Default'
$client= Get-TridionCoreServiceClient

<# This is code to get bpt data and play with whenever I need to

$BPT=$client.GetBusinessProcessTypes('Staging_LiveID')
$bptdata=$client.Read($BPT.IdRef, $null)
$bptdata.TargetTypes
#>

 $pubidlist=@()
Get-TridionPublicationTargets|?{$_.Title -notlike '*werken*' -and $_.Title -notlike '*gip2*' -and  
    $_.Title -notlike '*bgp*' -and $_.Title -notlike '*gbp*'}|%{
    $pubtarget= $client.Read($_.Id, $null)
    Write-Host("{0}:{1}" -f $pubtarget.Title,$pubtarget.Publications.Count)
    $pubid=$pubtarget.Publications.IdRef
    $pubid|%{$pubidlist+=($_.Split("-")[1])}
    }
     $pubidlist=$pubidlist|Sort-Object -Unique

Get-TridionPublications|?{$_.Id.Split('-')[1] -in $pubidlist}|%{
    
    $pub=$client.Read($_.Id, $Null)
    $mapid=$pub.Id.Split("-")[1]
    $MappingId= "{0}{1}"-f "mapping_", $mapid
    $MappingId
    if($mapid -in 127,128,129){
    $component=$client.Read("tcm:"+$mapid+"-218606",$null)
    $langvalue=$component.Content.Split("<config_text>")[1]
    }
    $RelativeUrl=$pub.PublicationPath
    $RelativeUrl
    Write-Host *****************************
}

$Bpt=$client.GetBusinessProcessTypes()