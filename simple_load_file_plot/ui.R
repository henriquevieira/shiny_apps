#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

htmlTemplate("index.html",
             button_run = actionButton("run", "Run"),
             input_file = fileInput("input_file_data", "Choose CSV File",
                       accept = c(
                         "text/csv",
                         "text/comma-separated-values,text/plain",
                         ".csv",
                         "text/tab-separated-values")
             ),
             header = checkboxInput("header", "Header", TRUE),
             content = tableOutput("contents"),
             plot = plotOutput("plot")
)
