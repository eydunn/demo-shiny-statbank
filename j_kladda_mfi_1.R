# install.packages("pxweb")
rm(list = ls())

library(pxweb)

api_catalogue()


staging_api <- pxweb_api$new(api = "pxweb/staging",
                             url = "http://pxweb/staging/api/[version]/[lang]",
                             description = "Staging - Statistics Faroe Islands",
                             languages = "en",
                             versions = "v1",
                             calls_per_period = 30,
                             period_in_seconds = 10,
                             max_values_to_download = 100000)

staging_api$write_to_catalogue()


interactive_pxweb()
18
14
1
1
y
y
y
*
*
d1 <- 
  get_pxweb_data(url = "http://pxweb/tomorrow/api/v1/fo/H2/PF/PF01/MFI_javni.px",
                 dims = list(instrument = c('*'),
                             sector = c('*'),
                             country = c('*'),
                             month = c('*')),
                 clean = TRUE)  
  

    

head(d1)
str(d1)

table(d1$fíggjaramboð)


17
1
2
5
1
'n'
'n'
'y'
1
4
1
'a'
'a'
'a'
40

d1 <- 
  get_pxweb_data(url = "http://pxweb/staging/api/v1/fo/H2/PF/PF01/MFI_vinna.px",
                 dims = list(instrument = c('*'),
                             "MFI-group" = c('*'),
                             industry = c('*'),
                             month = c('*')),
                 clean = TRUE)
head(d1)
str(d1)
table(d1$fíggjaramboð)
table(d1$vinnugrein)
