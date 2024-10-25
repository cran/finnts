## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = FALSE, message = TRUE---------------------------------------------
suppressMessages(library(dplyr))

message("Standard Hierarchical Time Series Data")

hts <- tibble(
  Continent = c("North America", "North America", "North America", "North America", "North America", "North America", "North America", "North America", "North America"),
  Country = c("United States", "United States", "United States", "United States", "United States", "United States", "Mexico", "Mexico", "Mexico"),
  City = c("Kansas City", "Kansas City", "Kansas City", "Seattle", "Seattle", "Seattle", "Mexico City", "Mexico City", "Mexico City"),
  Date = c("2020-01-01", "2020-02-01", "2020-03-01", "2020-01-01", "2020-02-01", "2020-03-01", "2020-01-01", "2020-02-01", "2020-03-01"),
  Target = c(100, 250, 320, 80, 200, 270, 50, 80, 120)
) %>%
  dplyr::mutate(Date = as.Date(Date))

print(hts)

## ----echo = FALSE, message = TRUE---------------------------------------------
suppressMessages(library(dplyr))

message("Grouped Hierarchical Time Series Data")

gts <- tibble(
  Country = c("United States", "United States", "United States", "United States", "United States", "United States", "Mexico", "Mexico", "Mexico", "Mexico", "Mexico", "Mexico"),
  Segment = c("Enterprise", "Enterprise", "Enterprise", "Public Sector", "Public Sector", "Public Sector", "Enterprise", "Enterprise", "Enterprise", "Enterprise", "Enterprise", "Enterprise"),
  Product = c("Coffee", "Coffee", "Coffee", "Coffee", "Coffee", "Coffee", "Coffee", "Coffee", "Coffee", "Tea", "Tea", "Tea"),
  Date = c("2020-01-01", "2020-02-01", "2020-03-01", "2020-01-01", "2020-02-01", "2020-03-01", "2020-01-01", "2020-02-01", "2020-03-01", "2020-01-01", "2020-02-01", "2020-03-01"),
  Target = c(10, 20, 30, 5, 8, 11, 20, 23, 27, 50, 55, 60)
) %>%
  dplyr::mutate(Date = as.Date(Date))

print(gts)

