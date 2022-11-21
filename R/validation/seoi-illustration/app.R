################################################################################

# CLIMR -- Smallest Effect of Interest Demonstration

################################################################################

library(shiny)
library(ggplot2)
library(bslib)

# User interface ---------------------------------------------------------------

ui <- fluidPage(
  
  theme = bs_theme(version = 5, bootswatch = "zephyr"),

  # Title

  titlePanel("Smallest Effect of Interest"),

  # Sidebar input
  
  fluidRow(
      column(12,
        
        tabsetPanel(
          
          # Main Plot
          
          tabPanel("Plot",
                   em("These normal distributions (SD = 1) illustrate the 
                      specified effect size."),
                   br(),
                   em("The distributions represent the data from each group in a
                      two-group experiment."),
                   plotOutput("distribution_plot",
                                      width = "100%")),
          
          # Statistical Summary
          
          tabPanel("Verbal Summary",
                   strong("Your input can be summarized as follows:"),
                   htmlOutput("stat_summary"))
          
        ),
        
        # Mean Difference Input
        
        sliderInput("smd",
                    "Specify a Population Standardized Mean Difference",
                    min   = 0.00,
                    max   = 2.50,
                    step  = 0.01,
                    round = FALSE,
                    value = 0,
                    pre   = "&delta; = ",
                    width = "75%")
        )

  )
)

# Server -----------------------------------------------------------------------

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distribution_plot <- renderPlot({
    
    df <- data.frame(
      x = -4:6,
      y = seq(0, 1, 1/10)
    )
    
    ggplot(df,
           aes(
             x = x,
             y = y
           )) +
      geom_vline(
        xintercept = 0,
        linetype = "dotted"
      ) +
      geom_vline(
        xintercept = input$smd,
        linetype = "dashed",
        alpha = .50
      ) +
      geom_area(
        stat = "function",
        fun  = dnorm,
        args = list(mean = 0),
        fill = "#01161E",
        alpha = 2/3
      ) +
      geom_area(
        stat = "function",
        fun  = dnorm,
        args = list(mean = input$smd),
        fill = "#AA6373",
        alpha = 2/3
      ) +
      scale_x_continuous(
        breaks = seq(-2.50, 2.50, 0.50)
      ) +
      labs(
        y = "",
        x = ""
      ) +
      theme_minimal()
    
  })
  
  output$stat_summary <- renderText(
    
    paste("<br>Any standardized mean difference in the population greater than
    ", "&delta;", " = ", format(as.numeric(input$smd), nsmall = 2, digits = 2), 
    " would be regarded as support for the theoretical hypothesis.<br><br>If a 
    well-conducted study estimated this effect with a confidence interval (with 
    a prespecified width) whose upper bound excluded ", 
    format(as.numeric(input$smd), nsmall = 2, digits = 2), ", the result would 
    be incompatible with the theoretical hypothesis.", "<br><br>", sep = "")
    
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
