## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE---------------------------------------------------------
library(dplyr)
library(timetk)

m4_monthly %>%
  timetk::tk_augment_timeseries_signature(date) %>%
  dplyr::group_by(id) %>%
  timetk::tk_augment_fourier(date, .periods = c(3, 6, 12), .K = 1) %>%
  dplyr::ungroup()

## ---- echo = FALSE, message = FALSE-------------------------------------------

library(finnts)

hist_data <- timetk::m4_monthly %>%
  dplyr::filter(date >= "2012-01-01", 
                id == "M2") %>%
  dplyr::rename(Date = date) %>%
  dplyr::mutate(id = as.character(id))

run_info <- set_run_info(
  experiment_name = "finnts_fcst", 
  run_name = "R1_run"
)

prep_data(run_info = run_info, 
          input_data = hist_data, 
          combo_variables = c("id"), 
          target_variable = "value", 
          date_type = "month", 
          forecast_horizon = 3, 
          recipes_to_run = "R1")

R1_prepped_data_tbl <- get_prepped_data(run_info = run_info, 
                                        recipe = "R1")

print(R1_prepped_data_tbl)

## ---- echo = FALSE, message = FALSE-------------------------------------------

library(finnts)

hist_data <- timetk::m4_monthly %>%
  dplyr::filter(date >= "2012-01-01", 
                id == "M2") %>%
  dplyr::rename(Date = date) %>%
  dplyr::mutate(id = as.character(id))

run_info <- set_run_info(
  experiment_name = "finnts_fcst", 
  run_name = "R2_run"
)

prep_data(run_info = run_info, 
          input_data = hist_data, 
          combo_variables = c("id"), 
          target_variable = "value", 
          date_type = "month", 
          forecast_horizon = 3, 
          recipes_to_run = "R2")

R2_prepped_data_tbl <- get_prepped_data(run_info = run_info, 
                                        recipe = "R2")

print(R2_prepped_data_tbl)

