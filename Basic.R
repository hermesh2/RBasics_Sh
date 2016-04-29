
# S Basics ----------------------------------------------------------------

needed_script <- list( "dplyr", "data.table")
lapply(X = needed_script, FUN = function(x){
  if( !x %in% installed.packages() ){
    install.packages(x)
  }
  library(x, character.only = TRUE)
})
rm(list = ls());gc()

# E Basics ----------------------------------------------------------------