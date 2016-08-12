#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
d4_three <- function(inputList, width = "auto", height = "auto") {

  # forward options using x
  x = list(
    col1 = inputList[["col1"]],
    col2 = inputList[["col2"]],
    col3 = inputList[["col3"]],
    col4 = inputList[["col4"]],
    col5 = inputList[["col5"]],
    col6 = inputList[["col6"]],
    text1 = inputList[["text1"]],
    text2 = inputList[["text2"]],
    text3 = inputList[["text3"]],
    text4 = inputList[["text4"]],
    text5 = inputList[["text5"]],
    text6 = inputList[["text6"]],
    text7 = inputList[["text7"]],
    cNames = inputList[["names"]],
    inputNames = inputList[["inputNames"]]
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'd4_three',
    x,
    width = width,
    height = height,
    package = 'd3three'
  )
}

#' Shiny bindings for d4_three
#'
#' Output and render functions for using d4_three within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a d4_three
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name d4_three-shiny
#'
#' @export
d4_threeOutput <- function(outputId, width = '100%', height = '100%'){
  htmlwidgets::shinyWidgetOutput(outputId, 'd4_three', width, height, package = 'd3three')
}

#' @rdname d4_three-shiny
#' @export
renderD4_three <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, d4_threeOutput, env, quoted = TRUE)
}
