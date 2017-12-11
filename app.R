#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(ggplot2)
library(dplyr)
library(gtrendsR)
require(zipcode)
library(ggrepel)
data("zipcode")

logtable<-read.csv("logtable.csv",header=TRUE)
logtable_crop <- logtable [,-c(1)]
# normalize the explanatory variables data frame
logtable_crop<-lapply(logtable_crop,as.numeric) %>% as.data.frame()
row.names(logtable_crop)<-logtable$location


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Variable Comparisons"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectInput('xcol','X-Axis', names(logtable_crop)),
        selectInput('color', 'Color Variable', names(logtable_crop)),
        sliderInput('colThreshold', "Quantile Color Cutoff G (red<G<teal)",0.5,min=0,max=1),
        sliderInput('numCities',"Number of Cities", 15, min=2, max=30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("citiesplot")
         #tableOutput("table")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   part<-reactive({
     set.seed(35)
     sample(rownames(logtable_crop[logtable_crop$suicides>0,]),input$numCities)
   })
   
   locs.toUse<-reactive({
     logtable_crop[part(),c("suicides",input$xcol,input$color)] %>% 
       mutate(suicides=log(suicides)) %>% mutate(pcolor=(.[[input$color]]>quantile(logtable_crop[[input$color]],input$colThreshold)))
   })
   
   output$table<-renderTable({
     locs.toUse()
   })
      
      # draw the histogram with the specified number of bins
   output$citiesplot<-renderPlot({
     finaltab<-locs.toUse()
     ggplot(finaltab,aes_string(x=input$xcol,y="suicides"))+geom_point(aes(color=(pcolor==TRUE)))+
       geom_label_repel(aes(fill=(pcolor==TRUE),label=part()),fontface = 'bold', color = 'black', 
                        box.padding = 0.5, point.padding = 1, segment.color = 'grey50')+
       theme_classic(base_size = 16)+
       theme(legend.position = "none", plot.title = element_text(size=15,hjust = 0.5), axis.text.x = element_text(size=5),
             axis.text.y = element_text(size=5))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

