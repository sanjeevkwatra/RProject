# I noticed that some feature names were inadvertently  repeated 3 times -- 
# because the subscripts X, Y, Z were left out. The following function finds
# all triplicate feature names and append -X, -Y, -Z to the first, second, third 
# occurences respectively.

appendXYZtoDuplicates<- function (x)
{

	duplicates = x[duplicated(x) | duplicated(x, fromLast=TRUE)]
      dupquicklist= list()
	for(dup in duplicates) {
		dupquicklist[[dup]]= 0
      }
      append = c("X", "Y", "Z")
	for(i in seq(along=x))	{	
		e = x[i];
		if(! (e %in% names(dupquicklist))) {next}

            if(dupquicklist[[e]] >=3 ) {next}
            dupquicklist[[e]] <- dupquicklist[[e]]+1
		e <- paste(e,append[dupquicklist[[e]]],sep="-")
            x[i]= e
      }
      x
}

#  This is the "main" script i.e. execution starts here
#  You are expected to be in the directory that contains "test" and "train" 
#  directories

file_path = file.path ("test", "X_test.txt", fsep = .Platform$file.sep)
X_test <- read.table(file_path)

file_path = file.path ("test", "y_test.txt", fsep = .Platform$file.sep)
y_test <- read.table(file_path)

file_path = file.path ("train", "X_train.txt", fsep = .Platform$file.sep)
X_train <- read.table(file_path)

file_path = file.path ("train", "y_train.txt", fsep = .Platform$file.sep)
y_train <- read.table(file_path)

# Append train and test sets to creat X and y

X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)

features <- read.table("features.txt")

# Clean up feature names
cleanedFeatures <- appendXYZtoDuplicates(as.character(features[,2]))
# Assign column names to X and y
colnames(X) <- cleanedFeatures
colnames(y) <- c("Activity")
# read in activity labels
acitvity_labels = read.table("activity_labels.txt")
# assign activity labels to y to create y_activity
y_activity <- lapply(y[1], function(x) {activity_labels[x,2]})

# Select features in X which contain the word mean or std -- case insensitive
mean_or_std_features <- grep("std|mean", colnames(X),ignore.case=TRUE)
# Select subset of X for these features
X_subset <- select(X, mean_or_std_features)

# read subject data
file_path = file.path ("test", "subject_test.txt", fsep = .Platform$file.sep)
subject_test <- read.table(file_path)

file_path = file.path ("train", "subject_train.txt", fsep = .Platform$file.sep)
subject_train <- read.table(file_path)
# merge subject data

subject <- rbind(subject_test, subject_train)
X$subject <- subject[[1]]

# Append y_activity to X

X$activity <- y_activity[[1]]

grouped <- group_by (X, activity, subject)

# Below is the merged cleaned data that is being turned in
write.table(X, "X.txt", row.names=FALSE)

# From this grouping I should be able to create the data set required for the last part 
# of the assignment. Since the deadline is approaching -- I am unable to finish the last part

