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

Check the README.txt file for further details about this dataset.

Variables
---------

-   subjectNumber: factor variable; identifier for the subject on which
    measurements were performed
-   variable: factor variable; identifier for the motion variable
-   activityLabel: factor variable; identifier for 6 motion activities
-   meanValue: numeric variable; mean value for the considered variable
    for the specific subject and the spefific activity.

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
