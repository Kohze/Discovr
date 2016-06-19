#' @title discovr() 
#' @param x A data.frame or data.table
#' @param method The method indicates paired or un-paired testing
#' @param preset As preset mutliple techniques are allowed, such as FACS or FRAP.
#' @return The calculation output
#' @include graphics.R
#' @include statisticFun.R
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
  
  if(cols == 2) {
    if(is.null(preset)){
      if(method == "paired") data = pairedTest(x) else data = unPairedTest(x)
    } else if(presetApp == "facs" | presetApp == "FACS") {
      cat("performing FACS preset analysis")
    } else if(presetApp == "frap" | presetApp == "FRAP") {
      cat("performing FRAP preset analysis")
    } else {
      cat("disc() input not recognized - check type errors")
    }
  } else if(cols > 2) {
    cat("multi column analysis")
  } else {
    cat("problem with data input")
  }
  
  if(exists("data")){
    plotFun(data,style)
  }
}

#' Output for only paired tests
#' @param input taking the output of all statistical methods
#' @return extacts p value of all paired tests and adds them to data.frame
pairedTest <- function(input){
  
  shapiroT = shapiroTest(input)
  corT = corTest(input)
  chiT = chiSQTest(input)
  manwiT = mannWhitTest(input) 
  wilcoT = wilcoxonTest(input) 
  anovaT = anovaTest(input)
  
  #create data.frame ordered by test function
  
  return(output)
}

#' Output for only un-paired tests
#' @param input taking the output of all statistical methods
#' @return extacts p value of all un-paired tests and adds them to data.frame
unPairedTest <- function(input){
  
  welchT = welchTest(input)
  #shapiroT = shapiroTest(input)
  corT = corTest(input)
  chiT = chiSQTest(input)
  #anovaT = anovaTest(input)
  
  dataComp = data.frame()
  dataComp[1,1] = welchT
  dataComp[1,2] = corT
  dataComp[1,3] = chiT
  
  dataComp[2,2] = welchT
  dataComp[2,3] = corT
  dataComp[2,1] = chiT
  
  colnames(dataComp) = c("Welch","Correlation","Chi Square")
  output = dataComp
  
  #create data.frame ordered by test function
  
  return(output)
}

