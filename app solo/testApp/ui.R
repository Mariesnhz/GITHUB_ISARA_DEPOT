#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel(
      "Old Faithful Geyser Data",
      windowTitle = "Histogram Geyser"
    ),
    

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30,
                        animate = TRUE,
                        step = 1),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    ),
    
    #fond coloré
    tags$style(HTML("
        body {
            background-color: #f0f8ff; /* vert foncé */
            font-family: Arial, sans-serif;
        }
        h1, h2, h3, h4 {
            color: #2c3e50; /* Couleur sombre pour les titres */
        }
    "))
)
