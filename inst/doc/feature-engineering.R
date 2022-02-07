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
# Simplified Example
tibble(
  Combo = c("Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1"), 
  Date = c("2020-01-01", "2020-02-01", "2020-03-01", "2020-04-01", "2020-05-01", "2020-06-01", "2020-07-01", "2020-08-01", "2020-09-01", "2020-10-01"), 
  Target = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
) %>%
  dplyr::mutate(Date = as.Date(Date)) %>%
  timetk::tk_augment_lags(.value = "Target", .lags = c(3,6), .names = "auto") %>%
  tidyr::fill(tidyselect::contains("lag"), .direction = "up") %>%
  tk_augment_slidify(tidyselect::contains("lag"), .f = sum, .period = c(3, 6), .align = "right") %>%
  tidyr::fill(tidyselect::contains("lag"), .direction = "up") %>%
  dplyr::rename(
    Target_lag3_roll3_sum = Target_lag3_roll_3, 
    Target_lag6_roll3_sum = Target_lag6_roll_3, 
    Target_lag3_roll6_sum = Target_lag3_roll_6, 
    Target_lag6_roll6_sum = Target_lag6_roll_6
  )


## ---- echo = FALSE, message = FALSE-------------------------------------------

tibble(
  Combo = c("Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1"), 
  Date = c("2020-01-01", "2020-01-01", "2020-01-01", "2020-02-01", "2020-02-01", "2020-02-01", "2020-03-01", "2020-03-01", "2020-03-01", "2021-04-01", "2021-04-01", "2021-04-01", "2020-05-01", "2020-05-01", "2020-05-01", "2021-06-01", "2021-06-01", "2021-06-01"), 
  Origin = c(0,-1, -2, 1, 0, -1, 2, 1, 0, 3, 2, 1, 4, 3, 2, 5, 4, 3), 
  Horizon = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3), 
  Target = c(10, 10, 10, 20, 20, 20, 30, 30, 30, 40, 40, 40, 50, 50, 50, 60, 60, 60), 
  Target_Lag1 = c(NA, NA, NA, 10, NA, NA, 20, 10, NA, 30, 20, 10, 40, 30, 20, 50, 40, 30), 
  Target_Lag2 = c(NA, NA, NA, NA, NA, NA, 10, NA, NA, 20, 10, NA, 30, 20, 10, 40, 30, 20), 
  Target_Lag3 = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, 10, NA, NA, 20, 10, NA, 30, 20, 10)
) %>%
  dplyr::mutate(Date = as.Date(Date)) %>%
  print(n=20)


