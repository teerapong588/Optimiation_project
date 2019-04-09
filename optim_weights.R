
ret <- xts(daily_log_ret)

tgSpec <- portfolioSpec()
print(tgSpec)
setRiskFreeRate(tgSpec) <- 0
getRiskFreeRate(tgSpec)
