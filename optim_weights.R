##==========================================================================================
# Assign xts object to a new variable
# Then make it a timeSeries object before pluging into portfolioData
ret <- monthly_log_ret %>% timeSeries()

# Create a data opject to use in fportfolio
ret_dat <- portfolioData(data = ret)

##==========================================================================================
# Compute a feasible portfolio

ewSpec <- portfolioSpec()
nAssets <- ncol(ret)
setWeights(ewSpec) <- rep(1/nAssets, times = nAssets)
ewPortfolio <- feasiblePortfolio(
  data = ret,
  spec = ewSpec,
  constraints = "LongOnly")
print(ewPortfolio)

col <- divPalette(ncol(ret), "RdBu")
weightsPie(ewPortfolio, radius = 0.7, col = col)
mtext(text = "Equally Weighted MV Portfolio", side = 3, line = 1.5,
      font = 2, cex = 0.7, adj = 0)

weightedReturnsPie(ewPortfolio, radius = 0.7, col = col)
mtext(text = "Equally Weighted MV Portfolio", side = 3, line = 1.5,
      font = 2, cex = 0.7, adj = 0)
covRiskBudgetsPie(ewPortfolio, radius = 0.7, col = col)
mtext(text = "Equally Weighted MV Portfolio", side = 3, line = 1.5,
      font = 2, cex = 0.7, adj = 0)

##==========================================================================================
# Compute a minimum risk efficient portfolio

minriskSpec <- portfolioSpec()
targetReturn <- getTargetReturn(ewPortfolio@portfolio)["mean"]
setTargetReturn(minriskSpec) <- targetReturn
minriskPortfolio <- efficientPortfolio(
  data = ret,
  spec = minriskSpec,
  constraints = "LongOnly")
print(minriskPortfolio)

col = qualiPalette(ncol(ret), "Dark2")
weightsPie(minriskPortfolio, radius = 1, col = col)
mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
weightedReturnsPie(minriskPortfolio, radius = 0.7, col = col) > mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
                                                                        font = 2, cex = 0.7, adj = 0)
covRiskBudgetsPie(minriskPortfolio, radius = 0.7, col = col)
mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 0.7, adj = 0)

##==========================================================================================
# Compute global minimum variance portfolio

globminSpec <- portfolioSpec()
globminPortfolio <- minvariancePortfolio(
  data = ret,
  spec = globminSpec,
  constraints = "LongOnly")
print(globminPortfolio)

col3 <- seqPalette(ncol(ret), "YlGn")
weightsPie(globminPortfolio, box = FALSE, col = col3)
mtext(text = "Global Minimum Variance MV Portfolio", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
weightedReturnsPie(globminPortfolio, box = FALSE, col = col3)
mtext(text = "Global Minimum Variance MV Portfolio", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
covRiskBudgetsPie(globminPortfolio, box = FALSE, col = col3)
mtext(text = "Global Minimum Variance MV Portfolio", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)

##==========================================================================================
# Compute a tangency portfolio
tgSpec <- portfolioSpec()
setRiskFreeRate(tgSpec) <- 0
tgPortfolio <- tangencyPortfolio(
  data = ret,
  spec = tgSpec,
  constraints = "LongOnly")
print(tgPortfolio)

col <- seqPalette(ncol(ret), "BuPu")
weightsPie(tgPortfolio, box = FALSE, col = col)
mtext(text = "Tangency MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 0.7, adj = 0)
weightedReturnsPie(tgPortfolio, box = FALSE, col = col)
mtext(text = "Tangency MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 0.7, adj = 0)
covRiskBudgetsPie(tgPortfolio, box = FALSE, col = col)
mtext(text = "Tangency MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 0.7, adj = 0)

##==========================================================================================
# Create bar plot instead of pie chart
col = rampPalette(ncol(ret), "purple2green")
weights <- 100 * as.vector(getWeights(tgPortfolio)) 
names <- as.vector(colnames(ret))
barplot(height = weights, names.arg = names,
          horiz = TRUE, las = 1, col = col)
title(main = "Weights of Long-Only Tangency Portfolio",
        xlab = "Weights %")

##==========================================================================================
# Compur efficient frontier

portSpec <- portfolioSpec()
setNFrontierPoints(portSpec) <- 5
longFrontier <- portfolioFrontier(ret, portSpec)
print(longFrontier)

#interactive plot the efficient frontier
longFrontier <- portfolioFrontier(ret)
# plot(longFrontier)

setNFrontierPoints(portSpec) <- 25
longFrontier <- portfolioFrontier(ret, portSpec)
text <- "Mean-Variance Portfolio - Long Only Constraints"
tailoredFrontierPlot(object = longFrontier, risk = "Cov")
mtext(text, side = 3, line = 3, font = 2, cex = 0.9)

text <- "Mean-Variance Portfolio - Long Only Constraints"
weightsPlot(longFrontier)
mtext(text, side = 3, line = 3, font = 2, cex = 0.9)
weightedReturnsPlot(longFrontier)
covRiskBudgetsPlot(longFrontier)

# Efficient frontier
par(mfrow = c(1, 1))
set.seed(1953)
frontierPlot(object = longFrontier, pch = 19, xlim = c(-0.002, 0.045),
             cex = 0.5, ylim = c(-0.001, 0.004))
monteCarloPoints(object = longFrontier, mcSteps = 1000, pch = 19,
                 cex = 0.5)
twoAssetsLines(object = longFrontier, col = "orange", lwd = 1)
frontier <- frontierPoints(object = longFrontier)
lines(frontier, col = "red", lwd = 2)














