mv_rb_covmcd_tab1 <- tabPanel("Minimum Risk",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_min_risk1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_min_risk2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_min_risk3")
                             )
                           )
)

mv_rb_covmcd_tab2 <- tabPanel("Global Min Variance",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_grobmin1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_grobmin2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_grobmin3")
                             )
                           )
)

mv_rb_covmcd_tab3 <- tabPanel("Tangency Portfolio",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_tangen1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_tangen2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_tangen3")
                             )
                           )
)

mv_rb_covmcd_tab4 <- tabPanel("Performance attribution",
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_performance1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_performance2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_covmcd_performance3")
                             )
                           )
)

mv_rb_covmcd_tab5 <- tabPanel("Efficient Frontier",
                           fluidRow( 
                             column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                    plotOutput("mv_rb_covmcd_frontier1", height = "100%", width = "100%")
                                    )
                             )
                           )
)

mv_rd_covmcd_tabs <- tabsetPanel(mv_rb_covmcd_tab1,
                              mv_rb_covmcd_tab2,
                              mv_rb_covmcd_tab3,
                              mv_rb_covmcd_tab4,
                              mv_rb_covmcd_tab5)







