# Discovr Shiny application
#
library(shiny)
library(data.table)
library(Discovr)

# Define server logic for random distribution application
shinyServer(function(input, output) {

  file <- reactive({
    
    inFile <- input$file
    if (is.null(inFile)) {
      return(NULL)
    } else {
      inFile %>%
        rowwise() %>%
        do({
          fread(.$datapath, header = TRUE, data.table = FALSE)
          
        })
    }
  })
  

  data <- reactive({  
   if(is.null(file())){}
   calcData = file()
   calcData = calcData[1:2]
   return(calcData)
  })
  
  
  output$plot <- renderPlot({
    disc(mtcars[1:2])
  })

})
