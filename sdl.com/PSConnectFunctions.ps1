#Function to connect to Remote CM using Tridion Coreservice
#Function CM-Connect {
 [cmdletbinding()]
 Param(
    [Parameter()]
    [string]$Name="SDLPS\gibeagha",
    [Parameter()]
    [string]$Password='x6Bw37DJ',
    [Parameter()]
    [string]$Version="Web-8.2",
    [Parameter()]
    #[string]$Hostname='cm-web-3ec5d6-us-west-2-sdlr5-prod.tridion.sdlproducts.com',
    [string]$Hostname='cm-web-4bc94a-dev-us-west-2-sdlr5.tridion.sdlproducts.com',
    [Parameter(Mandatory=$false)]
    [string]$ConnectionType='BASIC-SSL'  
    
)

#parameter end

Get-TridionCoreServiceClient
Get-TridionCoreServiceSettings

Function Connect-Excel{

$path='D:\PSProjects\sdl.com\Trustees_2013.xlsx'
$excel= New-Object -ComObject Excel.Application
$excel.Visible= $false
$workbook= $excel.Workbooks.Open($path)
$wb=$workbook.Sheets.Item('Sheet1')
$usedrange=$wb.UsedRange
$trustees_2013=@()
$rowstart=2
#foreach($entry in $usedrange.EntireColumn[1].
for($i=0; $i -le $usedrange.Rows.Count; $i++)
    {
        #$trustees_2013[$i]=$usedrange.Rows[$rowstart].Cells.Item($rowstart,2).text
        $trustees_2013+=$usedrange.Rows.Cells.Item($rowstart,2).text.ToString()
        #Write-Host($trustees_2013[$i])
        $rowstart++
    }
    $trustees_2013.Count
    return $trustees_2013

}
Function PSConnectFunctions{

Begin{
      try{
            Write-Verbose "Preparing"
            $modules = "Tridion-CoreService"
            $modules | foreach {Import-Module $_ -ErrorAction Stop}
            Set-TridionCoreServiceSettings -HostName $Hostname -Password $Password -Version $Version -ConnectionType $ConnectionType -UserName $Name
            $client = Get-TridionCoreServiceClient
        }
      catch{
            Write-Host ("Process stopped with error {0}"-f $_ ) -ForegroundColor Red -BackgroundColor Black
        }
     }
      Process{
            $users=Get-TridionUsers
            $publications= Get-TridionPublications
            $pubTargets=Get-TridionPublicationTargets
            [System.Collections.ArrayList]$userTitles= @()
            foreach($user in $users){
                $user=$client.Read($user.Id,$null)
                $client
               # Out-File -InputObject $user.Description -FilePath "D:\PSProjects\Work Scripts\sdl.com\trustee.txt" -Append 
                $userTitles.Add($user.Title)
                }
                [System.Collections.ArrayList]$2013_trustees= Connect-Excel
                foreach($subj in ($2013_trustees.Count| where {$_ -notlike "*\*" -or $_ -like "*snj*"})){$2013_trustees.Remove($subj)}
                foreach($subj in ($2013_trustees| where {$_ -like "Global\*"}))
                {
                    
                    #$subj -replace "Global", "SDLPS"
                    $2013_trustees[$2013_trustees.IndexOf($subj)]=$subj -replace "Global", "SDLPS"
                    Write-Host($2013_trustees.IndexOf($subj))
                }
                 $2013_trustees.Count

                 foreach($subj in ($userTitles| where {$_ -like "Global\*"}))
                {
                    
                    #$subj -replace "Global", "SDLPS"
                    $userTitles[$userTitles.IndexOf($subj)]=$subj -replace "Global", "SDLPS"
                    Write-Host($userTitles[$userTitles.IndexOf($subj)])
                }
                <#foreach($subj in ($2013_trustees| where {$_ -notlike "*\*" -or $_ -like "*snj*"}))
                {Write-Host($subj)
                } #>
                
               # [System.Collections.ArrayList]$diffUsers=Compare-Object -ReferenceObject $userTitles -DifferenceObject  $2013_trustees -PassThru
                [System.Collections.ArrayList]$diffUsers=Compare-Object $userTitles $2013_trustees > difference.txt -IncludeEqual
               
                foreach($diff in $diffUsers){$diffUsers.Remove($diff)}
                Write-Host($diffUsers.Count)
        }
 }

 PSConnectFunctions

    
