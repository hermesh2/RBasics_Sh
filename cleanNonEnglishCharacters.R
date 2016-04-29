
cleanNonEnglishCharacters <- 
  function(dir_script, file2read, decimal_char = "," , sep_char =";", encoding_char = "UTF-8", na_strings_char = c(",,", "NA", "N/A", "null", "_")){
    
    file2read_only_English_Char <- paste0( gsub(pattern = ".csv", replacement = "", x = file2read), "_only_English_Char.csv")
    system(paste0(
                "cd ", dir_script, "Data/ ;ls -lah; pwd; 
                cat ", file2read  ," | awk '{print tolower($0)}' | 
                
                # accents
                awk '{gsub( \"á\" ,  \"a\" ); print}' | awk '{gsub( \"é\" ,  \"e\" ); print}' | awk '{gsub( \"í\" ,  \"i\" ); print}' | awk '{gsub( \"ó\" ,  \"o\" ); print}' |
                awk '{gsub( \"ú\" ,  \"u\" ); print}' |
                awk '{gsub( \"à\" ,  \"a\" ); print}' | awk '{gsub( \"è\" ,  \"e\" ); print}' | awk '{gsub( \"ì\" ,  \"i\" ); print}' | awk '{gsub( \"ò\" ,  \"o\" ); print}' | 
                awk '{gsub( \"ù\" ,  \"u\" ); print}' |
                awk '{gsub( \"ñ\" ,  \"n\" ); print}' | awk '{gsub( \"ç\" ,  \"c\" ); print}' | awk '{gsub( \" \" ,  \"_\" ); print}' | awk '{gsub( \"\\(\" ,  \"\" ); print}'|
                

                awk '{gsub( \"Á\" ,  \"A\" ); print}' | awk '{gsub( \"É\" ,  \"E\" ); print}' | awk '{gsub( \"Í\" ,  \"I\" ); print}' | awk '{gsub( \"Ó\" ,  \"O\" ); print}' |
                awk '{gsub( \"Ú\" ,  \"U\" ); print}' |
                awk '{gsub( \"À\" ,  \"A\" ); print}' | awk '{gsub( \"È\" ,  \"E\" ); print}' | awk '{gsub( \"Ì\" ,  \"I\" ); print}' | awk '{gsub( \"Ò\" ,  \"O\" ); print}' | 
                awk '{gsub( \"Ù\" ,  \"U\" ); print}' |
                awk '{gsub( \"Ñ\" ,  \"N\" ); print}' | awk '{gsub( \"Ç\" ,  \"C\" ); print}' |
                

                # Symbols
                awk '{gsub( \"\\)\" ,  \"_\" ); print}'| 
                awk '{gsub( \"[:\'\\'\']\",\"\" ); print}'  | # Erase the ' character
                awk '{gsub( \"\\|\" ,  \"\" ); print}'|
                awk '{gsub( \"%\" ,  \"perCent\" ); print}'|
                # awk '{gsub( \",\" ,  \"\" ); print}'  |
                awk '{gsub( \"/\" ,  \"_\" ); print}'|
                awk '{ gsub( \"“\" , \"\"); print}' | awk '{ gsub( \"”\" , \"\"); print}' |
                # awk '{gsub( \"-\" ,  \"_\" ); print}'| # Problems with negative numbers
                # awk '{gsub( \"[^.*]-[^0-9]|[^0-9]-[^0-9]|-[^0-9]\" ,  \"_\" ); print}'| # Imposible, problems with negative numbers


                awk '{print toupper($0)}'  > ",              
                  file2read_only_English_Char,
                  "; echo '========================\n' ; head ", file2read_only_English_Char, "; echo '========================\n'"
                )
    )
    print(paste0( dir_script, file2read_only_English_Char))
    data_Aux <- fread(input = file.path( dir_script, file2read_only_English_Char), sep = sep_char, header = TRUE, stringsAsFactors = TRUE, verbose = TRUE, 
                      integer64 = "double", dec = decimal_char, encoding = encoding_char, showProgres = TRUE, data.table = TRUE, na.strings = na_strings_char )
    unlink(x = file.path(dir_script, file2read_only_English_Char) )
    return( data_Aux )
  }


