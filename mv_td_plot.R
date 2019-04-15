##==========================================================================================
# Assign xts object to a new variable
# Then make it a timeSeries object before pluging into portfolioData
ret <- monthly_log_ret %>% timeSeries()

# Create a data opject to use in fportfolio
ret_dat <- portfolioData(data = ret)

##==========================================================================================
# Compute a feasible portfolio or equal weights

ewSpec <- portfolioSpec()
nAssets <- ncol(ret)
setWeights(ewSpec) <- rep(1/nAssets, times = nAssets)
ewPortfolio <- feasiblePortfolio(
  data = ret,
  spec = ewSpec,
  constraints = "LongOnly")

col1 <- divPalette(ncol(ret), "RdBu")

## Using weightsPie function
equal_weight_plot1 <- function() {

  weightsPie(ewPortfolio, box = FALSE, radius = 1, col = col1, rug = FALSE)
  mtext(text = "Equally Weighted MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

## Using weightedReturnsPie function

equal_weight_plot2 <- function() {
  weightedReturnsPie(ewPortfolio, box = FALSE, radius = 1, col = col1)
  mtext(text = "Equally Weighted MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

## Using covRiskBudgetsPie function
equal_weight_plot3 <- function() {
  covRiskBudgetsPie(ewPortfolio, box = FALSE, radius = 1, col = col1)
  mtext(text = "Equally Weighted MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

##==========================================================================================
# Compute a minimum risk efficient portfolio

minriskSpec <- portfolioSpec()
targetReturn <- getTargetReturn(ewPortfolio@portfolio)["mean"]
setTargetReturn(minriskSpec) <- targetReturn
minriskPortfolio <- efficientPortfolio(
  data = ret,
  spec = minriskSpec,
  constraints = "LongOnly")
col2 <- qualiPalette(ncol(ret), "Dark2")

min_risk_plot1 <- function() {
  
  weightsPie(minriskPortfolio, box = FALSE, radius = 1, col = col2)
  mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

min_risk_plot2 <- function() {
  weightedReturnsPie(minriskPortfolio, box = FALSE, radius = 1, col = col2) 
  mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

min_risk_plot3 <- function() {
  covRiskBudgetsPie(minriskPortfolio, box = FALSE, radius = 1, col = col2)
  mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

##==========================================================================================
# Compute the global minimum variance efficient portfolio

globminSpec <- portfolioSpec()
globminPortfolio <- minvariancePortfolio(
  data = ret,
  spec = globminSpec,
  constraints = "LongOnly")
print(globminPortfolio)

col3 <- seqPalette(ncol(ret), "YlGn")

globmin_plot1 <- function() {
  weightsPie(globminPortfolio, box = FALSE, col = col3)
  mtext(text = "Global Minimum Variance MV Portfolio", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
}

globmin_plot2 <- function() {
  weightedReturnsPie(globminPortfolio, box = FALSE, col = col3)
  mtext(text = "Global Minimum Variance MV Portfolio", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
}

globmin_plot3 <- function() {
  covRiskBudgetsPie(globminPortfolio, box = FALSE, col = col3)
  mtext(text = "Global Minimum Variance MV Portfolio", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
}

##==========================================================================================
# Compute the tangency  portfolio

tgSpec <- portfolioSpec()
setRiskFreeRate(tgSpec) <- 0
tgPortfolio <- tangencyPortfolio(
  data = ret,
  spec = tgSpec,
  constraints = "LongOnly")
print(tgPortfolio)

col4 <- seqPalette(ncol(ret), "BuPu")

tangen_plot1 <- function() {
  weightsPie(tgPortfolio, box = FALSE, col = col4)
  mtext(text = "Tangency MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

tangen_plot2 <- function() {
  weightedReturnsPie(tgPortfolio, box = FALSE, col = col4)
  mtext(text = "Tangency MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

tangen_plot3 <- function() {
  covRiskBudgetsPie(tgPortfolio, box = FALSE, col = col4)
  mtext(text = "Tangency MV Portfolio", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

##==========================================================================================
# Compute efficient frontier

portSpec <- portfolioSpec()
setNFrontierPoints(portSpec) <- 25
longFrontier <- portfolioFrontier(ret, portSpec)

efficient_plot1 <- function() {
  text <- "Mean-Variance Portfolio - Long Only Constraints"
  tailoredFrontierPlot(object = longFrontier, risk = "Cov")
  mtext(text, side = 3, line = 3, font = 2, cex = 0.9)
}

efficient_plot2 <- function() {
  par(mfrow = c(1, 1))
  set.seed(1953)
  frontierPlot(object = longFrontier, pch = 19, xlim = c(-0.002, 0.04),
               cex = 0.5, ylim = c(-0.001, 0.004))
  monteCarloPoints(object = longFrontier, mcSteps = 1000, pch = 19,
                   cex = 0.5)
  twoAssetsLines(object = longFrontier, col = "orange", lwd = 1)
  frontier <- frontierPoints(object = longFrontier)
  lines(frontier, col = "red", lwd = 2)
}

##==========================================================================================
# Compute performance attribution

portSpec <- portfolioSpec()
setNFrontierPoints(portSpec) <- 25
longFrontier <- portfolioFrontier(ret, portSpec)

performance_plot1 <- function() {
  text <- "Mean-Variance Portfolio - Long Only Constraints"
  weightsPlot(longFrontier)
  mtext(text, side = 3, line = 3, font = 2, cex = 0.9)
}

performance_plot2 <- function() {
  weightedReturnsPlot(longFrontier)
}

performance_plot3 <- function() {
  covRiskBudgetsPlot(longFrontier)
}























