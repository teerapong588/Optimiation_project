##===================================================================================================================
# Tab to show in basic statistics plot

bs_tab1 <- tabPanel("Density",
                    fluidRow(column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                        plotOutput("densityPlot", height = "100%", width = "100%")
                                    )
                    ))
                    
)

bs_tab2 <- tabPanel("Basic Stats",
                    fluidRow(column(12,
                                    div(style = "height: 900px; width: 1000;",
                                        plotOutput("basicStatsPlot", height = "100%", width = "100%")
                                    )
                    ))
                    
)

bs_tab3 <- tabPanel("Box Stats",
                    fluidRow(column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                        plotOutput("basicBoxStatsPlot", height = "100%", width = "100%")
                                    )
                    ))
)

bs_tab4 <- tabPanel("Moment",
                    fluidRow(column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                        plotOutput("momentPlot", height = "100%", width = "100%")
                                    )
                    ))
)         

bs_tab5 <- tabPanel("Correlation",
                    fluidRow(column(12,
                                    div(style = "height: 900px; width: 1000px;",
                                        plotOutput("corPlot", height = "100%", width = "100%")
                                    )
                    ))
)

bs_tabs <- tabsetPanel(bs_tab1,
                       bs_tab2,
                       bs_tab3,
                       bs_tab4,
                       bs_tab5)


