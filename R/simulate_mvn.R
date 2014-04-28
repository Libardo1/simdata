get_n <- function() {
  n <- readnum("n: ")
}

get_mu <- function() {
  mux <- readnum("E(X): ")
  muy <- readnum("E(Y): ")
  c(mux, muy)
}

get_sigma <- function() {
  varx <- readnum("Var(X): ")
  vary <- readnum("Var(Y): ")
  corrxy <- readnum("Corr(X, Y): ")
  covxy <- corrxy * sqrt(varx * vary)
  matrix(c(varx, covxy, covxy, vary), 2)
}

#' Simulate multivariate normal data
#' 
#' Returns simulated multivariate normal data based on responses to questions.
#' @importFrom MASS mvrnorm
#' @export
simdata <- function() {
  message()
  hr()
  message()
  message("Enter values for simulated multivariate normal data:\n")
  n <- get_n()
  mu <- get_mu()
  sigma <- get_sigma()
  x <- mvrnorm(n, mu, sigma)
  report(x)
  x
}

#' Plots 2-dimensional data using some preset parameters.
#' 
#' @param x A 2-column data frame or matrix containing the data
#' @param ... Other parameters to be passed along to \code{plot()}
#' @export
plot_data <- function(x, ...) {
  plot(x, pch = 19, cex = 0.5, col = "blue",
       xlab = "x", ylab = "y", ...)
}

readnum <- function(prompt = "") {
  repeat {
    x <- readline(prompt)
    xnum <- tryCatch(as.numeric(x), 
                     warning = function(c) {
                       message("Please enter a number!")
                     })
    if(!is.null(xnum)) return(xnum)
  }  
}

hr <- function() {
  message(paste(rep("#", getOption("width") - 2), collapse = ""))
}

report <- function(x) {
  stats <- round(getstats(x), 4)
  message() # skip line
  hr()
  message() # skip line
  message("Actual values for simulated data:\n")
  message(paste0(names(stats), ": ", stats, sep = "\n"))
  hr()
}

getstats <- function(d) {
  x <- d[, 1]
  y <- d[, 2]
  c("Sample Mean X" = mean(x), "Sample Mean Y" = mean(y), 
    "Sample Var X" = var(x), "Sample Var Y" = var(y), 
    "Sample Covar X, Y" = cov(x, y),
    "Sample Corr X, Y"= cor(x, y))
}