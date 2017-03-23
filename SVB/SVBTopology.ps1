#import-module Tridion.TopologyManager.Automation
$script:ErrorActionPreference = "Stop"

#Get your Topology Variables
$rootlocaton= Join-Path -Path $PSScriptRoot -ChildPath setenv.ps1 
Write-Host "Getting Variables from" $rootlocaton
Write-Host =================================================================
. $rootlocaton

#First we need a topology type that tells us what type of Topologies we would have in the full environment.
#Here I am just adding one for a staging and live environment. To be discussed if more are needed. 
#I generally will not be adding Id's thereby allowing the system create Id's for me
#This maps to the BPT in the CM

Add-TtmCdTopologyType -ID $TopologyTypeId -Name $TopologyTypeName -EnvironmentPurposes $EnvironmentPurposes


# These are really the physical environments that exist here. I think in general its Staging and live environments so nothing new.
#Every environment will be known by the fact that it has a discovery endpoint.
# Don't forget this has to be the cMuser
Add-TtmCdEnvironment -ID $StagingEnvironmentID -EnvironmentPurpose $EnvironmentPurposeStaging -DiscoveryEndpointUrl $DiscoveryEndPointStaging
                        -AuthenticationType $AuthenticationType -ClientId $cmclientid -ClientSecret $cmclientsecret
Add-TtmCdEnvironment -ID $LiveEnvironmentID -EnvironmentPurpose $EnvironmentPurposeLive -DiscoveryEndpointUrl $DiscoveryEndPointLive
                        -AuthenticationType $AuthenticationType -ClientId $cmclientid -ClientSecret $cmclientsecret

# Maps the TT to the Env... Environments have purposes... 
Add-TtmCdTopology -Name $TopologyName -CdTopologyTypeId $TopologyTypeId -CdEnvironmentIds $CdEnvironments


# Websites have URLs... They need to map to environments
#I am using data here as I think it then keeps us able to change website info around much quicker

Add-TtmWebsite -Data $SVB_Live
Add-TtmWebsite -Data $SVB_Staging

Add-TtmWebsite -Data $Extranet_Live
Add-TtmWebsite -Data $Extranet_Staging

Add-TtmWebsite -Data $Grensinfo_Live
Add-TtmWebsite -Data $Grensinfo_Staging

Add-TtmWebsite -Data $Paradocs_Live
Add-TtmWebsite -Data $Paradocs_Staging

# And if we had more applications in one site, we'd do this... 
#This may be included based on our discussions


# Add-TtmWebApplication -Id WEBAPPID -WebsiteId liveVisitorsWeb -ContextUrl "CONTEXTPATH"
#I will have to look at the structure of the CM blueprint to look into this effectively.

Add-TtmMapping -Data $SVB_live_Mapping
Add-TtmMapping -Data $SVB_staging_Mapping

Add-TtmMapping -Data $Extranet_live_Mapping
Add-TtmMapping -Data $Extranet_staging_Mapping

Add-TtmMapping -Data $Grensinfo_live_Mapping
Add-TtmMapping -Data $Grensinfo_staging_Mapping

Add-TtmMapping -Data $Paradocs_live_Mapping
Add-TtmMapping -Data $Paradocs_staging_Mapping
