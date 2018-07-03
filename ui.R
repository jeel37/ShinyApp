library(shiny)
library(plotly)
shinyUI(fluidPage(
  
  titlePanel("Titanic Data"),
  h3("Documentation"),
  p("This dataset is a record of who survived the titanic tragedy and who did not, and what category of Age, Sex and Class they belonged to."), 
  p("The first tab shows the survival comparison of Male and Female passengers for the selected data. 
    The second tab shows the survival comparison of passengers belonging to First Class, Second Class, Third Class and Crew members for the selected data.
    The third tab show the survival of Children for the selected data.
    The fourth tab shows the survival of Adults for the selected data."),
  h4("Instructions"),
  p("Select the categories whose survival you want to know about and click on the button 'How many survived?'. Then click on the tabs you want to browse the results."),
  br(),
  sidebarLayout(position = "left",
    sidebarPanel(
      h3('Select Gender'),
      checkboxInput('male', 'Male', value = TRUE),
      checkboxInput('female', 'Female', value = TRUE),
      
      h3('Select Class'),
      checkboxInput('one', '1st', value = TRUE),
      checkboxInput('two', '2nd', value = TRUE),
      checkboxInput('three', '3rd', value = TRUE),
      checkboxInput('crew', 'Crew', value = TRUE),
      
      h3('Select Age'),
      checkboxInput('child', 'Child', value = TRUE),
      checkboxInput('adult', 'Adult', value = TRUE),
      
      submitButton("How many Survived?")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Sex" ,plotlyOutput("Plot1", width = "500px")),
        tabPanel("Class",plotlyOutput("Plot2", width = "500px")),
        tabPanel("Child", plotlyOutput("Plot3", width = "500px")),
        tabPanel("Adult", plotlyOutput("Plot4", width = "500px"))
      )
    )
  )
))