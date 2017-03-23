# TopologyType
$TopologyTypeID='Staging_LiveID'
$TopologyTypeName='Staging_Live'
$EnvironmentPurposes= @('Live','Staging')

#CD Environment Staging
$StagingEnvironmentID= 'StagingID'
$DiscoveryEndPointStaging= 'http://app0512:8082/discovery.svc'
$EnvironmentPurposeStaging='Staging'

$AuthenticationType= 'OAuth'
$cmclientid='cmuser'
$cmclientsecret='CMUserP@ssw0rd'

#CD Environment Live
$LiveEnvironmentID= 'LiveID'
$DiscoveryEndPointLive= 'http://app0512:9082/discovery.svc'
$EnvironmentPurposeStaging='Live'

#Topology
$TopologyName='SVBStagingAndLive'
#For Topology and environments without ID use this
#$TopologyTypeId= Get-TtmCdTopologyType|?{$_.Name -eq "*Staging_Live*"}|%{return $_.Id}
#$CdEnvironments=@(Get-TtmCdEnvironment|?{$_.EnvironmentPurpose -eq 'Live' -or $_.EnvironmentPurpose -eq 'Staging'}|%{return $_.Id})

#Websites: Replace Name with the names of different websites, replace the base urls as well
$SVB_Live=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$SVB_Live.CdEnvironment = $LiveEnvironmentID
$SVB_Live.BaseUrls = @('http://localhost:xxx', 'http://visitorswebsite.com')

#For non-ID environments this is for Websites
#$SVB_Live.CdEnvironment = Get-TtmCdEnvironment|?{$_.EnvironmentPurpose -eq 'Live'}|%{return $_.Id}
#$SVB_Staging.CdEnvironment = Get-TtmCdEnvironment|?{$_.EnvironmentPurpose -eq 'Staging'}|%{return $_.Id}

$SVB_Staging=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$SVB_Staging.CdEnvironment = $StagingEnvironmentID
$SVB_Staging.BaseUrls = @('http://localhost:xxx', 'http://staging.visitorswebsite.com')

#######################################

$Extranet_Live=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$Extranet_Live.CdEnvironment = $LiveEnvironmentID
$Extranet_Live.BaseUrls = @('http://localhost:xxx', 'http://visitorswebsite.com')

$Extranet_Staging=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$Extranet_Staging.CdEnvironment = $StagingEnvironmentID
$Extranet_Staging.BaseUrls = @('http://localhost:xxx', 'http://staging.visitorswebsite.com')

#######################################

$Grensinfo_Live=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$Grensinfo_Live.CdEnvironment = $LiveEnvironmentID
$Grensinfo_Live.BaseUrls = @('http://localhost:xxx', 'http://visitorswebsite.com')

$Grensinfo_Staging=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$Grensinfo_Staging.CdEnvironment = $StagingEnvironmentID
$Grensinfo_Staging.BaseUrls = @('http://localhost:xxx', 'http://staging.visitorswebsite.com')

#######################################

$Paradocs_Live=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$Paradocs_Live.CdEnvironment = $LiveEnvironmentID
$Paradocs_Live.BaseUrls = @('http://localhost:xxx', 'http://visitorswebsite.com')

$Paradocs_Staging=New-object -TypeName Tridion.TopologyManager.Client.WebsiteData
$Paradocs_Staging.CdEnvironment = $StagingEnvironmentID
$Paradocs_Staging.BaseUrls = @('http://localhost:xxx', 'http://staging.visitorswebsite.com')


#Webapplication: discuss the use of this and how its needed

#Mapping: This has to be repeated for all publications that need to be mapped.
#tcmuri: 127,132,133,128,129,130,131,175,297,296,335


$SVB_live_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$SVB_live_Mapping.PublicationId
$SVB_live_Mapping.WebApplicationId
$SVB_live_Mapping.RelativeUrl

$SVB_staging_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$SVB_staging_Mapping.PublicationId
$SVB_staging_Mapping.WebApplicationId
$SVB_staging_Mapping.RelativeUrl

#tcmuri:215,216
$Extranet_live_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$Extranet_live_Mapping.PublicationId
$Extranet_live_Mapping.WebApplicationId
$Extranet_live_Mapping.RelativeUrl

$Extranet_staging_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$Extranet_staging_Mapping.PublicationId
$Extranet_staging_Mapping.WebApplicationId
$Extranet_staging_Mapping.RelativeUrl

#tcmuri:278,277,280
$Grensinfo_live_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$Grensinfo_live_Mapping.PublicationId
$Grensinfo_live_Mapping.WebApplicationId
$Grensinfo_live_Mapping.RelativeUrl

$Grensinfo_staging_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$Grensinfo_staging_Mapping.PublicationId
$Grensinfo_staging_Mapping.WebApplicationId
$Grensinfo_staging_Mapping.RelativeUrl

#tcmuri:87, 86
$Paradocs_live_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$Paradocs_live_Mapping.PublicationId
$Paradocs_live_Mapping.WebApplicationId
$Paradocs_live_Mapping.RelativeUrl

$Paradocs_staging_Mapping= New-Object -TypeName Tridion.TopologyManager.Client.MappingData
$Paradocs_staging_Mapping.PublicationId
$Paradocs_staging_Mapping.WebApplicationId
$Paradocs_staging_Mapping.RelativeUrl

