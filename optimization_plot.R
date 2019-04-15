
ret_stat_plot  <- monthly_log_ret %>% timeSeries()

col = qualiPalette(ncol(ret_stat_plot), "Dark2")
weightsPie(minriskPortfolio, radius = 0.7, col = col)
mtext(text = "Minimal Risk MV Portfolio", side = 3, line = 1.5,
      font = 2, cex = 0.7, adj = 0)
