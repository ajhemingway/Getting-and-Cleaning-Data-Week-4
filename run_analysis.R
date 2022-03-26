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
                %>% cbind(mrg[, grep("std", colnames(mrg))]) #chain to extract only "mean" and "std" variables
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
        sub1 <- extract[extract$Subject == 1, ]
        sub2 <- extract[extract$Subject == 2, ]
        sub3 <- extract[extract$Subject == 3, ]
        sub4 <- extract[extract$Subject == 4, ]
        sub5 <- extract[extract$Subject == 5, ]
        sub6 <- extract[extract$Subject == 6, ]
        sub7 <- extract[extract$Subject == 7, ]
        sub8 <- extract[extract$Subject == 8, ]
        sub9 <- extract[extract$Subject == 9, ]
        sub10 <- extract[extract$Subject == 10, ]
        sub11 <- extract[extract$Subject == 11, ]
        sub12 <- extract[extract$Subject == 12, ]
        sub13 <- extract[extract$Subject == 13, ]
        sub14 <- extract[extract$Subject == 14, ]
        sub15 <- extract[extract$Subject == 15, ]
        sub16 <- extract[extract$Subject == 16, ]
        sub17 <- extract[extract$Subject == 17, ]
        sub18 <- extract[extract$Subject == 18, ]
        sub19 <- extract[extract$Subject == 19, ]
        sub20 <- extract[extract$Subject == 20, ]
        sub21 <- extract[extract$Subject == 21, ]
        sub22 <- extract[extract$Subject == 22, ]
        sub23 <- extract[extract$Subject == 23, ]
        sub24 <- extract[extract$Subject == 24, ]
        sub25 <- extract[extract$Subject == 25, ]
        sub26 <- extract[extract$Subject == 26, ]
        sub27 <- extract[extract$Subject == 27, ]
        sub28 <- extract[extract$Subject == 28, ]
        sub29 <- extract[extract$Subject == 29, ]
        sub30 <- extract[extract$Subject == 30, ]#subject identifiers 
        
}
