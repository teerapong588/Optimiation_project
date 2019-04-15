source("stat_plot.R", local = TRUE)
source("mv_td_plot.R", local = TRUE)

myserver <- function(input,output,session){
  
  ## Liked function from stat_plot.R
  ## Show basic statistics plot
  
  output$timeSeries <- renderPlot(
    time_series_plot()
  )
  
  output$densityPlot <- renderPlot(
    den_plot()
  )
  
  output$basicStatsPlot <- renderPlot(
    basic_stats_plot()
  )
  
  output$basicBoxStatsPlot <- renderPlot(
    box_stats_plot()
  )
  
  output$corPlot <- renderPlot(
    cor_plot()
  )
  
  output$momentPlot <- renderPlot(
    moment_plot()
  )
  
  ## Linked from mv_td_plot.R
  ## Show weights of a mean-variance framwork of equal weights
  
  output$equalWeightPlot1 <- renderPlot(
    equal_weight_plot1()
  )
  
  output$equalWeightPlot2 <- renderPlot(
    equal_weight_plot2()
  )
  
  output$equalWeightPlot3 <- renderPlot(
    equal_weight_plot3()
  )
  
  ## Linked from mv_td_plot.R
  ## Show weights of a mean-variance framwork of minimun risk portfolio
  
  output$minRiskPlot1 <- renderPlot(
    min_risk_plot1()
  )
  
  output$minRiskPlot2 <- renderPlot(
    min_risk_plot2()
  )
  
  output$minRiskPlot3 <- renderPlot(
    min_risk_plot3()
  )
  
  ## Linked from mv_td_plot.R
  ## Show weights of a mean-variance framwork of minimun risk portfolio
  
  output$globminPlot1 <- renderPlot(
    globmin_plot1()
  )
  
  output$globminPlot2 <- renderPlot(
    globmin_plot2()
  )
  
  output$globminPlot3 <- renderPlot(
    globmin_plot3()
  )
  
  ## Linked from mv_td_plot.R
  ## Show weights of a mean-variance framwork of minimun risk portfolio
  
  output$tangenPlot1 <- renderPlot(
    tangen_plot1()
  )
  
  output$tangenPlot2 <- renderPlot(
    tangen_plot2()
  )
  
  output$tangenPlot3 <- renderPlot(
    tangen_plot3()
  )
  
  ## Linked from mv_td_plot.R
  ## Show efficient frontier of a long only mean-variance framwork 
  
  output$efficientPlot1 <- renderPlot(
    efficient_plot1()
  )
  
  ## Show efficient frontier of a long only mean-variance framwork using montecarlo
  output$efficientPlot2 <- renderPlot(
    efficient_plot2()
  )
  
  ## Linked from mv_td_plot.R
  ## Show performance attribution of a long only mean-variance framwork 
  
  output$performancePlot1 <- renderPlot(
    performance_plot1()
  )
  
  output$performancePlot2 <- renderPlot(
    performance_plot2()
  )
  
  output$performancePlot3 <- renderPlot(
    performance_plot3()
  )

}




