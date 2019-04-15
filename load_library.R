using          <-function(...) {
  libs         <-unlist(list(...))
  req          <-unlist(lapply(libs,require,character.only=TRUE))
  need         <-libs[req==FALSE]
  if(length(need)>0){ 
    install.packages(need)
    lapply(need,require,character.only=TRUE)
  }
}

using("quantmod"
      ,"magrittr"
      ,"xts"
      ,"PerformanceAnalytics"
      ,"fPortfolio"
      ,"RSelenium"
      ,"rvest"
      ,"XML"
      ,"foreach"
      ,"dplyr"
      ,"fBasics"
      ,"ggplot2"
      ,"reshape2"
      ,"wesanderson"
      ,"corrplot"
      ,"shiny"
      ,"shinydashboard")