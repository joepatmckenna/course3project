## store data directory name
source_data_dir = './source/'

## load feature/activity labels
feature_names <- read.table(paste0(source_data_dir,'features.txt'),
                            colClasses=c('integer','character'))[,2]
activity_names <- read.table(paste0(source_data_dir,'activity_labels.txt'),
                             colClasses=c('integer','character'))[,2]

## store data set filenames
subject_files <- mapply(paste0,
                        rep(source_data_dir,2),
                        c('train/subject_train.txt', 'test/subject_test.txt'))
feature_files <- mapply(paste0,
                        rep(source_data_dir,2),
                        c('train/X_train.txt', 'test/X_test.txt'))
activity_files <- mapply(paste0,
                         rep(source_data_dir,2),
                         c('train/y_train.txt', 'test/y_test.txt'))

## load data sets
subjects <- lapply(subject_files,
                   read.table,
                   col.names='subject',
                   colClasses='integer',
                   quote='')
features <- lapply(feature_files,
                   read.table,
                   col.names=feature_names,
                   colClasses='numeric',
                   quote='',
                   check.names=F)
activities <- lapply(activity_files,
                     read.table,
                     col.names='activity',
                     colClasses='integer',
                     quote='')

## bind subject train/test data sets
subjects <- rbind(subjects[[1]], subjects[[2]])

## bind feature train/test data sets
features <- rbind(features[[1]], features[[2]])

## extract feature columns of mean() and std() values
means_stds <- grep('mean\\(\\)|std\\(\\)', feature_names)
features <- features[,means_stds]

## extract feature names of mean() and std() values
feature_names <- feature_names[means_stds]

## write list of feature names
write.table(feature_names,
            'features.txt',
            quote=F,
            col.names=F)

## bind activity train/test data sets
activities <- rbind(activities[[1]], activities[[2]])

## relabel activities with descriptive names
activities[,1] <- activity_names[activities[,1]]

## bind subjects/features/activities into one data set
tidy_data <- cbind(subjects,features,activities)

## write tidy data set
write.table(tidy_data,
            'tidy_data.csv',
            quote=F,
            sep=',',
            row.names=F)

## store avgs of tidy data set
tidy_data_avg <- aggregate(features,
                           c(activities,subjects),
                           mean)

## free some memory
rm(subjects, features, activities)

## write tidy data set averages
write.table(tidy_data_avg,
            'tidy_data_avg.csv',
            quote=F,
            sep=',',
            row.names=F)

write.table(tidy_data_avg,
            'tidy_data_avg.txt',
            row.names=F)