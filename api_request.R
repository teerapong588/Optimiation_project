
library(httr)

based_url <- "https://api.sec.or.th/FundFactsheet/fund/M0026_2539/investment"

token <- "715c1d0b99ed438ab7de47b737bed79e"

resp <- GET(based_url, add_headers("Ocp-Apim-Subscription-Key" = token))

parsed <- jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)
