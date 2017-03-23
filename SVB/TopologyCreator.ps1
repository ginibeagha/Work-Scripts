import-module Tridion.TopologyManager.Automation

# Calling this standardWebSite, because I really only expect to have one topology type. 
# This maps on to the Business process type in the CM, so there I also made Standard web site BPT
if (-not (Get-TtmCdTopologyType | ? {$_.Id -eq 'standardWebSite'})){
    Add-TtmCdTopologyType -Id standardWebSite -Name "Standard web site" -EnvironmentPurposes Staging, Live
}

# These are really the physical environments that exist here. I've said local, because I might add an environment or two on a linux box or wherever.
# Don't forget this has to be the cMuser
Add-TtmCdEnvironment -Id localStagingEnvironment -EnvironmentPurpose Staging -DiscoveryEndpointUrl http://localhost:9082/discovery.svc `
                        -AuthenticationType OAuth -ClientId cmuser -ClientSecret CMUserP@ssw0rd 
Add-TtmCdEnvironment -Id localLiveEnvironment -EnvironmentPurpose Live -DiscoveryEndpointUrl http://localhost:8082/discovery.svc `
                        -AuthenticationType OAuth -ClientId cmuser -ClientSecret CMUserP@ssw0rd 

# Maps the TT to the Env... Environments have purposes... 
Add-TtmCdTopology -Id localStandardWebsiteTopology -Name "Local Topology" -CdTopologyTypeId standardWebSite -CdEnvironmentIds localStagingEnvironment,localLiveEnvironment


# Websites have URLs... They need to map to environments
Add-TtmWebsite -Id stagingVisitorsWeb -CdEnvironmentId localStagingEnvironment -BaseUrls http://staging.visitorsweb.local
Add-TtmWebsite -Id stagingDd4t -CdEnvironmentId localStagingEnvironment -BaseUrls http://staging.dd4t.local
Add-TtmWebsite -Id stagingIndi -CdEnvironmentId localStagingEnvironment -BaseUrls http://staging.indi.local

# And if we had more applications in one site, we'd do this... 
#Add-TtmWebApplication -Id stagingVisitorsWebApp -WebsiteId stagingVisitorsWeb -ContextUrl "/xxxx"
Add-TtmMapping -Id "VisitorsWebStagingMapping" -PublicationId "tcm:0-10-1" -WebApplicationId stagingVisitorsWeb_RootWebApp  
Add-TtmMapping -Id "DD4TStagingMapping" -PublicationId "tcm:0-15-1" -WebApplicationId stagingDd4t_RootWebApp 
Add-TtmMapping -Id "IndiStagingMapping" -PublicationId "tcm:0-31-1" -WebApplicationId stagingIndi_RootWebApp 

# Conclusion from playing with the CM is that you need the mapping or you can't publish
# Next up... check this out
# CONTEXTURL is the Web folder path to this Web application, relative to the Web site's base URL, for example, "/microsite/". If your Publication that maps to this Web application publishes to the file system, the value of ContextUrl must match the Publication Path property of that Publication, as found in its General tab.


Add-TtmWebsite -Id liveVisitorsWeb -CdEnvironmentId localLiveEnvironment -BaseUrls http://visitorsweb.local
Add-TtmWebsite -Id liveDd4t -CdEnvironmentId localLiveEnvironment -BaseUrls http://dd4t.local
Add-TtmWebsite -Id liveIndi -CdEnvironmentId localLiveEnvironment -BaseUrls http://indi.local
# Add-TtmWebApplication -Id WEBAPPID -WebsiteId liveVisitorsWeb -ContextUrl "CONTEXTPATH"

Add-TtmMapping -Id "VisitorsWebLiveMapping" -PublicationId "tcm:0-10-1" -WebApplicationId liveVisitorsWeb_RootWebApp 
Add-TtmMapping -Id "DD4TLiveMapping"-PublicationId "tcm:0-15-1" -WebApplicationId liveDd4t_RootWebApp 
Add-TtmMapping -Id "IndiLiveMapping"-PublicationId "tcm:0-31-1" -WebApplicationId liveIndi_RootWebApp 
