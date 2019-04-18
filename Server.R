source("bs_plot.R", local = TRUE)
source("mv_td_plot.R", local = TRUE)
source("mv_rb_plot.R", local = TRUE)

myserver <- function(input,output,session){
  
  
  source("server_bs.R", local = TRUE)
  source("server_mv_td.R", local = TRUE)
  source("server_mv_rb_kde.R", local = TRUE)
  source("server_mv_rb_spe.R", local = TRUE)
  source("server_mv_rb_covmcd.R", local = TRUE)
  source("server_mv_rb_sre.R", local = TRUE)
  source("server_mcv.R", local = TRUE)
  

}




