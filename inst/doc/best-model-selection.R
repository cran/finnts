## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = FALSE, message = TRUE---------------------------------------------
suppressMessages(library(dplyr))

message("Simple Back Test Results")
back_test_tbl <- tibble(
  Combo = c("Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1"),
  Date = c("2020-01-01", "2020-02-01", "2020-03-01", "2020-04-01", "2020-05-01", "2020-01-01", "2020-02-01", "2020-03-01", "2020-04-01", "2020-05-01"),
  Model = c("arima", "arima", "arima", "arima", "arima", "ets", "ets", "ets", "ets", "ets"),
  FCST = c(9, 23, 35, 41, 48, 7, 22, 29, 42, 53),
  Target = c(10, 20, 30, 40, 50, 10, 20, 30, 40, 50)
) %>%
  dplyr::mutate(
    MAPE = abs(Target - FCST) / Target,
    Date = as.Date(Date)
  ) %>%
  dplyr::group_by(Combo, Model) %>%
  dplyr::mutate(
    Target_Total = sum(Target),
    Percent_Total = Target / Target_Total
  ) %>%
  dplyr::ungroup()

print(back_test_tbl)

message("")
message("Overall Model Accuracy by Combo")

suppressMessages(best_model <- back_test_tbl %>%
  dplyr::group_by(Combo, Model) %>%
  dplyr::mutate(Weighted_MAPE = MAPE * Percent_Total) %>%
  dplyr::summarise(
    MAPE = mean(MAPE),
    Weighted_MAPE = sum(Weighted_MAPE)
  ) %>%
  dplyr::ungroup())

print(best_model)

