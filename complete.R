complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files_full <- list.files(directory, full.names = "TRUE") #creates a list of full names
  
  df <- data.frame(id = numeric(0), nobs = numeric(0)) #creates an empty data frame with appropriate header names
  
  for (i in id){          #loops through the files
    dat <-read.csv(files_full[i])     # read each file's data into a temporary data frame 
    cc_no <- nrow(dat[complete.cases(dat),])  #counts complete cases with no missing values in any of the columns 
    df <- rbind (df, c( i, cc_no)) #appends the data for that file's complete cases count into main data frame
  }
  names(df) <- c("id", "nobs") #giving column names as rbind is changing the column names
  
  df
  
}