##==========================================================================================
# Assign xts object to a new variable
# Then make it a timeSeries object before pluging into portfolioData
ret <- monthly_log_ret %>% timeSeries::timeSeries()

##==========================================================================================
## Compute a Feasible Mean-CVaR Portfolio

mcv_ew_plot1 <- function() {
  cvarSpec <- portfolioSpec()
  setType(cvarSpec) <- "CVAR"
  nAssets <- ncol(ret)
  setWeights(cvarSpec) <- rep(1/nAssets, times = nAssets)
  setSolver(cvarSpec) <- "solveRglpk"
  ewPortfolio <- feasiblePortfolio(
    data = ret,
    spec = cvarSpec,
    constraints = "LongOnly")
  
  weightsPie(ewPortfolio, radius = 1, box = FALSE)
  text <- "Equal Weights Man-CVaR Portfolio"
  mtext(text, side = 3, line = 1.5, font = 2, cex = 1, adj = 0)
}

mcv_ew_plot2 <- function() {
  cvarSpec <- portfolioSpec()
  setType(cvarSpec) <- "CVAR"
  nAssets <- ncol(ret)
  setWeights(cvarSpec) <- rep(1/nAssets, times = nAssets)
  setSolver(cvarSpec) <- "solveRglpk"
  ewPortfolio <- feasiblePortfolio(
    data = ret,
    spec = cvarSpec,
    constraints = "LongOnly")
  weightedReturnsPie(ewPortfolio, radius = 1, box = FALSE, legend = FALSE)
  
}

mcv_ew_plot3 <- function() {
  cvarSpec <- portfolioSpec()
  setType(cvarSpec) <- "CVAR"
  nAssets <- ncol(ret)
  setWeights(cvarSpec) <- rep(1/nAssets, times = nAssets)
  setSolver(cvarSpec) <- "solveRglpk"
  ewPortfolio <- feasiblePortfolio(
    data = ret,
    spec = cvarSpec,
    constraints = "LongOnly")
  covRiskBudgetsPie(ewPortfolio, radius = 1, box = FALSE, legend = FALSE)
}

##==========================================================================================
## Compute the Mean-CVaR Portfolio with the Lowest Risk for a Given Return

mcv_min_risk_plot1 <- function() {
  minriskSpec <- portfolioSpec()
  setType(minriskSpec) <- "CVaR"
  setAlpha(minriskSpec) <- 0.05
  setSolver(minriskSpec) <- "solveRshortExact"
  setTargetReturn(minriskSpec) <- 0.025
  minriskPortfolio <- efficientPortfolio(data = ret, spec = minriskSpec,
                                         constraints = "LongOnly")
  print(minriskPortfolio)
  weightsPie(minriskPortfolio, radius = 1, box = FALSE)
  text <- "Minimum Risk CVaR Portfolio"
  mtext(text, side = 3, line = 1.5, font = 2, cex = 1, adj = 0)
}

mcv_min_risk_plot2 <- function() {
  minriskSpec <- portfolioSpec()
  setType(minriskSpec) <- "CVaR"
  setAlpha(minriskSpec) <- 0.05
  setSolver(minriskSpec) <- "solveRshortExact"
  setTargetReturn(minriskSpec) <- 0.025
  minriskPortfolio <- efficientPortfolio(data = ret, spec = minriskSpec,
                                         constraints = "LongOnly")
  print(minriskPortfolio)
  weightedReturnsPie(minriskPortfolio, radius = 1, box = FALSE, legend = FALSE)
}

mcv_min_risk_plot3 <- function() {
  minriskSpec <- portfolioSpec()
  setType(minriskSpec) <- "CVaR"
  setAlpha(minriskSpec) <- 0.05
  setSolver(minriskSpec) <- "solveRshortExact"
  setTargetReturn(minriskSpec) <- 0.025
  minriskPortfolio <- efficientPortfolio(data = ret, spec = minriskSpec,
                                         constraints = "LongOnly")
  covRiskBudgetsPie(minriskPortfolio, radius = 1, box = FALSE, legend = FALSE)
}


##==========================================================================================
## Compute the Global Minimum Mean-CVaR Portfolio

mcv_globmin_plot1 <- function() {
  globminSpec <- portfolioSpec()
  setType(globminSpec) <- "CVaR"
  setAlpha(globminSpec) <- 0.05
  setSolver(globminSpec) <- "solveRquadprog"
  setTargetReturn(globminSpec) <- 0.025
  globminPortfolio <- minriskPortfolio(data = ret, spec = globminSpec,
                                         constraints = "LongOnly")
  weightsPie(globminPortfolio, radius = 1)
  text <- "Global Minimum Risk Portfolio"
  mtext(text, side = 3, line = 1.5, font = 2, cex = 0.7, adj = 0)
  weightedReturnsPie(globminPortfolio, box = FALSE, radius = 1, legend = FALSE)
  
}

mcv_globmin_plot2 <- function() {
  globminSpec <- portfolioSpec()
  setType(globminSpec) <- "CVaR"
  setAlpha(globminSpec) <- 0.05
  setSolver(globminSpec) <- "solveRquadprog"
  setTargetReturn(globminSpec) <- 0.025
  globminPortfolio <- minriskPortfolio(data = ret, spec = globminSpec,
                                       constraints = "LongOnly")
  weightedReturnsPie(globminPortfolio, box = FALSE, radius = 1, legend = FALSE)
}

mcv_globmin_plot3 <- function() {
  globminSpec <- portfolioSpec()
  setType(globminSpec) <- "CVaR"
  setAlpha(globminSpec) <- 0.05
  setSolver(globminSpec) <- "solveRquadprog"
  setTargetReturn(globminSpec) <- 0.025
  globminPortfolio <- minriskPortfolio(data = ret, spec = globminSpec,
                                       constraints = "LongOnly")
  covRiskBudgetsPie(globminPortfolio, box = FALSE, radius = 1, legend = FALSE)
}

##==========================================================================================
## Mean-Cvar performance attribute

mcv_performance_plot1 <- function() {
  longSpec <- portfolioSpec()
  setType(longSpec) <- "CVaR"
  setAlpha(longSpec) <- 0.05
  setSolver(longSpec) <- "solveRquadprog"
  longFrontier <- portfolioFrontier(data = ret, spec = longSpec,
                                    constraints = "LongOnly")
  weightsPlot(longFrontier)
  text <- "Mean-CVaR Portfolio - Long Only Constraints"
  mtext(text, side = 3, line = 3, font = 2, cex = 0.9)
}

mcv_performance_plot2 <- function() {
  longSpec <- portfolioSpec()
  setType(longSpec) <- "CVaR"
  setAlpha(longSpec) <- 0.05
  setSolver(longSpec) <- "solveRquadprog"
  longFrontier <- portfolioFrontier(data = ret, spec = longSpec,
                                    constraints = "LongOnly")
  weightedReturnsPlot(longFrontier)
}

mcv_performance_plot3 <- function() {
  longSpec <- portfolioSpec()
  setType(longSpec) <- "CVaR"
  setAlpha(longSpec) <- 0.05
  setSolver(longSpec) <- "solveRquadprog"
  longFrontier <- portfolioFrontier(data = ret, spec = longSpec,
                                    constraints = "LongOnly")
  covRiskBudgetsPlot(longFrontier)
}


##==========================================================================================
## Mean-CVaR Long-only Portfolio Frontier

mcv_frontier_plot1 <- function() {
  longSpec <- portfolioSpec()
  setType(longSpec) <- "CVaR"
  setAlpha(longSpec) <- 0.05
  setNFrontierPoints(longSpec) <- 25
  setSolver(longSpec) <- "solveRquadprog"
  longFrontier <- portfolioFrontier(data = ret, spec = longSpec,
                                    constraints = "LongOnly")
  print(longFrontier)
  longFrontier <- portfolioFrontier(data = ret, spec = longSpec,
                                    constraints = "LongOnly")
  tailoredFrontierPlot(object = longFrontier, mText = "Mean-CVaR Portfolio - Long Only Constraints",
                       risk = "CVaR")
}






