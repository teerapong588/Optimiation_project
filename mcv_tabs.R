##===================================================================================================================
# Tab to show in basic statistics plot

mcv_tab1 <- tabPanel("Equally Weights",
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_ew1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_ew2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_ew3")
                         )
                       )
)

mcv_tab2 <- tabPanel("Minimum-Risk Weights",
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_min_risk1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_min_risk2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_min_risk3")
                         )
                       )
)

mcv_tab3 <- tabPanel("Global-Min-Var Weights",
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_globmin1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_globmin2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("mcv_globmin3")
                         )
                       )
)

mcv_tab4 <- tabPanel("Performance attribution",
                           fluidRow( 
                             column(12,
                                    plotOutput("mcv_performance1")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mcv_performance2")
                             )
                           ),
                           fluidRow( 
                             column(12,
                                    plotOutput("mcv_performance3")
                             )
                           )
)

mcv_tab5 <- tabPanel("Efficient Frontier",
                           fluidRow( 
                             column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                    plotOutput("mcv_frontier1", height = "100%", width = "100%")
                                    )
                             )
                           )
)


mcv_tabs <- tabsetPanel(mcv_tab1,
                          mcv_tab2,
                          mcv_tab3,
                          mcv_tab4,
                          mcv_tab5)
















