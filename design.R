ui <- navbarPage("SuicideRate", theme = shinytheme("flatly"),
  tabPanel("Main",
    titlePanel(div(windowTitle = "GraduatEmploymentSG", img(src = "sg0.jpg", width = "100%", class = "bg"),)),
    
    Panel: Main>Summary             
    ##########################################
    
    tabsetPanel(type = "tabs",
      
      tabPanel("Summary",        
        sidebarLayout(
          sidebarPanel(h3("Data by Year"),
            selectInput("checkYear", "Select Year", choices = list("2018", "2017", "2016", "2015", "2014", "2013"),selected = "2018")),
          
          mainPanel(
            tabsetPanel(type = "tabs",
              tabPanel("Ranking", tableOutput("datahead")),
              tabPanel("No. of Graduates", plotOutput(outputId = "piePlot"))),)),
  
      tabPanel()))
