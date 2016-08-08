#' @title discovr() 
#' @param x A data.frame or data.table
#' @param method The method indicates "paired" or "unpaired" testing
#' @param preset As preset mutliple techniques are allowed, such as "FACS" or "FRAP".
#' @param style A style input such as "heatmap" / "cleveland" / "ternary" 
#' @return The calculation output
#' @include graphics.R
#' @include statisticFun.R
#' @import future
#' @import ggtern
#' @examples 
#' library(Discovr)
#' disc(mtcars[1:2])
#' @export
disc <- function(x, method = "unpaired", preset = NULL, style = "heatmap"){
  method = as.character(method)
  input = as.data.frame(x)
  cols = length(input)
  if(!is.null(preset)) presetApp = as.character(preset)
  
  library(d3heatmap)
  library(future)
  
  modInput = presetFunction(method, input)   
  statTest = methodChoice(method, modInput)
  outputGraphic = graphicGen(statTest, style)
  return(statTest)
}

#' function for the preset usage
#' @param presetApp is the input for the specific preset
#' @return returns modified data output specific for the choosen preset
presetFunction <- function(presetApp, x) {
  output = switch(presetApp, 
         facs = log(x),
         FACS = log(x),
         frap = cat("performing FRAP preset analysis"),
         FRAP = cat("performing FRAP preset analysis"),
         NULL = x)
  return(output)
}

#' splitts calculation in paired and unpaired sections
#' @param method is the method parameter and the 
#' @param input is the data.frame
#' @return returns the statistical calculations for each section
methodChoice <- function(method,x){
  switch(method,
         unPaired = unPairedTest(x),
         paired = pairedTest(x))
}

#' Output for only paired tests
#' @param input taking the output of all statistical methods
#' @return extacts p value of all paired tests and adds them to data.frame
pairedTest <- function(input){
  shapiroT %<-% shapiroTest(input)
  corT %<-% corTest(input)
  chiT %<-% chiSQTest(input)
  manwiT %<-% mannWhitTest(input) 
  wilcoT %<-% wilcoxonTest(input) 
  anovaT %<-% anovaTest(input)
  
  #create data.frame ordered by test function
  return(output)
}

#' Output for only un-paired tests
#' @param input taking the output of all statistical methods
#' @return extacts p value of all un-paired tests and adds them to data.frame
unPairedTest <- function(input){
  welchT %<-% welchTest(input)
  shapiroT %<-% shapiroTest(input)
  corT %<-% corTest(input)
  chiT %<-% chiSQTest(input)
  anovaT %<-% anovaTest(input)
  
  colnames(dataComp) = c("Welch","Correlation","Chi Square")
  output = dataComp
  
  #create data.frame ordered by test function
  return(output)
}

#' @title multicol
#' @param x A data.frame or data.table
#' @return performing muliple calculations on a data frame with multiple columns
multicol <- function(x){
  shapiroTest = disc.normal(x)
  corTest = cor(x, use = "complete.obs") 
  varTest = var(x, na.rm = TRUE)
  matrixttest = t.test.matrix(x)
  
  output = list("t.test" = matrixttest, "correlation" = corTest, "variance" = varTest, "shapiro" = shapiroTest)
  return(output)
}

#' @title disc.normal() 
#' @param x A data.frame or data.table
#' @return showing shapiro.test output of the data.frame
disc.normal <- function(x){
  data = lapply(x, shapiro.test)
  pval = c()
  for(i in 1:length(names(data))){
    pval = c(pval,data[[names(data)[i]]]$p.value)
  }
  
  nameColumn = names(x)
  output = list("pvalue" = pval, "nameColumn" = nameColumn)
  
  #call d3.js graphic function via htmlwidgets here
  return(output)
}