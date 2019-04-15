source("side_tab.R", local = TRUE)
source("Tabs.R", local = TRUE)

Header <- dashboardHeader(title = "Portfolio Optimization")

Sidebar <- dashboardSidebar(
  sidebarMenu(id = "tabs",
      menuItem("Basic Statistics", tabName = "basic_stats"),
      menuItem("Mean-Variance", tabName = "two",
               menuSubItem(text = "Traditional", tabName = "traditional"),
               menuSubItem(text = "Robust", tabName = "robust"),
               menuSubItem(text = "Shrinkage", tabName = "shrinkage"),
               menuSubItem(text = "Bagging", tabName = "bagging")
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
    tabItem(tabName = "basic_stats",
            tabsetPanel(bs_tab1,
                        bs_tab2,
                        bs_tab3,
                        bs_tab4,
                        bs_tab5)),
    tabItem(tabName = "traditional",
            tabsetPanel(mv_td_tab1,
                        mv_td_tab2,
                        mv_td_tab3,
                        mv_td_tab4,
                        mv_td_tab5,
                        mv_td_tab6)),
    tabItem(tabName = "robust", h2("Robust")),
    tabItem(tabName = "shrinkage", h2("Shrinkage")),
    tabItem(tabName = "bagging", h2("Bagging")),
    tabItem(tabName = "mean-cvar", h2("Mean-Cvar")),
    tabItem(tabName = "bt-traditional", h2("BT-Traditional")),
    tabItem(tabName = "bt-robust", h2("BT-Robust")),
    tabItem(tabName = "bt-shrinkage", h2("BT-Shrinkage")),
    tabItem(tabName = "bt-bagging", h2("BT-Bagging")),
    tabItem(tabName = "bt-mean-cvar", h2("BT-Mean-Cvar"))
    
  )
)


