## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = FALSE, message = TRUE---------------------------------------------
library(finnts)

hist_data <- timetk::m4_monthly %>%
  dplyr::filter(
    date >= "2012-01-01",
    id == "M2"
  ) %>%
  dplyr::rename(Date = date) %>%
  dplyr::mutate(id = as.character(id))

run_info <- set_run_info(
  experiment_name = "finnts_fcst",
  run_name = "get_prepped_models"
)

prep_data(
  run_info = run_info,
  input_data = hist_data,
  combo_variables = c("id"),
  target_variable = "value",
  date_type = "month",
  recipes_to_run = "R1",
  forecast_horizon = 6
)

prep_models(
  run_info = run_info,
  models_to_run = c("arima", "ets", "xgboost"),
  num_hyperparameters = 10
)

model_info <- get_prepped_models(run_info = run_info)

back_test_info <- model_info %>%
  dplyr::filter(Type == "Train_Test_Splits") %>%
  dplyr::select(Data) %>%
  tidyr::unnest(Data)

print(back_test_info)
print(unique(back_test_info$Run_Type))

model_workflow_info <- model_info %>%
  dplyr::filter(Type == "Model_Workflows") %>%
  dplyr::select(Data) %>%
  tidyr::unnest(Data)

print(model_workflow_info)

model_hyperparameter_info <- model_info %>%
  dplyr::filter(Type == "Model_Hyperparameters") %>%
  dplyr::select(Data) %>%
  tidyr::unnest(Data)

print(model_hyperparameter_info)

