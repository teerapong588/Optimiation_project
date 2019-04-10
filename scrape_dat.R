#===============================================================================================================
# Scrape data from Thaimutaulfund

#To start with we navigate to a url.

downloadPath <- "~/Downloads"

fprof <- makeFirefoxProfile(list(
  browser.download.folderList = 2L,  
  browser.download.manager.showWhenStarting = FALSE,
  browser.download.dir = downloadPath,
  browser.helperApps.neverAsk.openFile = "application/excel",
  browser.helperApps.neverAsk.saveToDisk = "application/excel",
  browser.helperApps.alwaysAsk.force = FALSE,
  browser.download.manager.showAlertOnComplete = FALSE,
  browser.download.manager.closeWhenDone = TRUE )
)

gc()
rD             <- rsDriver(port = 4445L, browser = "firefox"
                           ,version = "latest", chromever = "latest"
                           ,extraCapabilities = fprof
                           ,verbose = T, check = TRUE)

remDr          <- rD[["client"]]


# Needed funds

funds <- c("TMBTM","SCBTMFPLUS","KFMTFI","TMBGF"
  ,"KF-CINCOME","SCBSETFUND","ABG","ABSL","ABSM"
  ,"JB25","ABWOOF")

# funds <- c("ABG","ABSL")

begin_year <- "2556"

nav_dat <- foreach (fund = funds, .verbose = T ) %do% {
  remDr$navigate("https://www.thaimutualfund.com/AIMC/aimc_navCenterSearch3.jsp?fbclid=IwAR1NLfxU5FOEjI_BC277XuGgTATfhttVMhiyk1EslZbcBVakaf5NnvYrH_k")
  Sys.sleep(5)
  
  remDr$findElement('xpath', "//select[@name = 'abbrName']")$clickElement()
  remDr$findElement('xpath', sprintf("//select[@name = 'abbrName']/option[@value = '%s']", fund))$clickElement()
  
  remDr$findElement('xpath', "//select[@name = 'data_year']")$clickElement()
  remDr$findElement('xpath', sprintf("//select[@name = 'data_year']/option[@value = '%s']", begin_year))$clickElement()
  
  remDr$findElement('xpath', "//input[@type = 'image' and @src='/brokerpage/096/images/btn_ok.gif']")$clickElement()
  
  Sys.sleep(10)
  doc <<- XML::htmlParse(remDr$getPageSource()[[1]], encoding ="UTF-8")
  date_path <- "//tr[@bgcolor = '#F2F2F2']/td[@class='table1'][1]"
  date <- xpathSApply(doc, date_path, xmlValue) %>%
    as.matrix() %>%
    as.data.frame() %>%
    as.Date(format="%d%m%Y")
  names(date) <- "Date"
  
  nav_path <- "//tr[@bgcolor = '#F2F2F2']/td[3]"
  nav <- xpathSApply(doc, nav_path, xmlValue) %>% as.matrix() %>% as.data.frame()
  names(nav) <- fund
  
  output <- cbind(date, nav)
  
}

# Merge all scraped data

for (i in 1:length(nav_dat)) {
  if (i == 1) {
    merged_nav_dat <- nav_dat[[i]]
  } else if (i == 2) {
    merged_nav_dat <- merge(merged_nav_dat, nav_dat[[i]], by="Date",all.x = TRUE)
  } else {
    merged_nav_dat <- merge(merged_nav_dat, nav_dat[[i]], by="Date",all.x = TRUE)
  }
}

# Order by Date variable
daily_nav <- merged_nav_dat[order(as.Date(merged_nav_dat$Date, format="%d/%m/%Y")),] %>% 
  na.locf(na.rm = FALSE, fromLast = TRUE) %>% 
  na.omit()

# Comvert dataframe to an xts object
xts_daily_nav <- xts(daily_nav, order.by = as.Date(daily_nav$Date, format="%d/%m/%Y"))[,-1]

# Change data type from Character to Double
storage.mode(xts_daily_nav) <- "double"

# Check result from a csv file
write.csv(daily_nav, file = "daily_nav.csv")

# Compute daily return
daily_log_ret      <- Return.calculate(xts_daily_nav, method = "log")[-1,]

# Convert daily price to monthly price
xts_monthly_nav <- to.monthly(xts_daily_nav, indexAt = "last", OHLC = FALSE)

# Compute monthly return
monthly_log_ret      <- Return.calculate(xts_monthly_nav, method = "log")[-1,]








