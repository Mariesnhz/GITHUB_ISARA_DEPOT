#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgreen', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of Waiting Times (Old Faithful Geyser)',  # Titre principal
             cex.main = 1.5, cex.lab = 1.2, cex.axis = 1.2,  # Taille du texte pour les axes et titre
             col.main = 'darkblue', col.lab = 'darkblue', col.axis = 'darkblue',  # Couleurs des textes
             font.lab = 2,  # Gras pour les labels des axes
        )
        
    })
}