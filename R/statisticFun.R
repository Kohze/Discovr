#' Statistical Functions
#' @include discovr.R
#' Welchs two sample T.Test
#' @param input A data.frame or data.table
#' @return indicates whether parameter are from same population - with different variances. 
#' the logic of the function syntax was fount at http://www.sthda.com/english/wiki/matrix-of-student-t-test
welchTest <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = t.test(inp[, i], inp[, j], ...)
      p.inp[i, j] <- p.inp[j, i] <- test$p.value
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' student t test
#' @param input A data.frame or data.table
#' @return indicates whether parameters are from same population - with equal variances. 
studentt <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = t.test(inp[, i], inp[, j], ..., var.equal = TRUE)
      p.inp[i, j] <- p.inp[j, i] <- test$p.value
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' Shapiro Wilks Test
#' @param input A data.frame or data.table
#' @return indicates normal distribution
shapiroT <- function(x){
  resultVec = c()
  shapTest = lapply(x, shapiro.test)
  for(i in 1:length(x)){
    resultVec = c(resultVec, shapTest[[i]]$p.value)
  }
  preOutput = data.frame("name" = names(x),"size" = resultVec)
  output = toJSON(list("name" = "query", "children" = preOutput), pretty = TRUE)
  return(output)
}

#' Correlation Test
#' @param input A data.frame or data.table
#' @return indicates correlation between parameters
  corTest <- function(input){
  output = cor(input, use = "complete.obs")
  
  return(output)
}

#' Anova Test
#' @param input A data.frame or data.table
#' @return analyzes the variance of the given samples
anovaTest <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = aov(inp[, i] ~ inp[, j])
      p.inp[i, j] <- p.inp[j, i] <- test$coefficients[2]
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' Chi Square Test
#' @param input A data.frame or data.table
#' @return analyzes goodness of fit of fittet line to dataset
chiSQTest <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = chisq.test(inp[, i], inp[, j])
      p.inp[i, j] <- p.inp[j, i] <- test$p.value
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' Wilcoxon Test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on dependend samples
wilcoxonTest <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = wilcox.test(inp[, i], inp[, j], exact = FALSE,  ...)
      p.inp[i, j] <- p.inp[j, i] <- test$p.value
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' Mann-Whitney U test - Wilcoxon sum rank test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on independent samples
mannWhitTest <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = wilcox.test(inp[, i], inp[, j], ..., paired = FALSE)
      p.inp[i, j] <- p.inp[j, i] <- test$p.value
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' PCA dimension reduction
#' @param input A data.frame or data.table
#' @return shows if datadimensionality can be reduced
#' indicates which percentage of all principal components that have a sigma value > 0.5
pcaReduce <- function(input){
  pc = prcomp(x = mtcars, scale. = TRUE)
  names = colnames(pc$rotation)
  resultVec = pc$sdev
  
  preOutput = data.frame("name" = names,"size" = resultVec)
  output = toJSON(list("name" = "query", "children" = preOutput), pretty = TRUE)
  
  return(output)
}

#' F-Test
#' @param input A data.frame or data.table
#' @return compares variances of the samples - only normal distribution
fTest <- function(inp, ...) {
  inp <- as.matrix(inp)
  n = ncol(inp)
  p.inp = matrix(NA, n, n)
  diag(p.inp) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = var.test(inp[, i], inp[, j])
      test = as.numeric(test$statistic)
      p.inp[i, j] <- p.inp[j, i] <- test
    }
  }
  colnames(p.inp) <- rownames(p.inp) <- colnames(inp)
  signif(p.inp,3)
}

#' GLM
#' @param input A data.frame or data.table
#' @return generalized linear model
glmTest <- function(input){
  formVec = c()
  for(i in 1:length(input)) {
    formVec = c(formVec, glm(input[[i]] ~ ., data = input)$aic)
  }
  preOutput = data.frame("name" = colnames(input),"size" = abs(formVec))
  output = toJSON(list("name" = "query", "children" = preOutput), pretty = TRUE)
  return(output)
}