test <- read.table("X_test.txt") #assumes files are all in current wd
train <- read.table("X_train.txt")
ftr <- read.table("features.txt") 
mrg <- rbind(test, train)
ftrsub <- ftr[grep("mean", ftr$V2), ] #extract only values for mean
ftrsub2 <- ftr[grep("std", ftr$V2), ] #extract only values for std
mrg2 <- rbind(ftrsub, ftrsub2) #combine features into one df
mrg2 <- arrange(mrg2, mrg2$V1)
cols_train <- mrg2[, 1]

#next push