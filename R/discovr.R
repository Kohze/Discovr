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
#' disc(mtcars)
#' @export
disc <- function(x, method = "unPaired", preset = NULL){
  input = as.data.frame(x)
  colNames = paste(names(x), collapse = " ")
  dataSetName = deparse(substitute(x))
  
  return(d4_three(graphicGen(methodChoice(method, input), method, colNames, dataSetName)))
}

#' output of numerical values
#' @param x is the dataframe input 
#' @return returns modified data output specific for the choosen method
#' @export
disc.data <- function(x, method = "unPaired", preset = NULL){
  input = as.data.frame(x)
  preOut = methodChoice(method, input)
  preVec = fromJSON(preOut$x1)
  preOut$x1 = preVec$children
  
  # if(method == "paired"){
  #   
  # } else {
  #   
  # }
  
  return(preOut)
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
      result$output[i] = paste(result$a[i],result$b[i], collapse = "/")
    } else {
      result$output[i] = paste(result$b[i],result$a[i], collapse = "/")
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
graphicGen <- function(x, method, colNames, dataSetName){
  x1 = x[["x1"]]
  x2 = dataAdjust(x[["x2"]])
  x3 = dataAdjust(x[["x3"]])
  x4 = dataAdjust(x[["x4"]])
  x5 = dataAdjust(x[["x5"]])
  x6 = dataAdjust(x[["x6"]])
  x7 = dataAdjust(x[["x7"]])
  x8 = x[["x8"]]
  x9 = x[["x9"]]
  
  output = list("col1a1" = "blue",
                "col1a2" = "green",
                "col2a1" = "blue", 
                "col2a2" = "green",
                "col3a1" = "blue", 
                "col3a2" = "green",
                "col3a3" = "green",
                "col3a4" = "green",
                "text1a1" = "Shapiro-Wilks",
                "text1a2" = "Correlation",
                "text2a1" = "F-Test",
                "text2a2" = "Anova Test",
                "text3a1" = "Student t-test",
                "text3a2" = "Welch's t-test",
                "text3a3" = "Wilcoxon Test",
                "text3a4" = "PCA",
                "text4a1" = "glm AIC values",
                "names" = colNames,
                "dataName" = dataSetName,
                "method" = as.character(method),
                "inputNames1a1" = x1,
                "inputNames1a2" = x2,
                "inputNames2a1" = x3,
                "inputNames2a2" = x4,
                "inputNames3a1" = x5,
                "inputNames3a2" = x6,
                "inputNames3a3" = x7,
                "inputNames3a4" = x8,
                "inputNames4a1" = x9
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
  studentTest %<-% studentt(input)
  shapiroT %<-% shapiroT(input)
  corT %<-% corTest(input)
  anovaT %<-% anovaTest(input)
  f.test %<-% fTest(input)
  wilco %<-% wilcoxonTest(input)
  pcaT %<-% pcaReduce(input)
  glmT %<-% glmTest(input)
  
  output = list("x1" = shapiroT,
                "x2" = corT,
                "x3" = f.test,
                "x4" = anovaT,
                "x5" = studentTest,
                "x6" = welchT,
                "x7" = wilco,
                "x8" = pcaT,
                "x9" = glmT)
            
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