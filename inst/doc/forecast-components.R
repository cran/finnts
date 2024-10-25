## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE
)
library(finnts)

## ----message = FALSE----------------------------------------------------------
library(finnts)

hist_data <- timetk::m4_monthly %>%
  dplyr::filter(
    date >= "2013-01-01",
    id == "M2"
  ) %>%
  dplyr::rename(Date = date) %>%
  dplyr::mutate(id = as.character(id))

run_info <- set_run_info(
  experiment_name = "finnts_fcst",
  run_name = "finn_sub_component_run"
)

## ----message=FALSE------------------------------------------------------------
prep_data(
  run_info = run_info,
  input_data = hist_data,
  combo_variables = c("id"),
  target_variable = "value",
  date_type = "month",
  forecast_horizon = 6
)

R1_prepped_data_tbl <- get_prepped_data(
  run_info = run_info,
  recipe = "R1"
)

print(R1_prepped_data_tbl)

R2_prepped_data_tbl <- get_prepped_data(
  run_info = run_info,
  recipe = "R2"
)

print(R2_prepped_data_tbl)

## ----message = FALSE----------------------------------------------------------
prep_models(
  run_info = run_info,
  models_to_run = c("arima", "ets", "glmnet"),
  num_hyperparameters = 2
)

train_models(
  run_info = run_info,
  run_global_models = FALSE
)

## ----message = FALSE----------------------------------------------------------
ensemble_models(run_info = run_info)

## ----message = FALSE----------------------------------------------------------
final_models(run_info = run_info)

## ----message = FALSE----------------------------------------------------------
finn_output_tbl <- get_forecast_data(run_info = run_info)

print(finn_output_tbl)

