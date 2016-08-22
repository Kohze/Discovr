#' @title discovr()
#' @author Robin Kohze
#' @param x A data.frame or data.table
#' @param method The method indicates "paired" or "unPaired" testing
#' @param preset As preset mutliple techniques are allowed, such as "FACS" or "FRAP".
#' @return The main disc() function returns the htmlwidget graphic
#' @include statisticFun.R
#' @examples 
#' disc(mtcars)
#' @export
disc <- function(x, method = "unPaired", preset = NULL){
  
  library(future)
  library(d3three)
  library(jsonlite)
  
  input = as.data.frame(x)
  colNames = paste(names(x), collapse = " ")
  dataSetName = deparse(substitute(x))
  
  return(d4_three(graphicGen(methodChoice(method, input), method, colNames, dataSetName)))
}

#' output of numerical values
#' @param x is the dataframe input 
#' @param method is "paired" or "unPaired"
#' @param preset is the invididual choosen preset ("facs","frap")
#' @return returns a list of data.frames specific for the choosen method
#' @export
disc.data <- function(x, method = "unPaired", preset = NULL){
  input = as.data.frame(x)
  preOut = methodChoice(method, input)
  
  preVec = fromJSON(preOut$x1)
  preVec2 = fromJSON(preOut$x8)
  preVec3 = fromJSON(preOut$x9)
  
  preOut$x1 = preVec$children
  preOut$x8 = preVec2$children
  preOut$x9 = preVec3$children
  
  #future module: different naming if paired/unpaired distinct methods.
   if(method == "paired"){
     names(preOut) = c(
       "shapiro.test",
       "correlation.test",
       "f.test",
       "anova.test",
       "student.test",
       "welch.test",
       "wilcoxon.test",
       "pca",
       "glm"
    )
   } else {
    names(preOut) = c(
      "shapiro.test",
      "correlation.test",
      "f.test",
      "anova.test",
      "student.test",
      "welch.test",
      "wilcoxon.test",
      "pca",
      "glm"
    ) 
   }
  
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

#' creates data.frame to htmlwidget json
#' @param a is data matrix
#' @return returns json list
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

#' function to recover data from JSON list
#' @param input is the specific JSON list dataset
#' @return returns the recovered data.frame

listOut <- function(input){
  preVec = fromJSON(input)
  preOut = preVec$children
  return(preOut$size)
}

#' function to convert a value to color
#' @param input is the specific method output
#' @param bigger indicates if the "wanted" value is > or < 0.05
#' @return returns the color name
colorTransla <- function(input, bigger = TRUE, minp = 0.05){

  if(bigger == TRUE){
    x = length(which( input > minp))/length(input)
  } else {
    x = length(which( input < minp))/length(input)
  }
  
  colorRange <- colorRampPalette(c("red","grey","green"))
  col = colorRange(100)
  x = round(x * 100)
  return(col[x])
}  

#' splitts calculation in paired and unpaired sections
#' @param method is the method name for the widget
#' @param colNames contains all column names for the widget
#' @dataSetName is the name of the input data.frame for the widget
#' @param x is the list of data matrixes
#' @return returns the final input for the disc.graphics module
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
  
  output = list("col1a1" = colorTransla(listOut(x[["x1"]]), bigger = TRUE),
                "col1a2" = colorTransla(listOut(x[["x1"]]), bigger = FALSE),
                "col2a1" = colorTransla(x[["x3"]], bigger = TRUE), 
                "col2a2" = colorTransla(x[["x3"]], bigger = FALSE),
                "col3a1" = "grey", 
                "col3a2" = colorTransla(x[["x4"]], bigger = TRUE), 
                "col3a3" = colorTransla(x[["x2"]], minp = 0.2),
                "col3a4" = colorTransla(x[["x2"]], minp = 0.2),
                
                "text1a1" = "Shapiro-Wilks",
                "text1a2" = "Correlation",
                "text2a1" = "F-Test",
                "text2a2" = "Anova Test",
                "text3a1" = "Student t-test",
                "text3a2" = "Welch's t-test",
                "text3a3" = "Wilcoxon Test",
                "text3a4" = "PCA",
                "text4a1" = "glm AIC values",
                
                "textBox1a1" = "normal distributed if > 0.05 ",
                "textBox1a2" = "indicates simple correlation",
                "textBox2a1" = "paired variance if > 0.05 | normal",
                "textBox2a2" = "paired variance if > 0.05 | non normal",
                "textBox3a1" = "for non paired variance datasets",
                "textBox3a2" = "for paired variance datasets",
                "textBox3a3" = "tests non normal datasets",
                "textBox3a4" = "to reduce dimensionality",
                "textBox4a1" = "to find regression coefficients",
                
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
#' @param input is the input data.frame
#' @return returns the statistical calculations for each section
methodChoice <- function(method,x){
  output = switch(method,
                  unPaired = unPairedTest(x),
                  paired = pairedTest(x))
  return(output)
}

#' calculating paired tests
#' @param input is the data.frame
#' @return returns list with all statistical test results
pairedTest <- function(input){
  welchT %<-% welchTest(input, paired = TRUE)
  studentTest %<-% studentt(input, paired = TRUE)
  shapiroT %<-% shapiroT(input)
  corT %<-% corTest(input)
  anovaT %<-% anovaTest(input)
  f.test %<-% fTest(input)
  wilco %<-% wilcoxonTest(input, paired = TRUE)
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

#' calculating un-paired tests
#' @param input is the data.frame
#' @return returns the statistical calculations for each section
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
  output$isNormalDistributed[output$pvalue > 0.05] = TRUE
  output$isNormalDistributed[output$pvalue < 0.05] = FALSE
  
  return(output)
}