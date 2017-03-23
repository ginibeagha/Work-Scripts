#Function to connect to Remote CM using Tridion Coreservice
Function CM-Connect {
    Param(
    [Parameter(Mandatory=$True)]
    [string]$Name,
    [Parameter(Mandatory=$True)]
    [string]$Password,
    [Parameter(Mandatory=$True)]
    [string]$Version,
    [Parameter(Mandatory=$True)]
    [string]$Hostname,
    [Parameter(Mandatory=$True)]
    [string]$ConnectionType            
)
#parameter end
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
      Process{
            $users=$client. Get-TridionUsers
            $publications= Get-TridionPublications
            $pubTargets=Get-TridionPublicationTargets
            $users| foreach($_

        }
    }
}
#$settings_dev=set-TridionCoreServiceSettings -UserName SDLPS\gibeagha -Password x6Bw37DJ -Version "Web-8.2" -HostName cm-web-4bc94a-dev-us-west-2-sdlr5.tridion.sdlproducts.com -ConnectionType 'BASIC-SSL'
Import-Module Tridion-CoreService
$settings_prod = set-TridionCoreServiceSettings -UserName SDLPS\gibeagha -Password x6Bw37DJ -Version "Web-8.2" -HostName cm-web-3ec5d6-us-west-2-sdlr5-prod.tridion.sdlproducts.com -ConnectionType 'BASIC-SSL'
$settings=Get-TridionCoreServiceSettings
$client= Get-TridionCoreServiceClient
$prod_users= Get-TridionUsers

foreach($user in $prod_users){
    $user=$client.Read($user.Id,$null)
    Write-Host($user.Description)
}
$presentuser=$client.Read(($prod_users|where {$_.Title -EQ 'SDLPS\Gibeagha'}),$null)
$client.Read(
#$users=Get-TridionUsers 
#$prod_users.count
#$Devusers= Get-TridionUsers
#$users|Measure
#$Devusers|Measure
#$newusers=Compare-Object -ReferenceObject $Devusers -DifferenceObject $users -PassThru
#$newusers1=Compare-Object -ReferenceObject $users -DifferenceObject  $Devusers -PassThru

$path='D:\PSProjects\sdl.com\Trustees_2013.xlsx'
$excel= New-Object -ComObject Excel.Application
$excel.Visible= $false
$workbook= $excel.Workbooks.Open($path)
$wb=$workbook.Sheets.Item('Sheet1')

##$wb.Columns[1]| select -Property text
$usedrange=$wb.UsedRange
#$usedrange.Columns.Count
#$usedrange.Rows.Count
#$usedrange.EntireColumn.Column[1]
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
$ProductionUsers= $prod_users| select -Property Title
$ProductionUsers
$counttrustees=$trustees_2013 |where {$_ -notlike "*\*" -or $_ -like "*snj*"}

foreach ($trustee in ($trustees_2013 | Where{$_ -notlike "*\*" -or $_ -like "*snj*"})){$trustees_2013 -ne $trustee}

$trustees_2013.Count
$trustees_2013.Remove($trustees_2013.Where($_ -notlike "*\*" -or $_ -like "*snj*")) 
Compare-Object -ReferenceObject $trustees_2013 -DifferenceObject $ProductionUsers -PassThru 

foreach($row in $usedrange.Rows){
$i=2
$trustees_2013.Insert($i-2,$row.Cells.Item($i,2).text)
Write-Host($trustees_2013[$i-2])
$i+=1
if($i -le $usedrange.Rows.Count){
continue}
else{exit}
}

$wb1=$wb.Range("B2:B3").text
Write-Host($wb1)
$wb1.Rows.Count
$trustees_2013.Count
