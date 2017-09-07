"Getting and Cleaning Data" Project
============================================

This repository contains the files used to complete the project for the "Getting and Cleaning Data" course of the Coursera JHU Data Science specialization. The goal of the assignment is to produce two tidy data sets from a source data set using an R script, and to provide sufficient documentation. Among the most important files in this repository are:

- `source/`: A directory containing Version 1.0 of the "Human Activity Recognition Using Smartphones Dataset" provided by *Smartlab - Non Linear Complex Systems Laboratory* referred to as the source data set.
- `run_analysis.R`: A commented R script used to create tidy data sets and information from the source data set.
- `CodeBook.md`: A code book describing the tidy data sets.
- `tidy_data.csv`, `tidy_data_avg.csv`: The tidy data sets.

The R script that produces the tidy data sets works by the following steps:
1. Load the feature/activity names from `./source/features.txt` and .`/source/activity_labels.txt` with `read.table`.
2. Load the subject/feature/activity train and test sets from various files in `./source/train` and .`/source/test` with `read.table`.
3. Extract `-mean()` and `-std()` features using `grep` and subsetting.
4. Relabel activity data with activity names using subsetting.
5. Merge train and test subject/feature/activity sets using `rbind` and `cbind`.
6. Make a second data set with the average of each feature for each activity and subject using `aggregate`.
7. Write data sets using `write.table`.
