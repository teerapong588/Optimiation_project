
ret_stat_plot  <- monthly_log_ret %>% timeSeries()

time_series_plot <- function() {
  ret <- monthly_log_ret %>% as.data.frame()
  ret$Date <- rownames(ret)
  ret <- melt(ret, id.vars = "Date")
  ggplot(data = ret, aes(x=Date, y=value, group = variable)) +
    geom_line() +
    facet_grid(variable ~ ., scale='free_y') +
    theme(panel.spacing = unit(1, "lines"))
}

den_plot <- function() {
  ret <- monthly_log_ret %>% as.data.frame()
  ret$Date <- rownames(ret)
  ret <- melt(ret, id.vars = "Date")
  ggplot(data = ret, aes(x=value,group = variable)) +
    geom_density(aes(fill = variable), alpha = 1) +
    facet_wrap(variable ~ ., scale='free_y', ncol =3) +
    theme(panel.spacing = unit(1, "lines"),
          panel.background = element_rect(fill = "#BFD5E3", colour = "#6D9EC1",
                                          size = 2, linetype = "solid"))
    
}

basic_stats_plot <- function() {
  assetsBasicStatsPlot(ret_stat_plot, title = "", description = "", keyOffset = c(0, 0.5))
  
}

moment_plot <- function() {
  assetsMomentsPlot(ret_stat_plot, title = "", description = "", keyOffset = c(0, 0.5))
}
  

box_stats_plot <- function() {
  assetsBoxStatsPlot(ret_stat_plot, title = "", description = "", keyOffset = c(0, 0.5))
}


cor_plot <- function(){
  
  dat_cor_plot <- monthly_log_ret %>% as.data.frame() %>% cor()
  p.mat <- cor.mtest(dat_cor_plot)$p
  
  col3 <- colorRampPalette(c("red", "white", "blue")) 
  corrplot(dat_cor_plot, method = "color", col = col3(100),
           type = "upper", order = "hclust", number.cex = .7,
           addCoef.col = "black", # Add coefficient of correlation
           tl.col = "black", tl.srt = 90, # Text label color and rotation
           # Combine with significance
           p.mat = p.mat, sig.level = 0.01, insig = "blank", 
           # hide correlation coefficient on the principal diagonal
           diag = FALSE)
  
}



