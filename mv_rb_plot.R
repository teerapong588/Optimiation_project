##==========================================================================================
# Assign xts object to a new variable
# Then make it a timeSeries object before pluging into portfolioData
ret <- monthly_log_ret %>% timeSeries::timeSeries()

##==========================================================================================
# Create mean risk portfolio with robust estimator
  
mv_rb_min_risk_plot1 <- function(estimator = "covEstimator", rb_text = "text") {
  minriskSpec <- portfolioSpec()
  setEstimator(minriskSpec) <- sprintf("%s", estimator)
  targetReturn <- 0.025
  setTargetReturn(minriskSpec) <- targetReturn
  setSolver(minriskSpec) <- "solveRshortExact"
  minriskPortfolio <- efficientPortfolio(
    data = ret,
    spec = minriskSpec,
    constraints = "LongOnly")
  print(minriskPortfolio)
  
  col2 <- qualiPalette(ncol(ret), "Dark2")
  weightsPie(minriskPortfolio, box = FALSE, radius = 1, col = col2, )
  mtext("", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
  title(sprintf("Minimum Risk Mean-Variance Portfolio using  %s", rb_text))
}


mv_rb_min_risk_plot2 <- function(estimator = "covEstimator", rb_text = "text") {
  
  minriskSpec <- portfolioSpec()
  setEstimator(minriskSpec) <- sprintf("%s", estimator)
  targetReturn <- 0.025
  setTargetReturn(minriskSpec) <- targetReturn
  setSolver(minriskSpec) <- "solveRshortExact"
  minriskPortfolio <- efficientPortfolio(
    data = ret,
    spec = minriskSpec,
    constraints = "LongOnly")
  col2 <- qualiPalette(ncol(ret), "Dark2")
  
  weightedReturnsPie(minriskPortfolio, box = FALSE, radius = 1, col = col2) 
  mtext("", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

mv_rb_min_risk_plot3 <- function(estimator = "covEstimator", rb_text = "text") {
  
  minriskSpec <- portfolioSpec()
  setEstimator(minriskSpec) <- sprintf("%s", estimator)
  targetReturn <- 0.025
  setTargetReturn(minriskSpec) <- targetReturn
  setSolver(minriskSpec) <- "solveRshortExact"
  minriskPortfolio <- efficientPortfolio(
    data = ret,
    spec = minriskSpec,
    constraints = "LongOnly")
  col2 <- qualiPalette(ncol(ret), "Dark2")
  
  covRiskBudgetsPie(minriskPortfolio, box = FALSE, radius = 1, col = col2)
  mtext("", side = 3, line = 1.5,
        font = 2, cex = 1, adj = 0)
}

# mv_rb_min_risk_plot(estimator = "covMcdEstimator", rb_text = "minimum covariance determinant estimator")

##==========================================================================================
# Create global minimun variance portfolio with robust estimator
  
  
mv_rb_globmin_plot1 <- function(estimator = "covEstimator", rb_text = "text") {

  globminSpec <- portfolioSpec()
  setEstimator(globminSpec) <- sprintf("%s", estimator)
  globminPortfolio <- minvariancePortfolio(
    data = ret,
    spec = globminSpec,
    constraints = "LongOnly")
  col3 <- seqPalette(ncol(ret), "YlGn")
  
  weightsPie(globminPortfolio, box = FALSE, radius = 1, col = col3)
  mtext("", side = 3,
      line = 1.5, font = 2, cex = 1, adj = 0)
  title(sprintf("Global Minimum Variance MV Portfolio using %s", rb_text))

}

mv_rb_globmin_plot2 <- function(estimator = "covEstimator", rb_text = "text") {

  globminSpec <- portfolioSpec()
  setEstimator(globminSpec) <- sprintf("%s", estimator)
  globminPortfolio <- minvariancePortfolio(
    data = ret,
    spec = globminSpec,
    constraints = "LongOnly")
  col3 <- seqPalette(ncol(ret), "YlGn")
  
  weightedReturnsPie(globminPortfolio, box = FALSE, radius = 1, col = col3)
  mtext("", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
}


mv_rb_globmin_plot3 <- function(estimator = "covEstimator", rb_text = "text") {

  globminSpec <- portfolioSpec()
  setEstimator(globminSpec) <- sprintf("%s", estimator)
  globminPortfolio <- minvariancePortfolio(
    data = ret,
    spec = globminSpec,
    constraints = "LongOnly")
  col3 <- seqPalette(ncol(ret), "YlGn")
  
  covRiskBudgetsPie(globminPortfolio, box = FALSE, radius = 1, col = col3)
  mtext("", side = 3,
        line = 1.5, font = 2, cex = 1, adj = 0)
}


# mv_rb_globmin_plot(estimator = "covMcdEstimator", rb_text = "Kendall's rank estimator")

##==========================================================================================
# Create tangency portfolio with robust estimator


mv_rb_tangen_plot1 <- function(estimator = "covEstimator", rb_text = "text") {
  
  tgSpec <- portfolioSpec()
  setEstimator(tgSpec) <- sprintf("%s", estimator)
  setRiskFreeRate(tgSpec) <- 0
  tgPortfolio <- tangencyPortfolio(
    data = ret,
    spec = tgSpec,
    constraints = "LongOnly")
  col4 <- seqPalette(ncol(ret), "BuPu")
  weightsPie(tgPortfolio, box = FALSE, radius = 1, col = col4)
  mtext("", side = 3, line = 1.5, font = 2, cex = 1, adj = 0)
  title(sprintf("Tangency MV Portfolio using %s", rb_text))
}  

mv_rb_tangen_plot2 <- function(estimator = "covEstimator", rb_text = "text") {
  
  tgSpec <- portfolioSpec()
  setEstimator(tgSpec) <- sprintf("%s", estimator)
  setRiskFreeRate(tgSpec) <- 0
  tgPortfolio <- tangencyPortfolio(
    data = ret,
    spec = tgSpec,
    constraints = "LongOnly")
  col4 <- seqPalette(ncol(ret), "BuPu")
  weightedReturnsPie(tgPortfolio, box = FALSE, radius = 1, col = col4)
  mtext("", side = 3, line = 1.5, font = 2, cex = 1, adj = 0)
}

mv_rb_tangen_plot3 <- function(estimator = "covEstimator", rb_text = "text") {
  
  tgSpec <- portfolioSpec()
  setEstimator(tgSpec) <- sprintf("%s", estimator)
  setRiskFreeRate(tgSpec) <- 0
  tgPortfolio <- tangencyPortfolio(
    data = ret,
    spec = tgSpec,
    constraints = "LongOnly")
  col4 <- seqPalette(ncol(ret), "BuPu")
  covRiskBudgetsPie(tgPortfolio, box = FALSE, radius = 1, col = col4)
  mtext("", side = 3, line = 1.5, font = 2, cex = 1, adj = 0)
}


# mv_rb_tangen_plot(estimator = "covMcdEstimator", rb_text = "Kendall's rank estimator")


##==========================================================================================
# Create a data opject to use in fportfolio

mv_rb_performance1 <- function(estimator = "covEstimator", rb_text = "text") {

  ## robustified portfolio
  portSpec <- portfolioSpec()
  setEstimator(portSpec) <- sprintf("%s", estimator)
  setNFrontierPoints(portSpec) <- 25
  portFrontier <- portfolioFrontier(
    data = ret,
    spec = portSpec,
    constraints = "LongOnly")
  col = qualiPalette(30, "Dark2")
  weightsPlot(portFrontier, col = col)
  mtext(sprintf("Performance attribution of portfolio using %s",rb_text), 
        side = 3, line = 3, font = 2, cex = 0.9)
}

mv_rb_performance2 <- function(estimator = "covEstimator", rb_text = "text") {
  portSpec <- portfolioSpec()
  setEstimator(portSpec) <- sprintf("%s", estimator)
  setNFrontierPoints(portSpec) <- 25
  portFrontier <- portfolioFrontier(
    data = ret,
    spec = portSpec,
    constraints = "LongOnly")
  weightedReturnsPlot(portFrontier, col = col)
}

mv_rb_performance3 <- function(estimator = "covEstimator", rb_text = "text") {
  portSpec <- portfolioSpec()
  setEstimator(portSpec) <- sprintf("%s", estimator)
  setNFrontierPoints(portSpec) <- 25
  portFrontier <- portfolioFrontier(
    data = ret,
    spec = portSpec,
    constraints = "LongOnly")
  covRiskBudgetsPlot(portFrontier, col = col)
}


# mv_rb_performance(estimator = "covMcdEstimator", rb_text = "Kendall's rank estimator")

##==========================================================================================
# Create an efficient frontier of robust portfolio

mv_rb_frontier1 <- function(estimator = "covEstimator", rb_text = "text") {

portSpec <- portfolioSpec()
setEstimator(portSpec) <- sprintf("%s", estimator)
setNFrontierPoints(portSpec) <- 25
mveFrontier <- portfolioFrontier(
  data = ret,
  spec = portSpec,
  constraints = "LongOnly")

tailoredFrontierPlot(
  mveFrontier,
  mText = sprintf("Efficient frontier using %s", rb_text),
  risk = "Sigma")

}

# mv_rb_frontier(estimator = "covMcdEstimator", rb_text = "Kendall's rank estimator")






