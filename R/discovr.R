#' discovr() main code
#' @param x A data.frame or data.table
#' @return The calculation output
#' @export
disc <- function(x){
  input = x
  t = t.test(input[[1]],input[[2]])
  return(t)
}