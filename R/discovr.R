#' discovr() main code
#' @param x A data.frame or data.table
#' @param method The method indicates paired or un-paired testing
#' @param preset As preset mutliple techniques are allowed, such as FACS or FRAP.
#' @return The calculation output
#' @export
disc <- function(x, method = "unpaired", preset = NULL){
  method = as.character(y)
  input = as.data.frame(x)
  cols = length(input)
  if(!is.null(application)) presetApp = as.character(preset)
  
  if(cols == 2) {
    if(is.null(preset)){
      if(method == "paired") pairedTest(x) else unPairedTest(x)
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
  
  e = shapiroTest(input)
  
  return(e)
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
  shapiroT = shapiroTest(input)
  corT = corTest(input)
  chiT = chiSQTest(input)
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

#' Mann-Whitney U test - Wilcoxon sum rank test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on independent samples
mannWhitTest <- function(input){
  output = wilcox.test(input[[1]],input[[2]], paired = FALSE)
  return(output)
}

#' PCA dimension reduction
#' @param input A data.frame or data.table
#' @return shows if datadimensionality can be reduced
mannWhitTest <- function(input){
  output = prcomp(input[[1]],input[[2]])
  return(output)
}