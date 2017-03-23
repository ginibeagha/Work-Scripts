$pubCL=121,133,134,135,136,137,138,139,141
$contexturlCL="languagecloud","cn/languagecloud","de/languagecloud","es/languagecloud","fr/languagecloud","it/languagecloud","jp/languagecloud","kr/languagecloud","nl/languagecloud"
#Showcase mappings
$pubShowcase=172,176,184,173,197,181,189,178,191,185,195,194,175,183,196,180,192,187
$contexturlShowcase="","cn_en","fr_en","de_en","en","it_en","jp_en","ko_en","nl_en","es_en","cn_zhcn","fr_fr","de_de","it_it","jp_ja","ko_kr","nl_nl","es_es"

#Dev publications= 173,186,184,195,174,185,188,189,175,190,192,193,194,196,197,198,199,200

foreach($i in $pub)
 Add-TtmMapping -PublicationId 'tcm:0-173-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl ""
 Add-TtmMapping -PublicationId 'tcm:0-173-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl ""
 
 Add-TtmMapping -PublicationId 'tcm:0-186-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "cn_en"
 Add-TtmMapping -PublicationId 'tcm:0-186-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "cn_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-184-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "fr_en"
 Add-TtmMapping -PublicationId 'tcm:0-184-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "fr_en"
 
Add-TtmMapping -PublicationId 'tcm:0-195-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "de_en"
 Add-TtmMapping -PublicationId 'tcm:0-195-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "de_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-174-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "en"
 Add-TtmMapping -PublicationId 'tcm:0-174-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "en"
 
 Add-TtmMapping -PublicationId 'tcm:0-185-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "it_en"
 Add-TtmMapping -PublicationId 'tcm:0-185-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "it_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-188-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "jp_en"
 Add-TtmMapping -PublicationId 'tcm:0-188-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "jp_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-189-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "ko_en"
 Add-TtmMapping -PublicationId 'tcm:0-189-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "ko_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-175-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "nl_en"
 Add-TtmMapping -PublicationId 'tcm:0-175-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "nl_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-190-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "es_en"
 Add-TtmMapping -PublicationId 'tcm:0-190-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "es_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-192-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "cn_zhcn"
 Add-TtmMapping -PublicationId 'tcm:0-192-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "cn_zhcn"
 
 Add-TtmMapping -PublicationId 'tcm:0-193-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "fr_fr"
 Add-TtmMapping -PublicationId 'tcm:0-193-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "fr_fr"
 
 Add-TtmMapping -PublicationId 'tcm:0-194-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "de_de"
 Add-TtmMapping -PublicationId 'tcm:0-194-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "de_de"
 
 Add-TtmMapping -PublicationId 'tcm:0-196-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "it_it"
 Add-TtmMapping -PublicationId 'tcm:0-196-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "it_it"
 
 Add-TtmMapping -PublicationId 'tcm:0-197-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "jp_ja"
 Add-TtmMapping -PublicationId 'tcm:0-197-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "jp_ja"
 
 Add-TtmMapping -PublicationId 'tcm:0-198-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "ko_kr"
 Add-TtmMapping -PublicationId 'tcm:0-198-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "ko_kr"
 
 Add-TtmMapping -PublicationId 'tcm:0-199-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "nl_nl"
 Add-TtmMapping -PublicationId 'tcm:0-199-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "nl_nl"
 
 Add-TtmMapping -PublicationId 'tcm:0-200-1' -WebApplicationId LiveWebsite5_RootWebApp -RelativeUrl "es_es"
 Add-TtmMapping -PublicationId 'tcm:0-200-1' -WebApplicationId StagingWebsite5_RootWebApp -RelativeUrl "es_es"