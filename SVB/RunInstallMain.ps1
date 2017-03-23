#gci -r|?{$_.Name -like 'RunInstall*'}| % {$newname=$_.FullName -replace '.ps1', '.txt';ren $_ $newname }

#gci -r|?{$_.Name -like 'RunInstall*'}|%{iex .\$_}
[System.Collections.ArrayList]$runfiles=@()
gci -r|?{$_.Name -like 'RunInstall*'}|%{
    if($_.FullName -like '*Discovery*'){
        . $_.FullName
     }
     else{ $runfiles.Add($_.FullName) }
}
$runfiles|%{. $_}

