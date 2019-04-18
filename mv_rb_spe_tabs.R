mv_rb_spe_tab1 <- tabPanel("Minimum Risk",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_min_risk1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_min_risk2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_min_risk3")
                             )
                           )
)

mv_rb_spe_tab2 <- tabPanel("Global Min Variance",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_grobmin1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_grobmin2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_grobmin3")
                             )
                           )
)

mv_rb_spe_tab3 <- tabPanel("Tangency Portfolio",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_tangen1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_tangen2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_tangen3")
                             )
                           )
)

mv_rb_spe_tab4 <- tabPanel("Performance attribution",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_performance1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_performance2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_spe_performance3")
                             )
                           )
)

mv_rb_spe_tab5 <- tabPanel("Efficient Frontier",
                           fluidRow( 
                             column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                    plotOutput("mv_rb_spe_frontier1", height = "100%", width = "100%")
                                    )
                             )
                           )
)

mv_rd_spe_tabs <- tabsetPanel(mv_rb_spe_tab1,
                              mv_rb_spe_tab2,
                              mv_rb_spe_tab3,
                              mv_rb_spe_tab4,
                              mv_rb_spe_tab5)







