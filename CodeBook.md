Getting and Cleaning Data Project Code Book
==================================================================
The tidy data sets (`tidy_data.csv` and `tidy_data_avg.csv`) described in this document are sourced from Version 1.0 of the "Human Activity Recognition Using Smartphones Dataset" (files copied in `source/`) provided by:

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Università degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws

The following is a passage from `source/README.txt` of the source data set

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

A subset of the features described above were extracted to form the tidy data sets. Those feature are further described in `features_info.txt`. 

Each record contains:
======================================

- An identifier of the subject who carried out the experiment.
- A 66-feature vector with time and frequency domain variables. 
- Its activity description.

The dataset includes the following files:
=========================================

- `README.md`: A file describing how the source data is tidied.
- `run_analysis.R`: An R script that produces the tidy data sets from the source data set.
- `features_info.md`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `tidy_data.csv`: Tidy data set. 
- `tidy_data_avg.csv`: Average of each feature for each activity and each subject in `tidy_data.csv`.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
