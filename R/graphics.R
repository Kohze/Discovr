#' Graphical Output
#' @param input taking the output of all statistical methods
#' @include discovr.R
#' @return returns Graphical output
plotFun <- function(input, style){
  
  if(style == "heatmap"){
    return(d3heatmap(input, theme = "dark", dendrogram = "none"))
  } else if(style == "ternary") {
    cat("placeholder: ternary plot")
  } else if(style == "cleveland") {
    cat("placeholder: cleveland plot")
    dotchart(input,labels=row.names(input),cex=.7,
             main="Method viability", 
             xlab="P values of tested methods")
  } else {
    cat("error: check your style input again")
  }
}