#' Statistical Functions
#' @include discovr.R
#' Welchs two sample T.Test
#' @param input A data.frame or data.table
#' @return indicates whether parameter are from same population
#' the logic of the function syntax was fount at http://www.sthda.com/english/wiki/matrix-of-student-t-test
welchTest <- function(mat, ...) {
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
  output = cor(input, use = "complete.obs")
  return(output)
}

#' Anova Test
#' @param input A data.frame or data.table
#' @return analyzes the variance of the given samples
anovaTest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n = ncol(mat)
  p.mat = matrix(NA, n, n)
  diag(p.mat) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = aov(mat[, i] ~ mat[, j])
      p.mat[i, j] <- p.mat[j, i] <- test$coefficients[2]
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,3)
}

#' Chi Square Test
#' @param input A data.frame or data.table
#' @return analyzes goodness of fit of fittet line to dataset
chiSQTest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n = ncol(mat)
  p.mat = matrix(NA, n, n)
  diag(p.mat) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = chisq.test(mat[, i], mat[, j])
      p.mat[i, j] <- p.mat[j, i] <- test$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,3)
}

#' Wilcoxon Test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on dependend samples
wilcoxonTest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n = ncol(mat)
  p.mat = matrix(NA, n, n)
  diag(p.mat) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = wilcox.test(mat[, i], mat[, j], ..., paired = TRUE)
      p.mat[i, j] <- p.mat[j, i] <- test$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,3)
}

#' Mann-Whitney U test - Wilcoxon sum rank test
#' @param input A data.frame or data.table
#' @return Alternative test for the paired t-test if data is not normal - on independent samples
mannWhitTest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n = ncol(mat)
  p.mat = matrix(NA, n, n)
  diag(p.mat) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = wilcox.test(mat[, i], mat[, j], ..., paired = FALSE)
      p.mat[i, j] <- p.mat[j, i] <- test$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,3)
}

#' PCA dimension reduction
#' @param input A data.frame or data.table
#' @return shows if datadimensionality can be reduced
#' indicates which percentage of all principal components that have a sigma value > 0.5
pcaReduce <- function(input){
  pc = prcomp(x = mtcars, scale. = TRUE)
  output = length(which(pc$sdev > 0.5))/length(pc$sdev)
  return(output)
}

#' F-Test
#' @param input A data.frame or data.table
#' @return compares variances of the samples - only normal distribution
fTest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n = ncol(mat)
  p.mat = matrix(NA, n, n)
  diag(p.mat) = 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test = var.test(mat[, i], mat[, j])
      test = as.numeric(test$statistic)
      p.mat[i, j] <- p.mat[j, i] <- test
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,3)
}

#' GLM
#' @param input A data.frame or data.table
#' @return generalized linear model
glmTest <- function(input){
  formVec = c()
  for(i in 2:length(input)) {
    if(i == 2){
      formVec = paste0("input[[",i,"]]")
    } else { 
      formVec = paste0(formVec, " + ", "input[[",i,"]]")
    }
  }
  formOut = as.formula(paste0("input[[1]] ~ ", formVec))
  output = glm(formOut)
  output = output$coefficients
  return(output)
}