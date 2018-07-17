library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$out1 <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- input$cyls
    mtSub <- subset(mtcars,mtcars$cyl==x)
    # draw the histogram with the specified number of bins
    plot(mtSub$mpg, mtSub$hp, xlab = "MPG", ylab = "HP", main = "MPG v HP", 
         xlim = c(0,40), ylim = c(0,350),col=rainbow(25), cex=3, pch=1.5)
  })
  kml <- reactive({
    input$fuel * 0.354
  })
  l100 <- reactive({
    282.5/input$fuel
  })
  output$out2 <- renderText({
    kml()
    })
  output$out3 <- renderText({
    l100()
    })
  
})
