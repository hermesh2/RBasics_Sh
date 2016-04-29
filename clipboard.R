# sudo apt-get install xclip
# http://www.guru-gis.net/copy-to-clipboard-from-r-on-ubunutu/
#' @title Copy an object in the clipboard
#' 
#' @description Copy an object in the clipboard}
#' 
#' @param sep The object to copy.
#' @param sep A character to be used as separator for each column of the object
#' @param row.names  Copy row names (default is FALSE)
#' @param col.names Copy column names (default is TRUE)
#' @return copy the object as character in the clipboard
#' @author freecube source:http://stackoverflow.com/questions/10959521/how-to-write-to-clipboard-on-ubuntu-linux-in-r

cat("============================================== \n")
cat( "You shall isntall xclip \n")
cat("sudo apt-get install xclip \n")
cat("If you are using with Rdirs.sh it is not neccesary \n")
cat("============================================== \n")

clipboard <- function(x, sep="\t", row.names=FALSE, col.names=TRUE){
  con <- pipe("xclip -selection clipboard -i", open="w")
  write.table(x, con, sep=sep, row.names=row.names, col.names=col.names)
  close(con)
}
