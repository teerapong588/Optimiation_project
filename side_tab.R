side_tab1 <- tabPanel(selectizeInput('case', 'Pick a case', selected="A", choices = c("A", "B"), multiple = FALSE))
side_tab2 <- tabPanel(numericInput('num', 'Number', min = 1, max = 10, value = 1, step = 1))

