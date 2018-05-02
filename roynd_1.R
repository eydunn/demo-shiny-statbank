# install.packages("devtools")
# library(devtools)
# devtools::install_github("rOpenGov/pxweb", ref="development")


library(pxweb)

update_pxweb_apis()

staging_api <- pxweb_api$new(api = "pxweb/staging",
                             url = "http://pxweb/staging/api/[version]/[lang]/H2",
                             description = "Intranet staging area - statbank.hagstova.fo",
                             languages = c("fo", "en"),
                             versions = "v1",
                             calls_per_period = 30,
                             period_in_seconds = 10,
                             max_values_to_download = 100000)

staging_api$write_to_catalogue()

interactive_pxweb()

10
1
3
3
4
2
n
n
y
*
*

  myDataSetName <- 
  get_pxweb_data(url = "http://pxweb/staging/api/v1/fo/H2/AM/AM04/lon_ajtrmd_t.px",
                 dims = list(mánaður = c('*'),
                             virðisháttur = c('*')),
                 clean = FALSE)

  
  myDataSetName <- 
  get_pxweb_data(url = "http://pxweb/staging/api/v1/fo/H2/AM/AM04/lon_ajtrmd_t.px",
                 dims = list(mánaður = c('*'),
                             virðisháttur = c('*')),
                 clean = FALSE)


  
pxweb_api()

scb_pxweb_api <- pxweb_api$new(get_api = "api.scb.se")
scb_pxweb_api


api_catalogue()

install.packages("Rcpp")
library(Rcpp)
library(stringi)
