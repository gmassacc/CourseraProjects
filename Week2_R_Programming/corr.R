corr <- function(directory, threshold = 0) { #args: [1]directory name [2] threshold of complete cases in each file
  #set working directory
  setwd("/Users/guidomassaccesi/Documents/Documents/Coursera/R Programming/Week 2/")
  #create list of file names in directoy
  file_names <- list.files(directory, full.names = TRUE)
  #create a numeric empty vector that will eventually store correlation values
  cor_vector<-numeric()
  #call the complete.R function to figure out complete cases in each dataset
  complete_dat<-complete(directory)
  for (i in 1:nrow(complete_dat)){ #loop through the number of files in the complete table
    if(complete_dat[i,2]>threshold){ #if the number of complete cases is above the threshold
      dat <- data.frame() #create empty dataframe
      dat <- rbind(dat, read.csv(file_names[i])) #read current file and bind to dataframe
      sulfates <- dat[2] #subset sulfates
      nitrates <- dat[3] #subset nitrates
      #append correlation of complete observations between sulfates and nitrates into corr_vector
      cor_vector<-c(cor_vector,cor(sulfates,nitrates, use="complete.obs")) 
    }
  }
  return (cor_vector) #return the vector filled with correlations for datasets above threshold
}