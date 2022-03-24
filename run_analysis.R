test <- read.table("X_test.txt") #assumes files are all in current wd
train <- read.table("X_train.txt")
ftr <- read.table("features.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
mrg <- rbind(test, train)
mrg2 <- data.frame(t(mrg)) #transmute to align with features description
ftrsub <- ftr[grep("mean", ftr$V2), ] #extract only values for mean
ftrsub2 <- ftr[grep("std", ftr$V2), ] #extract only values for std
mrg3 <- rbind(ftrsub, ftrsub2) #combine features into one df
mrg3 <- arrange(mrg3, mrg3$V1)
cols_trainTest <- mrg2[, 1] #identify integer values for matching mrg columns
vals <- mrg[, cols_trainTest] #df with only values for mean and std
y_new <- rbind(y_test, y_train)
colnames(y_new) <- "Activity" #assign label to activity types
namesMatch <- cbind(y_new, vals)
desc_names <- c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")
#using names from activity labels
