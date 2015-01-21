corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  #Empty numeric vector of length 0
  cor_vector <- numeric(0)
  
  #Get the full names of all the files in the directory passed
  filesList <- list.files(directory,full.names = TRUE)
  
  #Count the no of files and create vector of same length
  len <- seq_along(filesList)
  
  # Read each file into dataframe and find out the no of complete cases and do further processing
  for (i in len){
    dat_set <- read.csv(filesList[i],header = TRUE)
    nobs <- nrow(dat_set[complete.cases(dat_set),])

  #Check if the no of complete cases for particular monitor is more than threshold    
    if (nobs > threshold){
      #If yes, add the correlation to the vector which will be returned at the end
      cor_vector <- c(cor_vector,cor(dat_set$sulfate, dat_set$nitrate, use = 'complete')) # correlation with only complete cases
    }
    
  }
  
  #Return the Numeric vector
  cor_vector
}