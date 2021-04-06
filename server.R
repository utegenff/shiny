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
  
    
}
