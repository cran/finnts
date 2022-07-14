## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE, eval = FALSE-------------------------------------------
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
#  finn_output <- finnts::forecast_time_series(
#    input_data = hist_data,
#    combo_variables = c("id"),
#    target_variable = "value",
#    date_type = "month",
#    forecast_horizon = 3,
#    parallel_processing = "spark"
#  )

## ---- message = FALSE, eval = FALSE-------------------------------------------
#  # load CRAN libraries
#  library(finnts)
#  library(devtools)
#  
#  # load GitHub libraries
#  devtools::install_github("Azure/rAzureBatch")
#  devtools::install_github("Azure/doAzureParallel")
#  
#  library(rAzureBatch)
#  library(doAzureParallel)
#  
#  # create azure batch cluster info
#  azure_batch_credentials <- list(
#    "sharedKey" = list(
#      "batchAccount" = list(
#        "name" = "<insert resource name>",
#        "key" = "<insert compute key>",
#        "url" = "<insert resource URL>"
#      ),
#      "storageAccount" = list(
#        "name" = "<insert resource name>",
#        "key" = "<insert compute key>",
#        "endpointSuffix" = "core.windows.net"
#      )
#    ),
#    "githubAuthenticationToken" = "",
#    "dockerAuthentication" = list("username" = "",
#                                  "password" = "",
#                                  "registry" = "")
#  )
#  
#  azure_batch_cluster_config <- list(
#    "name" = "<insert compute cluster name>",
#    "vmSize" = "Standard_D5_v2", # solid VM size that has worked well in the past with Finn forecasts
#    "maxTasksPerNode" = 1, # tells the cluster to only run one unique time series for each VM. That enables us to then run another layer of parallel processing within the VM
#    "poolSize" = list(
#      "dedicatedNodes" = list(
#        "min" = 1,
#        "max" = 200
#      ),
#      "lowPriorityNodes" = list(
#        "min" = 1,
#        "max" = 100
#      ),
#      "autoscaleFormula" = "QUEUE" # automatically scales up VM's as more jobs get sent to the cluster.
#    ),
#    "containerImage" = "mftokic/finn-azure-batch-dev", # docker image you can use that automatically downloads software needed for Finn to run in cloud
#    "rPackages" = list(
#      "cran" = c('Rcpp', 'modeltime', 'modeltime.resample', 'parsnip', 'tune', 'recipes', 'rsample', 'workflows', 'dials', 'lubridate', 'rules', 'Cubist', 'earth', 'kernlab', 'doParallel', 'dplyr', 'tibble', 'tidyr', 'purrr', 'stringr', 'prophet', 'glmnet', 'gtools'), # finnts package dependencies
#      "github" = list(),
#      "bioconductor" = list()
#    ),
#    "commandLine" = list()
#  )
#  
#  # create or connect to existing Azure Batch cluster
#  doAzureParallel::setCredentials(azure_batch_credentials)
#  cluster <- doAzureParallel::makeCluster(azure_batch_cluster_config)
#  doAzureParallel::registerDoAzureParallel(cluster)
#  
#  # call Finn with Azure Batch parallel processing
#  hist_data <- timetk::m4_monthly %>%
#    dplyr::rename(Date = date) %>%
#    dplyr::mutate(id = as.character(id))
#  
#  finn_output <- finnts::forecast_time_series(
#    input_data = hist_data,
#    combo_variables = c("id"),
#    target_variable = "value",
#    date_type = "month",
#    forecast_horizon = 3,
#    parallel_processing = "azure_batch",
#    run_name = "azure_batch_forecast_test"
#  )
#  
#  # optional code to delete compute cluster
#  parallel::stopCluster(cluster)

