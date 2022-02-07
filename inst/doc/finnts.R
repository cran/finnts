## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  warning = FALSE, 
  message = FALSE
)
library(finnts)

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  library(finnts)
#  
#  browseVignettes("finnts")

## ---- message = FALSE---------------------------------------------------------
library(finnts)

hist_data <- timetk::m4_monthly %>%
  dplyr::filter(date >= "2010-01-01") %>%
  dplyr::rename(Date = date) %>%
  dplyr::mutate(id = as.character(id))

print(hist_data)

print(unique(hist_data$id))

## ---- message = FALSE, eval = hist_data, error=FALSE, warning = FALSE, echo=T, results='hide', eval = FALSE----
#  
#  finn_output <- forecast_time_series(
#    input_data = hist_data,
#    combo_variables = c("id"),
#    target_variable = "value",
#    date_type = "month",
#    forecast_horizon = 3,
#    back_test_scenarios = 6,
#    models_to_run = c("arima", "ets"),
#    run_global_models = FALSE,
#    run_model_parallel = FALSE
#  )
#  

## ---- message = FALSE, eval = finn_output, message = FALSE, eval = FALSE------
#  finn_output$final_fcst %>%
#    head() %>%
#    print()
#  
#  finn_output$final_fcst %>%
#    tail() %>%
#    print()

## ---- message = FALSE, eval = finn_output, eval = FALSE-----------------------
#  print(finn_output$back_test_data)

## ---- message = FALSE, eval = finn_output, eval = FALSE-----------------------
#  print(finn_output$back_test_best_MAPE)

