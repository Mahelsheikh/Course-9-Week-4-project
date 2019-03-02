

library(shiny)
shinyUI(fluidPage(
        titlePanel("Mtcars prediction model"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput(
                                "cylsld",
                                "Number of Cylinders",
                                min = 4,
                                max = 8,
                                value = 6,
                                step = 2
                        ),
                        sliderInput(
                                "dispsld",
                                "Displacement (cu.in.)",
                                min = 60,
                                max = 600,
                                value = 300,
                                step = 20
                        ),
                        sliderInput(
                                "hpsld",
                                "Gross horsepower",
                                min = 40,
                                max = 500,
                                value = 300,
                                step = 20
                        ),
                        sliderInput(
                                "dratsld",
                                "Rear axle ratio",
                                min = 1,
                                max = 6,
                                value = 3,
                                step = 0.2
                        ),
                        sliderInput(
                                "wtsld",
                                "Weight (1000 lbs)",
                                min = 1,
                                max = 7,
                                value = 3,
                                step = 0.2
                        ),
                        sliderInput(
                                "qssld",
                                "1/4 mile time",
                                min = 10,
                                max = 30,
                                value = 17,
                                step = 0.5
                        ),
                        sliderInput(
                                "carbsld",
                                "Number of carburetors",
                                min = 1,
                                max = 8,
                                value = 4,
                                step = 1
                        ),
                        sliderInput(
                                "vssld",
                                "Engin shape",
                                min = 0,
                                max = 1,
                                value = 0,
                                step = 1
                        ),
                        sliderInput(
                                "amsld",
                                "Transmission",
                                min = 0,
                                max = 1,
                                value = 0,
                                step = 1
                        ),
                        sliderInput(
                                "gearsld",
                                "Number of forward gears",
                                min = 3,
                                max = 5,
                                value = 4,
                                step = 1
                        ),
                        submitButton("Submit")
                ),
                
                mainPanel(tabsetPanel(
                        type = "tabs",
                        tabPanel(
                                h4("Documentation"),
                                h5(
                                        "Please select the required parametes for each variable then click submit"
                                ),
                                h5(
                                        "Graphical representation under the Plot tab and Numerical result under the result tab"
                                ),
                                h5("link for the ui.R file is:"),
                                helpText(a("ui.R file",href="https://github.com/Mahelsheikh/Course-9-Week-4-project/blob/master/ui.R",target="_blank")
                                   ),
                                h5("link for the server.R file is:"),
                                helpText(a("Server.R file",href="https://github.com/Mahelsheikh/Course-9-Week-4-project/blob/master/server.R",target="_blank")
                                   )
                        ),
                        tabPanel(
                                h4("Plot"),
                                plotlyOutput(
                                        "plot1",
                                        width = "90%",
                                        height = "400px",
                                        inline = FALSE
                                )
                        ),
                        tabPanel(
                                h4("Result"),
                                h3("Predicted Mile per (US) gallon:"),
                                textOutput("pred1"),
                                h3("For these values:"),
                                dataTableOutput("table1")
                        )
                        
                ))
        )
))