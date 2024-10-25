## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = FALSE, message = FALSE--------------------------------------------
library(dplyr)

tibble(
  Combo = c("Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1", "Country_1"),
  Date = c("2020-01-01", "2020-02-01", "2020-03-01", "2020-04-01", "2020-05-01", "2020-06-01", "2020-07-01", "2020-08-01", "2020-09-01", "2020-10-01", "2020-11-01", "2020-12-01", "2021-01-01", "2021-02-01", "2021-03-01"),
  Target = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, NA, NA, NA),
  Holiday = c("New Years", "Valentines Day", "None", "Easter", "None", "None", "4th of July", "None", "Labor Day", "Halloween", "Thanksgiving", "Christmas", "New Years", "Valentines Day", "None"),
  GDP = c(5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, NA, NA, NA),
  Sales_Pipeline = c(100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240)
) %>%
  dplyr::mutate(Date = as.Date(Date))

