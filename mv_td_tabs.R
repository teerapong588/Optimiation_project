##===================================================================================================================
# Tab to show in basic statistics plot

mv_td_tab1 <- tabPanel("Equally Weights",
                       fluidRow( 
                         column(12,
                          plotOutput("equalWeightPlot1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("equalWeightPlot2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("equalWeightPlot3")
                         )
                       )
)

mv_td_tab2 <- tabPanel("Minimum-Risk Weights",
                       fluidRow( 
                         column(12,
                                plotOutput("minRiskPlot1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("minRiskPlot2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("minRiskPlot3")
                         )
                       )
)

mv_td_tab3 <- tabPanel("Global-Min-Var Weights",
                       fluidRow( 
                         column(12,
                                plotOutput("globminPlot1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("globminPlot2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("globminPlot3")
                         )
                       )
)

mv_td_tab4 <- tabPanel("Tangency Weights",
                       fluidRow( 
                         column(12,
                                plotOutput("tangenPlot1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("tangenPlot2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("tangenPlot3")
                         )
                       )
)

mv_td_tab5 <- tabPanel("Efficient Frontier",
                       fluidRow( 
                         column(12,
                                plotOutput("efficientPlot1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("efficientPlot2")
                         )
                       )
)

mv_td_tab6 <- tabPanel("Performance Attribution",
                       fluidRow( 
                         column(12,
                                plotOutput("performancePlot1")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("performancePlot2")
                         )
                       ),
                       fluidRow( 
                         column(12,
                                plotOutput("performancePlot3")
                         )
                       )
)


mv_td_tabs <- tabsetPanel(mv_td_tab1,
                       mv_td_tab2,
                       mv_td_tab3,
                       mv_td_tab4,
                       mv_td_tab5,
                       mv_td_tab6)
















