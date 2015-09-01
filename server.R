library(shiny)
library(scales)
library(ggplot2)

shinyServer(
  function(input, output) {
  
    #marketingData <- NULL #read.csv("data/Assignment01.csv")
    if(is.null(marketingData) || is.na(marketingData))
    {
      rawDataLink <- "https://raw.githubusercontent.com/ahal64/FIT3152/master/www/data/Assignment01.csv"
      marketingData <- read.csv(rawDataLink)
      if(is.null(marketingData) || is.na(marketingData))
      {
        marketingData <- read.csv(url(rawDataLink))
      }
    }
    
    output$graph<- renderPlot({
      dataCol<-input$graphDisp
      graphGeom <- input$graphType
      pos<-input$pos #dodge or stacked
      
      if(graphGeom == "Bar")
      {
        graph <- geom_bar(stat="identity")
      }
      else if(graphGeom == "Line")
      {
        graph <- geom_line(stat="identity")
      }
      else if(graphGeom == "Point")
      {
        graph <- geom_point(stat="identity")
      }
      else
      {
        graph <- geom_density(stat="identity")
      }
      

      #PromotionType & Sales Unit
      if(dataCol == 1)
      {
        qplot(marketingData$promotion_type,
              marketingData$sales_unit,
              fill=marketingData$category_name,
              position=pos,
              data=marketingData)+scale_y_continuous(labels = comma)+graph
      }
      #PromotionType & Sales Velocity
      else if(dataCol == 2)
      {
        qplot(marketingData$promotion_type,
              marketingData$sales_velocity,
              fill=marketingData$category_name,
              position=pos,
              data=marketingData)+scale_y_continuous(labels = comma)+graph
      }
      else
      {
        
      }
      
    })
  
})
