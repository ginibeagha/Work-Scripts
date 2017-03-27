 [Parameter(Mandatory=$true, HelpMessage="The Host name of the CMS server")] 
[ValidateSet('app0503','svbcms-r','svbcms-s','svbcms-a','svbcms')] 
[string]$hostname = 'app0503'   

Import-Module Tridion-CoreService 
Set-TridionCoreServiceSettings -HostName $hostname -ConnectionSendTimeout "00:03:00" 
$core = Get-TridionCoreServiceClient 

$currentUserId = $core.GetCurrentUser().Id 
$user = new-Object Tridion.ContentManager.CoreService.Client.LinkToUserData 
$user.IdRef = $currentUserId 

$filter = New-Object Tridion.ContentManager.CoreService.Client.PublishTransactionsFilterData 
# $filter.PublishedBy = $user 

$pubtrans = $core.GetSystemWideList($filter) 

$pubtrans | % {$core.Delete($_.Id)} 

