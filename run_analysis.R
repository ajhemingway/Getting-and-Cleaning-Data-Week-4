run_analysis <- function(x){
        test <- read.table("X_test.txt") #assume files are all in current wd
        train <- read.table("X_train.txt")
        ftr <- read.table("features.txt")
        y_test <- read.table("y_test.txt")
        y_train <- read.table("y_train.txt")
        subtest <- read.table("subject_test.txt")
        subtrain <- read.table("subject_train.txt")
        y_new <- rbind(y_test, y_train) #training labels and test labels
        mrg <- rbind(test, train)
        ftr <- as.data.frame(t(ftr)) #transmute to use for column labels in mrg
        names <- as.character(ftr[2, ])
        colnames(mrg) <- names
        extract <- mrg[, grep("mean", colnames(mrg))] 
                %>% cbind(mrg[, grep("std", colnames(mrg))]) #chain to extract only "mean" and "std" variables
        extract <- cbind(y_new, extract) #then append training labels to first column
        
        #CONTINUE HERE TO ASSIGN ACTIVITY NAMES IN PLACE OF NUMBERS FOR FIRST COLUMN
        
        colnames(y_new) <- "Activity" #assign label to activity types
        namesMatch <- cbind(y_new, vals)
        desc_names <- c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")
        #using names from activity labels

}
