run_analysis <- function(x){
        test <- read.table("X_test.txt") #assume files are all in current wd
        train <- read.table("X_train.txt")
        ftr <- read.table("features.txt")
        y_test <- read.table("y_test.txt")
        y_train <- read.table("y_train.txt")
        subtest <- read.table("subject_test.txt")
        subtrain <- read.table("subject_train.txt")
        submrg <- rbind(subtrain, subtest)
        colnames(submrg) <- "Subject"
        y_new <- rbind(y_test, y_train) #training labels and test labels
        mrg <- rbind(test, train)
        ftr <- as.data.frame(t(ftr)) #transmute to use for column labels in mrg
        names <- as.character(ftr[2, ])
        colnames(mrg) <- names
        extract <- mrg[, grep("mean", colnames(mrg))] 
        extract <- cbind(extract, mrg[, grep("std", colnames(mrg))]) 
        extract <- cbind(y_new, extract) #then append training labels to first column
        extract <- extract %>% mutate(V1 = replace(V1, V1 == 1, "WALKING"))
        extract <- extract %>% mutate(V1 = replace(V1, V1 == 2, "WALKING_UPSTAIRS"))
        extract <- extract %>% mutate(V1 = replace(V1, V1 == 3, "WALKING_DOWNSTAIRS"))
        extract <- extract %>% mutate(V1 = replace(V1, V1 == 4, "SITTING"))
        extract <- extract %>% mutate(V1 = replace(V1, V1 == 5, "STANDING"))
        extract <- extract %>% mutate(V1 = replace(V1, V1 == 6, "LAYING"))
        #use mutate and replace to assign activity labels
        colnames(extract)[colnames(extract) =="V1"] <- "Activity"
        extract <- cbind(submrg, extract)
        colnames(extract)[colnames(extract) == "V1"] <- "Subject"
        extract <- arrange(extract, extract$Subject)
        new <- split(extract, extract$Subject)
        new1 <- lapply(new, function(x) split(x[3:81], x$Activity))
        newdf <- unique(select(extract, Subject, Activity))
        a <- t(as.data.frame(lapply(new1, function(x) {sapply(x, function(x) {sapply(x, mean)})})))
        #nested apply functions to calculate mean of desired columns
        newdf <<- cbind(newdf, a)
        write.table(newdf, "newdf")
        #creates a new tidy data frame with all desired values in the global environment with "<<-"
}
