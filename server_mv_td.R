## Linked from mv_td_plot.R
## Show weights of a mean-variance framwork of equal weights

output$equalWeightPlot1 <- renderPlot(
  mv_td_equal_weight_plot1()
)

output$equalWeightPlot2 <- renderPlot(
  mv_td_equal_weight_plot2()
)

output$equalWeightPlot3 <- renderPlot(
  mv_td_equal_weight_plot3()
)

## Linked from mv_td_plot.R
## Show weights of a mean-variance framwork of minimun risk portfolio

output$minRiskPlot1 <- renderPlot(
  mv_td_min_risk_plot1()
)

output$minRiskPlot2 <- renderPlot(
  mv_td_min_risk_plot2()
)

output$minRiskPlot3 <- renderPlot(
  mv_td_min_risk_plot3()
)

## Linked from mv_td_plot.R
## Show weights of a mean-variance framwork of minimun risk portfolio

output$globminPlot1 <- renderPlot(
  mv_td_globmin_plot1()
)

output$globminPlot2 <- renderPlot(
  mv_td_globmin_plot2()
)

output$globminPlot3 <- renderPlot(
  mv_td_globmin_plot3()
)

## Linked from mv_td_plot.R
## Show weights of a mean-variance framwork of minimun risk portfolio

output$tangenPlot1 <- renderPlot(
  mv_td_tangen_plot1()
)

output$tangenPlot2 <- renderPlot(
  mv_td_tangen_plot2()
)

output$tangenPlot3 <- renderPlot(
  mv_td_tangen_plot3()
)

## Linked from mv_td_plot.R
## Show efficient frontier of a long only mean-variance framwork 

output$efficientPlot1 <- renderPlot(
  mv_td_efficient_plot1()
)

## Show efficient frontier of a long only mean-variance framwork using montecarlo
output$efficientPlot2 <- renderPlot(
  mv_td_efficient_plot2()
)

## Linked from mv_td_plot.R
## Show performance attribution of a long only mean-variance framwork 

output$performancePlot1 <- renderPlot(
  mv_td_performance_plot1()
)

output$performancePlot2 <- renderPlot(
  mv_td_performance_plot2()
)

output$performancePlot3 <- renderPlot(
  mv_td_performance_plot3()
)