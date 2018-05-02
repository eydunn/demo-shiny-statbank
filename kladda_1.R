# install.packages("pxweb")
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

