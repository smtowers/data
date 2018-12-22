#https://shiny.rstudio.com/articles/datatables.html
library(DT)

ui <- basicPage(
  h2("Mass Killing Data"),
  DT::dataTableOutput("mytable")
)

server <- function(input, output) {
  print(a)
  output$mytable = DT::renderDataTable({
     fname = "https://raw.githubusercontent.com/smtowers/data/master/Towers_et_al_public_mass_shootings_Sep_1994_to_Dec_2018.csv"
     #a = read.table(fname,header=T,as.is=T,sep=",")
     a = datatable(read.table(fname,header=T,as.is=T,sep=",")
                  ,escape=F
                  ,options=list(pageLength=200))
  })
}
  
shinyApp(ui, server)


