


library(shiny)
library(plotly)

shinyServer(function(input, output) {
        fit <- lm(mpg ~ ., data = mtcars)
        modelpred <- reactive({
                cylInput <- input$cylsld
                dispInput <- input$dispsld
                hpInput <- input$hpsld
                dratInput <- input$dratsld
                wtInput <- input$wtsld
                qsInput <- input$qssld
                carbInput <- input$carbsld
                amInput <- input$amsld
                vsInput <- input$vssld
                gearInput <- input$gearsld
                predict(
                        fit,
                        newdata = data.frame(
                                cyl = cylInput,
                                disp = dispInput,
                                hp = hpInput,
                                drat = dratInput,
                                wt = wtInput,
                                qsec = qsInput,
                                carb = carbInput,
                                vs = vsInput,
                                am = amInput,
                                gear = gearInput
                        )
                )
        })
        output$plot1 <- renderPlotly({
                hpInput <- input$hpsld
                Weight <- mtcars$wt
                ggplot(data = mtcars,
                       aes(
                               hp,
                               mpg,
                               size = mtcars$cyl,
                               color = Weight
                       )) +
                        geom_point(alpha = 0.5) +
                        ylim(0, 30) + xlab("Hourse power") + ylab("Miles per (US) gallon") +
                        geom_hline(yintercept = modelpred()[1]) +
                        geom_vline(xintercept = hpInput) +
                        geom_point(aes(hpInput, modelpred()[1]),
                                   color = "red",
                                   size = 4)
        })
        output$pred1 <- renderText({
                modelpred()[1]
        })
        output$table1 <- renderDataTable({
                cylInput <- input$cylsld
                dispInput <- input$dispsld
                hpInput <- input$hpsld
                dratInput <- input$dratsld
                wtInput <- input$wtsld
                qsInput <- input$qssld
                carbInput <- input$carbsld
                amInput <- input$amsld
                vsInput <- input$vssld
                gearInput <- input$gearsld
                data.frame(
                        cyl = cylInput,
                        disp = dispInput,
                        hp = hpInput,
                        drat = dratInput,
                        wt = wtInput,
                        qsec = qsInput,
                        carb = carbInput,
                        vs = vsInput,
                        am = amInput,
                        gear = gearInput
                )
        })
})
