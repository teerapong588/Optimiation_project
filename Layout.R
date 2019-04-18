source("bs_tabs.R", local = TRUE)
source("mv_td_tabs.R", local = TRUE)
source("mv_rb_kde_tabs.R", local = TRUE)
source("mv_rb_spe_tabs.R", local = TRUE)
source("mv_rb_covmcd_tabs.R", local = TRUE)
source("mv_rb_sre_tabs.R", local = TRUE)
source("mcv_tabs.R", local = TRUE)

Header <- dashboardHeader(title = "Portfolio Optimization")

Sidebar <- dashboardSidebar(
  sidebarMenu(id = "tabs",
      menuItem("Basic Statistics", tabName = "basic_stats"),
      menuItem("Mean-Variance", tabName = "two",
               menuSubItem(text = "Traditional", tabName = "traditional"),
               menuSubItem(text = "Kendall Estimator", tabName = "rb_kde"),
               menuSubItem(text = "Spearman Estimator", tabName = "rb_spe"),
               menuSubItem(text = "CovMcd Estimator", tabName = "rb_covmcd"),
               menuSubItem(text = "Shrinkage Estimator", tabName = "rb_sre")
               ),
      menuItem("Mean-Cvar", tabName = "mean-cvar"),
      menuItem("Back Testing", tabName = "backtesting",
               menuSubItem(text = "Traditional", tabName = "bt-traditional"),
               menuSubItem(text = "Robust", tabName = "bt-robust"),
               menuSubItem(text = "Shrinkage", tabName = "bt-shrinkage"),
               menuSubItem(text = "Bagging", tabName = "bt-bagging"),
               menuSubItem(text = "Mean-Cvar", tabName = "bt-mean-cvar"))
  )
)

Body <- dashboardBody(
  tabItems(
    #linked tabs from Tabs.R
    tabItem(tabName = "basic_stats", bs_tabs),
    tabItem(tabName = "traditional", mv_td_tabs),
    tabItem(tabName = "rb_kde", mv_rd_kde_tabs),
    tabItem(tabName = "rb_spe", mv_rd_spe_tabs),
    tabItem(tabName = "rb_covmcd", mv_rd_covmcd_tabs),
    tabItem(tabName = "rb_sre", mv_rd_sre_tabs),
    tabItem(tabName = "bagging", h2("Bagging")),
    tabItem(tabName = "mean-cvar", mcv_tabs),
    tabItem(tabName = "bt-traditional", h2("BT-Traditional")),
    tabItem(tabName = "bt-robust", h2("BT-Robust")),
    tabItem(tabName = "bt-shrinkage", h2("BT-Shrinkage")),
    tabItem(tabName = "bt-bagging", h2("BT-Bagging")),
    tabItem(tabName = "bt-mean-cvar", h2("BT-Mean-Cvar"))
    
  )
)


