##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title

make_otu_data <- function(file_path_meta,
                          file_path_biom,
                          site_variable,
                          site_name) {

  AG_meta <- read_delim(file_path_meta, "\t", na = "no_data")
  AG_biom <- read_biom(file_path_biom)

  # select out samples from desired sites
  site_samples <- AG_meta %>%
    filter(.data[[site_variable]] %in% site_name)

  # convert biom from sparse matrix format into tibble (MEMORY INTENSIVE)
  sample_biom <- as(biom_data(AG_biom), 'matrix') %>%
    t() %>%
    as_tibble(rownames = "#SampleID")

  # merge the data into one dataset with the predictors and OTU data
  site_samples %>%
    left_join(sample_biom) %>%
    clean_names()

}
