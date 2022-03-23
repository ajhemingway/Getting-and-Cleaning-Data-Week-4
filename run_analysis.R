test <- read.table("X_test.txt") #assumes files are all in current wd
train <- read.table("X_train.txt")
ftr <- read.table("features.txt") 
test <- read.table("X_test.txt")
test2 <- data.frame(t(test)) #transmute rows and cols
train <- read.table("X_train.txt")
train2 <- data.frame(t(train)) #transmute rowz and cols
mrg <- rbind(test, train)
ftrsub <- ftr[grep("mean", ftr$V2), ] #filter only values for mean
ftrsub2 <- ftr[grep("std", ftr$V2), ] #filter only values for std
mrg2 <- rbind(ftrsub, ftrsub2) #combine features into one df
mrg2 <- arrange(mrg2, mrg2$V1)

#next push