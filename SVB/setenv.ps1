import-module Tridion.TopologyManager.Automation
# TopologyType
$TopologyTypeID='Staging_LiveID'
$TopologyTypeName='Staging_Live'
$EnvironmentPurposes= @('Live','Staging')

#CD Environment Staging
$StagingEnvironmentID= 'Staging'
$DiscoveryEndPointStaging= 'http://app0512:8082/discovery.svc'
$EnvironmentPurposeStaging='Staging'

$AuthenticationType= 'OAuth'
$cmclientid='cmuser'
$cmclientsecret='CMUserP@ssw0rd'

#CD Environment Live
$LiveEnvironmentID= 'Live'
$DiscoveryEndPointLive= 'http://app0512:9082/discovery.svc'
$EnvironmentPurposeLive='Live'

#Topology
$TopologyName='SVBStagingAndLive'
#For Topology and environments without ID use this
#$TopologyTypeId= Get-TtmCdTopologyType|?{$_.Name -eq "*Staging_Live*"}|%{return $_.Id}
$CdEnvironments=@($LiveEnvironmentID,$StagingEnvironmentID)

#Websites: Replace Name with the names of different websites, replace the base urls as well
$SVB_Live=New-object  Tridion.TopologyManager.Client.WebsiteData
$SVB_Live.Id='SVB_Live'
$SVB_Live.CdEnvironmentId = $LiveEnvironmentID
$SVB_Live.BaseUrls = @('http://www-r.svb.nl')


#For non-ID environments this is for Websites
#$SVB_Live.CdEnvironment = Get-TtmCdEnvironment|?{$_.EnvironmentPurpose -eq 'Live'}|%{return $_.Id}
#$SVB_Staging.CdEnvironment = Get-TtmCdEnvironment|?{$_.EnvironmentPurpose -eq 'Staging'}|%{return $_.Id}

$SVB_Staging=New-object  Tridion.TopologyManager.Client.WebsiteData
$SVB_Staging.Id='SVB_Staging'
$SVB_Staging.CdEnvironmentId = $StagingEnvironmentID
$SVB_Staging.BaseUrls = @('http://wwwpre-r')

#######################################

$Extranet_Live=New-object  Tridion.TopologyManager.Client.WebsiteData
$Extranet_Live.Id='Extranet_Live'
$Extranet_Live.CdEnvironmentId = $LiveEnvironmentID
$Extranet_Live.BaseUrls = @('http://extranet-r.svb.nl')

$Extranet_Staging=New-object  Tridion.TopologyManager.Client.WebsiteData
$Extranet_Staging.Id='Extranet_Staging'
$Extranet_Staging.CdEnvironmentId = $StagingEnvironmentID
$Extranet_Staging.BaseUrls = @('http://extranetpre-r')

#######################################

$Grensinfo_Live=New-object  Tridion.TopologyManager.Client.WebsiteData
$Grensinfo_Live.id='Grensinfo_Live'
$Grensinfo_Live.CdEnvironmentId = $LiveEnvironmentID
$Grensinfo_Live.BaseUrls = @('http://www-r.grensinfo.nl')

$Grensinfo_Staging=New-object  Tridion.TopologyManager.Client.WebsiteData
$Grensinfo_Staging.Id= 'Grensinfo_Staging'
$Grensinfo_Staging.CdEnvironmentId = $StagingEnvironmentID
$Grensinfo_Staging.BaseUrls = @('http://grensinfopre-r')

#######################################

$Paradocs_Live=New-object Tridion.TopologyManager.Client.WebsiteData
$Paradocs_Live.Id='Paradocs_Live'
$Paradocs_Live.CdEnvironmentId = $LiveEnvironmentID
$Paradocs_Live.BaseUrls = @('http://svbweb-r')

$Paradocs_Staging=New-object  Tridion.TopologyManager.Client.WebsiteData
$Paradocs_Staging.Id='Paradocs_Staging'
$Paradocs_Staging.CdEnvironmentId = $StagingEnvironmentID
$Paradocs_Staging.BaseUrls = @('http://svbwebpre-r')


#Webapplication: discuss the use of this and how its needed
#moved this into script
<#$webapp_svbstaging=Get-TtmWebApplication SVB_Staging_RootWebApp
$webapp_svbstaging.ContextUrl= '/int'

$webapp_svblive=Get-TtmWebApplication SVB_Live_RootWebApp
$webapp_svblive.ContextUrl= '/int'#>

#no special context url for Extranet or Paradocs below
<#$webapp_Extranetstaging=Get-TtmWebApplication Extranet_Staging_RootWebApp
$webapp_Extranetstaging.ContextUrl= /

$webapp_Extranetlive=Get-TtmWebApplication Extranet_Live_RootWebApp
$webapp_Extranetlive.ContextUrl= /


$webapp_Grensinfostaging=Get-TtmWebApplication Grensinfo_Staging_RootWebApp
$webapp_Grensinfostaging.ContextUrl= '/gip'

$webapp_Grensinfolive=Get-TtmWebApplication Grensinfo_Live_RootWebApp
$webapp_Grensinfolive.ContextUrl= '/gip'
#>
<#
$webapp_Paradocsstaging=Get-TtmWebApplication Paradocs_Staging_RootWebApp
$webapp_Paradocsstaging.ContextUrl= '/'

$webapp_Paradocslive=Get-TtmWebApplication Paradocs_Live_RootWebApp
$webapp_Paradocslive.ContextUrl= '/'
#>

#Mapping: This has to be repeated for all publications that need to be mapped.
#tcmuri: 127,132,133,128,129,130,131,175,297,296
<#
$SVB_live_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$SVB_live_Mapping.PublicationId
$SVB_live_Mapping.WebApplicationId
$SVB_live_Mapping.RelativeUrl

$SVB_staging_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$SVB_staging_Mapping.PublicationId
$SVB_staging_Mapping.WebApplicationId
$SVB_staging_Mapping.RelativeUrl

#tcmuri:215,216
$Extranet_live_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$Extranet_live_Mapping.PublicationId
$Extranet_live_Mapping.WebApplicationId
$Extranet_live_Mapping.RelativeUrl

$Extranet_staging_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$Extranet_staging_Mapping.PublicationId
$Extranet_staging_Mapping.WebApplicationId
$Extranet_staging_Mapping.RelativeUrl

#tcmuri:278,277,280
$Grensinfo_live_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$Grensinfo_live_Mapping.PublicationId
$Grensinfo_live_Mapping.WebApplicationId
$Grensinfo_live_Mapping.RelativeUrl

$Grensinfo_staging_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$Grensinfo_staging_Mapping.PublicationId
$Grensinfo_staging_Mapping.WebApplicationId
$Grensinfo_staging_Mapping.RelativeUrl

#tcmuri:87, 86
$Paradocs_live_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$Paradocs_live_Mapping.PublicationId
$Paradocs_live_Mapping.WebApplicationId
$Paradocs_live_Mapping.RelativeUrl

$Paradocs_staging_Mapping= New-Object  Tridion.TopologyManager.Client.MappingData
$Paradocs_staging_Mapping.PublicationId
$Paradocs_staging_Mapping.WebApplicationId
$Paradocs_staging_Mapping.RelativeUrl
#>
