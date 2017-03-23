#Get-TtmMapping | where {$_.PublicationId -in  ("tcm:0-221-1", "tcm:0-209-1")}

 select state, TARGET_TYPE_ID from PUBLISH_STATES where PUBLICATION_ID in (208,215,211,221,218,216,209,219,210,213,222,212,223,220,224,225,217,214)

 
###STEP1
update PUBLISH_STATES
  set STATE=7
  where PUBLICATION_ID in(208,215,211,221,218,216,209,219,210,213,222,212,223,220,224,225,217,214) and state=1
  
  
###STEP2
##Dev= 173,186,184,195,174,185,188,189,175,190,192,193,194,196,197,198,199,200
##newDev= 172,184,186,185, 190, 173, 194, 180,177, 182,192,188,196, 175, 195,193,178, 183

##Dev
foreach ($mapping in (Get-TtmMapping |where {$_.PublicationId -in ('tcm:0-173-1','tcm:0-186-1','tcm:0-184-1','tcm:0-195-1','tcm:0-174-1','tcm:0-185-1','tcm:0-188-1','tcm:0-189-1','tcm:0-175-1','tcm:0-190-1','tcm:0-192-1','tcm:0-193-1','tcm:0-194-1','tcm:0-196-1','tcm:0-197-1','tcm:0-198-1','tcm:0-199-1','tcm:0-200-1')})){Remove-TtmMapping -Id $mapping.Id -Force}

##Prod
foreach ($mapping in (Get-TtmMapping |where {$_.PublicationId -in ('tcm:0-208-1','tcm:0-215-1','tcm:0-211-1','tcm:0-221-1','tcm:0-218-1','tcm:0-216-1','tcm:0-209-1','tcm:0-219-1','tcm:0-210-1','tcm:0-213-1','tcm:0-222-1','tcm:0-212-1','tcm:0-223-1','tcm:0-220-1','tcm:0-224-1','tcm:0-225-1','tcm:0-217-1','tcm:0-214-1')})){Remove-TtmMapping -Id $mapping.Id -Force}

   

### I need to change the publication URL in the CME here

##STEP 3
Add-TtmMapping -PublicationId 'tcm:0-208-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl ""
  
Add-TtmMapping -PublicationId 'tcm:0-215-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "cn_en"
 
Add-TtmMapping -PublicationId 'tcm:0-211-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "fr_en"
 
Add-TtmMapping -PublicationId 'tcm:0-221-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "de_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-218-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "en"
 Add-TtmMapping -PublicationId 'tcm:0-218-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "en"
 
Add-TtmMapping -PublicationId 'tcm:0-216-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "it_en"
 
Add-TtmMapping -PublicationId 'tcm:0-209-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "jp_en"
 
Add-TtmMapping -PublicationId 'tcm:0-219-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "ko_en"
 
Add-TtmMapping -PublicationId 'tcm:0-210-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "nl_en"
 
Add-TtmMapping -PublicationId 'tcm:0-213-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "es_en"
 
 Add-TtmMapping -PublicationId 'tcm:0-222-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "cn_zhcn"
 Add-TtmMapping -PublicationId 'tcm:0-222-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "cn_zhcn"
 
 Add-TtmMapping -PublicationId 'tcm:0-212-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "fr_fr"
 Add-TtmMapping -PublicationId 'tcm:0-212-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "fr_fr"
 
 Add-TtmMapping -PublicationId 'tcm:0-223-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "de_de"
 Add-TtmMapping -PublicationId 'tcm:0-223-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "de_de"
 
 Add-TtmMapping -PublicationId 'tcm:0-220-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "it_it"
 Add-TtmMapping -PublicationId 'tcm:0-220-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "it_it"
 
 Add-TtmMapping -PublicationId 'tcm:0-224-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "jp_ja"
 Add-TtmMapping -PublicationId 'tcm:0-224-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "jp_ja"
 
 Add-TtmMapping -PublicationId 'tcm:0-225-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "ko_kr"
 Add-TtmMapping -PublicationId 'tcm:0-225-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "ko_kr"
 
 Add-TtmMapping -PublicationId 'tcm:0-217-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "nl_nl"
 Add-TtmMapping -PublicationId 'tcm:0-217-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "nl_nl"
 
 Add-TtmMapping -PublicationId 'tcm:0-214-1' -WebApplicationId LiveWebsite2_Homerun -RelativeUrl "es_es"
 Add-TtmMapping -PublicationId 'tcm:0-214-1' -WebApplicationId StagingWebsite2_Homerun -RelativeUrl "es_es"

 
##STEP 4
 update PUBLISH_STATES
  set STATE=1
  where PUBLICATION_ID in(208,215,211,221,218,216,209,219,210,213,222,212,223,220,224,225,217,214) and state=7


