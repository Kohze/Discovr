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
    data = multicol(data)
  } else {
    cat("problem with data input")
  }
  
  if(exists("data")){
    plotFun(data,style)
  } else {return("sry something went wront")}

  
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
  #shapiroT = shapiroTest(input)
  corT %<-% corTest(input)
  chiT %<-% chiSQTest(input)
  #anovaT = anovaTest(input)
  
  dataComp = data.frame()
  dataComp[1,1] = welchT$p.value
  dataComp[1,2] = corT
  dataComp[1,3] = chiT
  
  #just some added columns as space filler for now
  dataComp[2,2] = welchT$p.value
  dataComp[2,3] = corT
  dataComp[2,1] = chiT
  
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
#' 
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

#' @title t-test matrix function 
#' @param x A data.frame or data.table
#' @return returns the p value matrix of t.tests
#' this code function was found at http://www.sthda.com/english/wiki/matrix-of-student-t-test
t.test.matrix <- function(mat, ...) {
  mat <- as.matrix(mat)
  n = ncol(mat)
  p.mat = matrix(NA, n, n)
  diag(p.mat) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = t.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- test$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,3)
}