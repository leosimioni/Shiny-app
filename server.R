library(ggplot2)

characters <- read.csv("data/characters.csv")


server <- function(input, output) {
  output$plot <- renderPlot({

        characters$Character <- factor(characters$Character, 
        levels = characters$Character[order(characters$Class)])
    
    ggplot(data=characters, aes_string(x='Character', y=input$y_var, fill="Class")) +
      geom_bar(stat="identity", width=0.8) +
      labs(x="Character", y=input$y_var) + coord_flip()
    
  })
}

