CodeBook for “Getting and Cleaning Data” assignment
===================================================

Data set information
--------------------

The data set is a tidy version of the original data provided by [UCI
Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
a set collected from the accelerometers from the Samsung Galaxy S
smartphone for wearable computing. The tidy set provides the mean values
of 79 motion variables for each of the 6 analysed motion activities.

The original data set is provided from experiments which have been
carried out with a group of 30 volunteers within an age bracket of 19-48
years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and
gyroscope, we captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was
selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
‘features\_info.txt’ for more details.

Check the README.txt file for further details about this dataset.

Variables
---------

### Tidy data set

-   subjectNumber: factor variable; identifier for the subject on which
    measurements were performed
-   variable: factor variable; identifier for the motion variable
-   activityLabel: factor variable; identifier for 6 motion activities
-   meanValue: numeric variable; mean value for the considered variable
    for the specific subject and the spefific activity.

### Original data set

-   Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.  
-   Triaxial Angular velocity from the gyroscope.  
-   A 561-feature vector with time and frequency domain variables.  
-   Its activity label.  
-   An identifier of the subject who carried out the experiment.

Transformations
---------------

The cleaning of the original data set has involved:  
1. Merging the training and the test sets to create one data unique
set.  
2. Extraction of all the calculated variables related to mean and
standard deviationonly.  
3. Usageg of descriptive activity names to name the activities in the
data set.  
4. Appropriate labelling of the data set with descriptive variable
names.  
5. Calculating the average of each variable for each activity and each
subject.
