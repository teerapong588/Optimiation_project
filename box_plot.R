
mul_time_dat <- monthly_log_ret %>% as.data.frame()
mul_time_dat$Date <- rownames(mul_time_dat)

melted_dat <- melt(mul_time_dat, id.vars="Date")

ret_for_box <- monthly_log_ret %>% as.data.frame()
boxPlot(ret_for_box)

ggplot(melted_dat, aes(x = variable, y = value)) +
  geom_boxplot(fill="blue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Fund's names", y = "Returns")
  
  