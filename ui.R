library(shiny)
library(scales)
library(ggplot2)

shinyUI(fluidPage(
  
  titlePanel(
    h3("Data Science Assignment 1")
    ),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("graphDisp", 
                  label = ("Select Information to Display"), 
                  choices = list("PromotionType & Sales Unit" = 1,
                                 "PromotionType & Sales Velocity" = 2), 
                  selected = 1),
      
      selectInput("graphType", 
                  label = ("Select Graph Type"), 
                  choices = c("Bar","Line","Point","Density"), 
                  selected = "Bar"),
      radioButtons("pos", label = "Position",
                   choices = c("stack","dodge"),selected = "dodge"),
      selectInput("Facet",
                  label=("Facet Graph"),
                  choices = c("None",
                              "Sales Departments",
                              "Sales Month"),
                  selected = "None")
      
      
      #,img(src="images/marketing_sales.png",height = 120, width = 120,align = "center")
      ),
    mainPanel(plotOutput("graph"))
  )
  
))
