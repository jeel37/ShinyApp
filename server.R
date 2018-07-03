library(shiny)
library(MASS)
library(plotly)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  t <- function() {
    data("Titanic")
    t <- as.data.frame(Titanic)
    
    if(input$female == TRUE || input$male == TRUE)
    {
      if(!input$female)
        t <- t[t$Sex != 'Female',]
      if(!input$male)
        t <- t[t$Sex != 'Male',]
    }
    
    if(input$one == TRUE || input$two == TRUE || input$three == TRUE || input$crew == TRUE)
    {
      if(!input$one)
        t <- t[t$Class != '1st',]
      if(!input$two)
        t <- t[t$Class != '2nd',]
      if(!input$three)
        t <- t[t$Class != '3rd',]
      if(!input$crew)
        t <- t[t$Class != 'Crew',]
    }
    
    if(input$child == TRUE || input$adult == TRUE)
    {
      if(!input$child)
        t <- t[t$Age != 'Child',]
      if(!input$adult)
        t <- t[t$Age != 'Adult',]
    }
    return(t)
  }
  
  output$Plot1 <- renderPlotly({
    
    t = t()
    
    plot_ly(t, x = ~Survived, y = ~Freq, type = 'bar', color = ~Sex) %>%
      layout(barmode = 'stack', xaxis = list(title="Survived"))
    
  })
  
  output$Plot2 <- renderPlotly({
    
    t = t()
    
    plot_ly(t, x = ~Survived, y = ~Freq, type = 'bar', color = ~Class) %>%
      layout(barmode = 'stack')
  })
  
  output$Plot3 <- renderPlotly({
    
    t = t()
    
    plot_ly(t[t$Age == "Child",], x = ~Survived, y = ~Freq, type = 'bar')
    
  })
  
  output$Plot4 <- renderPlotly({
    
    t = t()
    
    plot_ly(t[t$Age != "Child",], x = ~Survived, y = ~Freq, type = 'bar')
  })
  
})
