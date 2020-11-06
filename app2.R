library(shiny)
library(plotly)
library(dplyr)
library(tidyverse)

ui <- fluidPage(
  titlePanel("Air Passenger Travel Number from 2008-2019"),
  
  
  column(5, h4("Select the year to see the number of travellers in that year"),
  selectInput("num_passenger", "Year", c(2008:2019))),
  
  mainPanel(
    plotOutput("number")
  )
)

Air<-read.csv("ausair.csv")
x<-c(1,2,3,4,5,6,7,8,9,10,11,12)


server <- function(input, output,session){
  
  
  output$number<-renderPlot({
    z<-(as.integer(input$num_passenger)-2007)*12-11
    y<-(as.integer(input$num_passenger)-2007)*12
    
    plot(x,Air[z:y,1],type="l",main=paste("Number of Travellers in",input$num_passenger, sep=" "), 
         xlab = "Month Number", ylab="Number of Passenger(in thousands)")
    
    axis(side=1,1:12,cex.axis=1)
  })  
  
}

shinyApp(ui = ui, server = server)

