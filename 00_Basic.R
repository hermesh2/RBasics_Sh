# S Basics ----------------------------------------------------------------
needed_script <- list( "dplyr", "rjson")
lapply(X = needed_script, FUN = function(x){
  if( !x %in% installed.packages() ){
    install.packages(x)
  }
  library(x, character.only = TRUE)
})

rm(list = ls());gc()
# E Basics ----------------------------------------------------------------


# S create Json -----------------------------------------------------------
list_project <-  list( 
  dir_script = "/home/chabi/Desktop/Chabi/Proyectos/",
  needed_script = list( "dplyr", "rjson", "data.table", "RPostgreSQL")
)
toJSON(x = list_project)   %>% writeLines(con = "Data/00_Initial.json")
# E create Json -----------------------------------------------------------


# S Create folders --------------------------------------------------------
if( ! dir.exists("RData/001_read/")){
  dir.create("RData/001_read/")
}
# E Create folders --------------------------------------------------------