source("mv_rb_plot.R")

## Minimum risk
output$mv_rb_kde_min_risk1 <- renderPlot(
  mv_rb_min_risk_plot1(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_min_risk2 <- renderPlot(
  mv_rb_min_risk_plot2(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_min_risk3 <- renderPlot(
  mv_rb_min_risk_plot3(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)


## Global minimum variance
output$mv_rb_kde_grobmin1 <- renderPlot(
  mv_rb_globmin_plot1(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_grobmin2 <- renderPlot(
  mv_rb_globmin_plot2(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_grobmin3 <- renderPlot(
  mv_rb_globmin_plot3(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

## Tangency 
output$mv_rb_kde_tangen1 <- renderPlot(
  mv_rb_tangen_plot1(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_tangen2 <- renderPlot(
  mv_rb_tangen_plot2(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_tangen3 <- renderPlot(
  mv_rb_tangen_plot3(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

## Performance attribute

output$mv_rb_kde_performance1 <- renderPlot(
  mv_rb_performance1(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_performance2 <- renderPlot(
  mv_rb_performance2(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)

output$mv_rb_kde_performance3 <- renderPlot(
  mv_rb_performance3(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)


## Frontier
output$mv_rb_kde_frontier1 <- renderPlot(
  mv_rb_frontier1(estimator = "kendallEstimator", rb_text = "minimum covariance determinant estimator")
)








