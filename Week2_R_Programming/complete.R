complete <- function(directory, id = 1:332) { #args: [1]directory name [2] ids of all csv files to be imported
  #set working directory for these files
  setwd("/Users/guidomassaccesi/Documents/Documents/Coursera/R Programming/Week 2/")
  #create a list of files in the directory folder
  file_names <- list.files(directory, full.names = TRUE)
  #create empty data frame with two columns (unnamed for now)
  dat <- data.frame(matrix(ncol=2, nrow=0))
  #loop through ids of choice
  for (i in id){
    #read current file
    current_file<-read.csv(file_names[i])
    #sum the number of complete cases in current file
    nobs<-sum(complete.cases(current_file))
    #bind the row with number file and number of complete cases in that file
    dat <- rbind(dat, c(i, nobs))
  }
  #name columns appropriately
  colnames(dat) <- c("id", "nobs")
  #return the complete file
  return (dat)
}