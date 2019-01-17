pollutantmean <- function(directory, pollutant, id=1:332){#args: [1]directory name [2] pollutant whose mean we want [3] ids of all csv files to be imported
  #set working directory for these files
  setwd("/Users/guidomassaccesi/Documents/Documents/Coursera/R Programming/Week 2/")
  #create a list of files in the directory folder
  file_names <- list.files(directory, full.names = TRUE)
  #create empty data frame
  dat <- data.frame()
  #loop through the ids of choice
  for (i in id){
    #bind data rows to empty dataframe as the files loops through selected files
    dat <- rbind(dat, read.csv(file_names[i])) 
  }
  #take mean of column of pollutant choice
  colMeans(dat[pollutant], na.rm = TRUE)
}