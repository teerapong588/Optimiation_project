
# Assign xts object to a new variable
# Then make it a timeSeries object before pluging into portfolioData
ret <- monthly_log_ret %>% timeSeries()

# Create a data opject to use in fportfolio
ret_dat <- portfolioData(data = ret)

# Show the stucture of the data
str(ret_dat, width = 65, strict.width = "cut")

tgSpec <- portfolioSpec()
print(tgSpec)
setRiskFreeRate(tgSpec) <- 0
getRiskFreeRate(tgSpec)

