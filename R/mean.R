#' Moments of a Distribution
#'
#' Get common moment-related quantities of a
#' distribution: mean, variance, standard deviation (sd),
#' skewness, and kurtosis.
#'
#' @param x Distribution to evaluate.
#' @param ... Not used.
#'
#' @details If there is no method associated with a subclass of
#' \code{x}, then moments are calculated using
#' \code{stats::integrate()} from the quantile function.
#'
#' @return A single numeric.
#' @examples
#' a <- dst_gpd(0, 1, 0.5)
#' b <- dst_unif(0, 1)
#' c <- dst_norm(3, 4)
#' mean(a)
#' variance(b)
#' kurtosis_raw(c)
#' kurtosis_exc(c)
#' @rdname moments
#' @export
mean.dst <- function(x, ...) {
  ellipsis::check_dots_empty()
  qf <- representation_as_function(x, "quantile")
  int <- stats::integrate(qf, lower = 0, upper = 1)
  int$value
}
