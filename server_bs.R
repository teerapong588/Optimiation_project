## Liked function from bs_plot.R
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