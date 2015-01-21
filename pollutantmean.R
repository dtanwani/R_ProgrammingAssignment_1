pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  files_full <- list.files(directory, full.names = "TRUE") #creates a list of full names
  
  dat <- data.frame() #creates an empty data frame
  
  for (i in id){
    #loops through the files, rbinding them together
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  
  if (pollutant == "sulfate"){
    dat_mean <- mean(dat$sulfate,na.rm = "TRUE")
  } else if (pollutant == "nitrate"){
    dat_mean <- mean(dat$nitrate,na.rm = "TRUE")
  }

  dat_mean
}