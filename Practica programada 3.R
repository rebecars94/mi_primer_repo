library(shiny)

ui <- fluidPage(
  titlePanel("Planificador de Eventos"),
  sidebarLayout(
    sidebarPanel(
      textInput("nombre", "Nombre del Evento:"),
      selectInput("tema", "Tema de Evento:",
                  choices = c("Boda", "Fiesta de Cumpleaños", "Conferencia", "Otro")),
      numericInput("invitados", "Número de Invitados:", value = 25, min = 25, max = 120),
      selectInput("provincia", "Provincia:",
                  choices = c("San José", "Alajuela", "Cartago", "Heredia", "Guanacaste", "Puntarenas", "Limón"))
    
    ),
    mainPanel(
      h3(div("Vamos a planificar su dia especial!", style = "color:blue", align = "center")),
      tags$hr(style = "border-color:blue;"), 
      textOutput("evento_output"), 
      br(),
      tags$hr(),
      textOutput("tema_output"),
      br(),
      tags$hr(),
      textOutput("invitados_provincia_output")
    )
  )
)

server <- function(input, output) {
  output$evento_output <- renderText({
    evento <- input$nombre
    paste("Evento:", evento)
  })
  
  
  
  output$tema_output <- renderText({
    tema <- input$tema
    paste("Tema del Evento:", tema)
  })
  
  
  
  output$invitados_provincia_output <- renderText({
    tema <- input$tema
    invitados <- input$invitados
    provincia <- input$provincia
    paste( "Número de invitados y ubicación: El evento ", tema, " tendrá ", invitados, "invitados y será llevado a cabo en ", provincia,".")
  })
}

shinyApp(ui, server)





