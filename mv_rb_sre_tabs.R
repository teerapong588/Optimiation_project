mv_rb_sre_tab1 <- tabPanel("Minimum Risk",
                            fluidRow( 
                              column(12,
                                     plotOutput("mv_rb_sre_min_risk1")
                              )
                            ),
                           fluidRow( 
                             column(12,
                                        plotOutput("mv_rb_sre_min_risk2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                        plotOutput("mv_rb_sre_min_risk3")
                             )
                           )
)

mv_rb_sre_tab2 <- tabPanel("Global Min Variance",
                              fluidRow( 
                                column(12,
                                       plotOutput("mv_rb_sre_grobmin1")
                                )
                              ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_sre_grobmin2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_sre_grobmin3")
                             )
                           )
)

mv_rb_sre_tab3 <- tabPanel("Tangency Portfolio",
                              fluidRow( 
                                column(12,
                                       plotOutput("mv_rb_sre_tangen1")
                                )
                              ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_sre_tangen2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_sre_tangen3")
                             )
                           )
)

mv_rb_sre_tab4 <- tabPanel("Performance attribution",
                              fluidRow( 
                                column(12,
                                       plotOutput("mv_rb_sre_performance1")
                                )
                              ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_sre_performance2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mv_rb_sre_performance3")
                             )
                           )
)

mv_rb_sre_tab5 <- tabPanel("Efficient Frontier",
                              fluidRow( 
                                column(12,
                                       div(style = "height: 900px; width: 1000px;",
                                       plotOutput("mv_rb_sre_frontier1", height = "100%", width = "100%")
                                       )
                                )
                              )
)

mv_rd_sre_tabs <- tabsetPanel(mv_rb_sre_tab1,
                                 mv_rb_sre_tab2,
                                 mv_rb_sre_tab3,
                                 mv_rb_sre_tab4,
                                 mv_rb_sre_tab5)







