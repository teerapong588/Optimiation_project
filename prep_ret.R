source("load_library.R")

tickers <- c("PTT.BK","KTC.BK","CPALL.BK","MINT.BK"
             ,"SCB.BK","KBANK.BK","CPN.BK","AOT.BK")

start              <- "2005-11-1" 
end                <- "2018-1-1"

get_stock_data <- function(){
  func <- function(name) {
    get_data         <- getSymbols(name, from = start, to = end, auto.assign = F,src="yahoo")[ ,4]
    names(get_data)  <- name
    return(get_data)
  }
  stock_data <- lapply(tickers, function(x) func(x))
  x <- do.call(cbind, stock_data)
}

stock_series <- get_stock_data()

write.csv(as.data.frame(stock_series),"stock_series.csv")

# Manage NA and write into excel
daily_price        <- stock_series %>% as.data.frame()
daily_price        <- daily_price[colSums(is.na(daily_price)) < 100] %>% 
  na.locf(na.rm = FALSE) %>% 
  xts(order.by = as.Date(rownames(daily_price)))
write.csv(as.data.frame(daily_price),"daily_price.csv")

daily_log_ret      <- Return.calculate(xts(daily_price), method = "log")[-1,]
write.csv(as.data.frame(daily_log_ret),"daily_log_ret.csv")


