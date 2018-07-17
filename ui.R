library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("mtcars Analysis"),
  
  sidebarLayout(
    sidebarPanel(
       h3("Pick no. of cylinders"),
       selectInput("cyls","Cylinders",c(4,6,8),selected = NULL, multiple = FALSE),
       h5("This converts mpg to kmh and l/100 -"),
       numericInput("fuel","Enter MPG:",0,min=1,max=100)
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot",br(),
                           h5('The data used in this app is from the "mtcars" dataset.'),
                           h5("The below plots MPG v HP for the selected no. of 
                               cylinders:"),
                           plotOutput("out1")
                           ),
                  tabPanel("Converter",br(),
                           h5("Below are the respective KM/l and l/100 values
                              corresponding to the input MPG."),
                           h3("KM/l:"),
                           textOutput("out2"),
                           h3("l/100:"),
                           textOutput("out3"))
                  )
  )
)))
