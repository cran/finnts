## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message = FALSE, eval = FALSE--------------------------------------------
#  # load CRAN libraries
#  library(finnts)
#  library(sparklyr)
#  
#  install.packages("qs")
#  library(qs)
#  
#  # connect to spark cluster
#  options(sparklyr.log.console = TRUE)
#  options(sparklyr.spark_apply.serializer = "qs") # uses the qs package to improve data serialization before sending to spark cluster
#  
#  sc <- sparklyr::spark_connect(method = "databricks")
#  
#  # call Finn with spark parallel processing
#  hist_data <- timetk::m4_monthly %>%
#    dplyr::rename(Date = date) %>%
#    dplyr::mutate(id = as.character(id))
#  
#  data_sdf <- sparklyr::copy_to(sc, hist_data, "data_sdf", overwrite = TRUE)
#  
#  run_info <- set_run_info(
#    experiment_name = "finn_fcst",
#    run_name = "spark_run_1",
#    path = "/dbfs/mnt/example/folder" # important that you mount an ADLS path
#  )
#  
#  forecast_time_series(
#    run_info = run_info,
#    input_data = data_sdf,
#    combo_variables = c("id"),
#    target_variable = "value",
#    date_type = "month",
#    forecast_horizon = 3,
#    parallel_processing = "spark",
#    return_data = FALSE
#  )
#  
#  # return the outputs as a spark data frame
#  finn_output_tbl <- get_forecast_data(
#    run_info = run_info,
#    return_type = "sdf"
#  )

