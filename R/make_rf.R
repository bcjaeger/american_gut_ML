##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param otu
##' @param outcome
make_rf <- function(otu, outcome, max_otus) {

  variances <- select(otu, starts_with("x")) %>%
    map_dbl(var) %>%
    enframe() %>%
    arrange(desc(value)) %>%
    slice(1:max_otus)

  ranger_data <- otu %>%
    select(all_of(c(outcome, variances$name))) %>%
    filter(.data[[outcome]] != 'unknown')

  ranger_data[[outcome]] %<>% factor()

  model_formula <- as.formula(glue("{outcome} ~ ."))

  model <- ranger(formula = model_formula,
                  data = ranger_data,
                  num.trees = 100,
                  probability = TRUE,
                  save.memory = TRUE)

  roc(response = ranger_data[[outcome]],
      predictor = as.numeric(model$predictions[,"yes"]))


}
