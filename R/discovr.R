#' discovr() main code
#' @param x A data.frame or data.table
#' @param y Additional options
#' @return The calculation output
#' @export
disc <- function(x,y){
  method = as.character(y)
  #if(method == "paired") pairedTest(x) else unPairedTest(x)
  input = as.data.frame(x)
  cols = length(input)
  
  e = shapiroTest(input)
  
  return(e)
}

#' Output for only paired tests
#' @param input taking the output of all statistical methods
#' @return extacts p value of all paired tests and adds them to data.frame
pairedTest <- function(input){
  
  welchT = welchTest(input)
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
  shapiroT = shapiroTest(input)
  corT = corTest(input)
  chiT = chiSQTest(input)
  manwiT = mannWhitTest(input) 
  wilcoT = wilcoxonTest(input) 
  anovaT = anovaTest(input)
  
  #create data.frame ordered by test function
  
  return(output)
}

#' P-value extractor function
#' @param input taking the output of all statistical methods
#' @return extacts p value and adds them to data.frame
pValue <- function(input){
  
  welchT = welchTest(input)
  shapiroT = shapiroTest(input)
  corT = corTest(input)
  chiT = chiSQTest(input)
  manwiT = mannWhitTest(input) 
  wilcoT = wilcoxonTest(input) 
  anovaT = anovaTest(input)
  
  #create data.frame ordered by test function
  
  return(output)
}

#' Welchs T.Test
#' @param input A data.frame or data.table
#' @return indicates whether parameter are from same population
welchTest <- function(input){
  output = t.test(input[[1]],input[[2]])
  return(output)
}

#' Shapiro Wilks Test
#' @param input A data.frame or data.table
#' @return indicates normal distribution
shapiroTest <- function(input){
  output = c(shapiro.test(input[[1]]),shapiro.test(input[[2]]))
  return(output)
}

#' Correlation Test
#' @param input A data.frame or data.table
#' @return indicates correlation between parameters
corTest <- function(input){
  output = cor(input[[1]],input[[2]])
  return(output)
}

#' Anova Test
#' @param input A data.frame or data.table
#' @return analyzes the variance of the given samples
anovaTest <- function(input){
  output = aov(input[[1]]~input[[2]])
  return(output)
}

#' Chi Square Test
#' @param input A data.frame or data.table
#' @return analyzes goodness of fit of fittet line to dataset
chiSQTest <- function(input){
  output = chisq.test(input[[1]],input[[2]])
  return(output)
}

#' Wilcoxon Test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on dependend samples
wilcoxonTest <- function(input){
  output = wilcox.test(input[[1]],input[[2]], paired = TRUE)
  return(output)
}

#'  Mann-Whitney U test - Wilcoxon sum rank test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on independent samples
mannWhitTest <- function(input){
  output = wilcox.test(input[[1]],input[[2]], paired = FALSE)
  return(output)
}