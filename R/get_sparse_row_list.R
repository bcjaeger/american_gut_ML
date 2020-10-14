
##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title Make a sparse list of matrix rows
##' @param sparse_matrix
##'
##' @references
##' https://stackoverflow.com/questions/12464379/preallocate-list-in-r
##' https://stackoverflow.com/questions/2471188/converting-a-matrix-to-a-list
##' https://stackoverflow.com/questions/9469504/access-and-preserve-list-names-in-lapply-function
##'
get_sparse_row_list <- function(sparse_matrix) {

  names = as.list(dimnames(sparse_matrix)[[1]])

  sparse_list = lapply(
    X = 1:dim(sparse_matrix)[1],
    FUN = function(i) as(sparse_matrix[i,], "sparseVector")
  )

  names(sparse_list) <- names

  return(sparse_list)

}
