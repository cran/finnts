## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE, fig.width = 7, fig.height = 6--------------------------
library(dplyr)
library(modeltime)
library(timetk)

# monthly data example
timetk::time_series_cv(
    data = modeltime::m750 %>% dplyr::filter(date > "2010-12-01"), # entire historical data set
    initial = 24, # initial periods to use as training data
    assess = 6, # forecast horizon to hold out as testing data
    skip = 6, # how many periods to move forward for each subsequent split, 
              # equal to back_test_spacing input in forecast_time_series() finnts function
    cumulative = TRUE, # should the training data expand more than initial periods in each subsequent split
    slice_limit = 3 # max number of splits to run
    ) %>%
  timetk::plot_time_series_cv_plan(.date_var = date, 
                                   .value = value, 
                                   # Additional arguments passed to plot_time_series(),
                                   .facet_ncol = 1,
                                   .interactive = FALSE)



