test <- read.table("X_test.txt") #assumes files are all in current wd
train <- read.table("X_train.txt")
ftr <- read.table("features.txt") 
mrg <- rbind(test, train)
ftrsub <- ftr[grep("mean", ftr$V2), ]
ftrsub2 <- ftr[grep("std", ftr$V2), ]
mrg2 <- rbind(ftrsub, ftrsub2)
mrg2 <- arrange(mrg2, mrg2$V1)

#next push