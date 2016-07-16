library(ggplot2)
library(shiny)
library(Cairo)
library(DT)
library(data.table)

options(shiny.usecairo=T)
options(shiny.autoreload.interval = 200)




shinyUI(pageWithSidebar(
  headerPanel(''),
  sidebarPanel(
    fileInput('file','Discovr: Choose CSV File', multiple=TRUE),
    selectInput('xcol', 'Experimental Setting', c("unknown","paired","unpaired")),
    selectInput('ycol', 'Load Preset', c("none","Frap","Facs"),
                selected=names(iris)[[2]])
  ),
  mainPanel(
    plotOutput('plot')
  )
))