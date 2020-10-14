##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##'
##' @param data
##' @param train_prop
##' @param ntimes
mc_cv_light <- function(data, train_prop = 3/4, ntimes) {

  resamples <- mc_cv(data = data,
                     prop = train_prop,
                     times = ntimes)

  testing_rows <- map(resamples$splits, complement)

  write_rds(testing_rows, 'data/resamples.rds')

  testing_rows

}
