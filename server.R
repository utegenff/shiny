library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)
library(DT)
library(knitr)
library(kableExtra)
library(ggthemes)
library(plotly)

library(rsconnect)
library(shinythemes)

##########################################
####   Attaching datasets             ####
##########################################

#data <- read.csv("data/employment_data.csv")

data <- readcvs("dataset.cvs")

##########################################
####   Shiny server                   ####
##########################################

server <- function(session, input, output) {

  #### Panel: Main>Summary
  ################################################
  
  datahead section
  ###########################################
  output$datahead <- renderPrint({
    data %>%
      filter(year == input$checkYear) %>%
      group_by(country) %>%
      select(country, female, male) %>%
      summarise_all(funs(mean)) %>%
      mutate_if(is.numeric, round, 0) %>%
      #summarise_at(.vars = names(.)[8], list(min, max)) %>%
      kable("html", col.names = c("Country", "Female", "Male")) %>%
      kable_styling(c("striped", "hover"), full_width = T)})
  
  piePlot section
  ###########################################
  output$piePlot <- renderPlot({
    colmap <-
      c("#bdb2ff", # NUS "#ffc6ff", # NTU "#fffffc", # SMU "#33658A", # SIT "#3a506b", # SUTD "#577590", # SUSS "#43aa8b",
        # NIE "#90be6d", # SP "#f9c74f", # NP "#f8961e", # TP "#f3722c", # NAYANG POLY "#f94144", # RP "#ffadad",
        # NAFA DEG "#ffd6a5", # LAS DEG "#fdffb6", # NAFA DIP "#caffbf", # NAFA DEG "#a8dadc"  # ITE)
    
}
