ui <- navbarPage("SuicideRate", theme = shinytheme("flatly"),
  tabPanel("Main",
    titlePanel(div(windowTitle = "SuicideRateSG", img(src = "suicide.jpeg", width = "100%", class = "bg"),)),
    
    Panel: Main>Summary             
    ##########################################
    
    tabsetPanel(type = "tabs",
      
      tabPanel("Summary",        
        sidebarLayout(
          sidebarPanel(h3("Data by Year"),
            selectInput("checkYear", "Select Year", choices = list("2019", "2018", "2017"),selected = "2019")),
          
          mainPanel(
            tabsetPanel(type = "tabs",
              tabPanel("Ranking", tableOutput("datahead")),
              tabPanel("No. of Graduates", plotOutput(outputId = "piePlot"))),)),
  
      tabPanel()))
