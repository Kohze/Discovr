#' Statistical Functions
#' @include discovr.R

#' Welchs two sample T.Test
#' @param input A data.frame or data.table
#' @return indicates whether parameter are from same population
welchTest <- function(input){
  output = t.test(input[[1]],input[[2]])
  output = output$p.value
  return(output)
}

#' Shapiro Wilks Test
#' @param input A data.frame or data.table
#' @return indicates normal distribution
shapiroTest <- function(input){
  output = c(shapiro.test(input[[1]])$p.value,shapiro.test(input[[2]])$p.value)
  output = mean(output)
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
  output = chisq.test(input[[1]],input[[2]])$p.value
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

#' F-Test
#' @param input A data.frame or data.table
#' @return compares variances of the samples - only normal distribution
fTest <- function(input){
  output = var.test(input[[1]],input[[2]])$p.value
  return(output)
}