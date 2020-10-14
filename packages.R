

## library() calls go here
library(conflicted)
library(dotenv)
library(drake)
## data cleaning
library(biomformat)
library(janitor)
library(glue)
## data analysis
library(tidyverse)
library(tidymodels)
library(ranger)
library(magrittr)
library(pROC)

conflict_prefer("filter",    "dplyr")
conflict_prefer("select",    "dplyr")
conflict_prefer("slice",     "dplyr")
conflict_prefer('summarise', 'dplyr')
conflict_prefer('summarize', 'dplyr')
conflict_prefer('select',    'dplyr')
