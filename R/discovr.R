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
#' @import d3three
#' @import jsonlite
#' @examples 
#' disc(mtcars[1:2])
#' @export
disc <- function(x, method = "unPaired", preset = NULL){
  input = as.data.frame(x)
  if(!is.null(preset)) presetApp = as.character(preset)
  
  library(d3heatmap)
  library(future)
  
  return(d4_three(graphicGen(methodChoice(method, input))))
}

#' function for the preset usage
#' @param presetApp is the input for the specific preset
#' @return returns modified data output specific for the choosen preset
presetFunction <- function(presetApp, x) {
  output = switch(presetApp, 
         facs = log(x),
         FACS = log(x),
         frap = cat("The frap algorithm from FRAPBOT will be included soon"),
         FRAP = cat("The frap algorithm from FRAPBOT will be included soon"),
         NULL = x)
  return(output)
}

#' splitts calculation in paired and unpaired sections
#' @param method is the method parameter and the 
#' @param input is the data.frame
#' @return returns the statistical calculations for each section
dataAdjust <- function(a){
  result = expand.grid(a = colnames(a), b = colnames(a))
  result$c[result$a == result$b] = TRUE
  result$c[result$a != result$b] = FALSE
  result = result[!result$c,]
  
  for(i in 1:nrow(result)){
    result$data[i] = a[result$a[i],result$b[i]]
  }
  
  result$duplicated = duplicated(result$data)
  
  for(i in 1:nrow(result)){
    if(result$duplicated[i] == FALSE) {
      result$output[i] = paste(result$a[i],result$b[i], collapse = " ")
    } else {
      result$output[i] = paste(result$b[i],result$a[i], collapse = " ")
    }
  }
  
  bed = result[result$duplicated == FALSE & !is.na(result$data),]
  bed$data = abs(bed$data)
  
  preOutput = data.frame("name" = bed$output, "size" = bed$data)
  output = toJSON(list("name" = "query", "children" = preOutput), pretty = TRUE)
  return(output)
}

#' splitts calculation in paired and unpaired sections
#' @param method is the method parameter and the 
#' @param input is the data.frame
#' @return returns the statistical calculations for each section
graphicGen <- function(x){
    x1 = dataAdjust(x[["x2"]])
    x2 = dataAdjust(x[["x2"]])
    x3 = dataAdjust(x[["x3"]])
    x4 = dataAdjust(x[["x4"]])
    x5 = dataAdjust(x[["x5"]])
    x6 = dataAdjust(x[["x2"]])
    d = paste(names(mtcars), collapse = " ")
    output = list("col1" = "blue",
                  "col2" = "green",
                  "col3" = "blue", 
                  "col4" = "green",
                  "col5" = "blue", 
                  "col6" = "green",
                  "text1" = "tester1",
                  "text2" = "tester2",
                  "text3" = "tester3",
                  "text4" = "tester4",
                  "text5" = "tester5",
                  "text6" = "tester6",
                  "text7" = "tester7",
                  "names" = d,
                  "inputNames" = x1,
                  "inputNames2" = x2,
                  "inputNames3" = x3,
                  "inputNames4" = x4,
                  "inputNames5" = x5,
                  "inputNames6" = x6
                  )
    return(output)
  }

#' splitts calculation in paired and unpaired sections
#' @param method is the method parameter and the 
#' @param input is the data.frame
#' @return returns the statistical calculations for each section
methodChoice <- function(method,x){
  output = switch(method,
                  unPaired = unPairedTest(x),
                  paired = pairedTest(x))
  return(output)
}

#' Output for only paired tests
#' @param input taking the output of all statistical methods
#' @return extacts p value of all paired tests and adds them to data.frame
pairedTest <- function(input){
  shapiroT %<-% shapiroT(input)
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
  shapiroT %<-% shapiroT(input)
  corT %<-% corTest(input)
  chiT %<-% chiSQTest(input)
  anovaT %<-% anovaTest(input)
  
  output = list("x1" = welchT,
                "x2" = shapiroT,
                "x3" = corT,
                "x4" = chiT,
                "x5" = anovaT)
  
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
#' @export
disc.normal <- function(x){
  data = lapply(x, shapiro.test)
  pval = c()
  for(i in 1:length(names(data))){
    pval = c(pval,data[[names(data)[i]]]$p.value)
  }
  
  nameColumn = names(x)
  output = data.frame("nameColumn" = nameColumn, "pvalue" = pval)
  output$isNormalDistributed[output$pvalue < 0.05] = TRUE
  output$isNormalDistributed[output$pvalue > 0.05] = FALSE
  
  #call d3.js graphic function via htmlwidgets here
  return(output)
}