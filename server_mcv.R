source("mcv_plot.R", local = TRUE)

##==============================================================================
## Compute a Feasible Mean-CVaR Portfolio

output$mcv_ew1 <- renderPlot(
  mcv_ew_plot1()
)

output$mcv_ew2 <- renderPlot(
  mcv_ew_plot2()
)

output$mcv_ew3 <- renderPlot(
  mcv_ew_plot3()
)

##==============================================================================
## Mean-CVaR Portfolio with the Lowest Risk for a Given Return
output$mcv_min_risk1 <- renderPlot(
  mcv_min_risk_plot1()
)

output$mcv_min_risk2 <- renderPlot(
  mcv_min_risk_plot2()
)

output$mcv_min_risk3 <- renderPlot(
  mcv_min_risk_plot3()
)

##==============================================================================
## the Global Minimum Mean-CVaR Portfolio
output$mcv_globmin1 <- renderPlot(
  mcv_globmin_plot1()
)

output$mcv_globmin2 <- renderPlot(
  mcv_globmin_plot2()
)

output$mcv_globmin3 <- renderPlot(
  mcv_globmin_plot3()
)

##==============================================================================
## Mean-CVaR performance attribute
output$mcv_performance1 <- renderPlot(
  mcv_performance_plot1()
)

output$mcv_performance2 <- renderPlot(
  mcv_performance_plot2()
)

output$mcv_performance3 <- renderPlot(
  mcv_performance_plot3()
)

##==============================================================================
## Mean-CVaR Long-only Portfolio Frontier
output$mcv_frontier1 <- renderPlot(
  mcv_frontier_plot1()
)








