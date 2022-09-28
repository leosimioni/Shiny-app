characters <- read.csv("data/characters.csv")

intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Shiny App"),
  
  p("
    This project consists of creating a basic Shiny application. This app has two tabs and
    interactive visualizations. The data has information about the stats of the different drivers from the Mario Kart 8 game"),
  
  p(a(href = "https://www.kaggle.com/barelydedicated/mariokart8?select=characters.csv", "Data Source"))
)

select_values <- colnames(characters)
select_values <- select_values[! select_values %in% c('Character', 'Class')] # remove unwanted columns

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values,
    selected = 'Speed'
  )
)

main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Visualization",
  titlePanel("Characteristics of Mario Kart 8 drivers"),
  p("Choose variables."),
  sidebarLayout(
    sidebar_content, main_content
  )
)


ui <- navbarPage(
  "Characteristics of Mario Kart 8 drivers",
  intro_panel,
  second_panel
)