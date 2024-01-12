import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.model_selection import KFold
from ActivityClassification.MEGAInsoleAnalysis import*

"""
Train machine learning models

 Activity key

 #1   walking
 #2   stair ascent
 #3   stair descent
 #4   standing
"""

#Import processed data generated in step 1

MEGA_processed = np.load('MEGA_processed.npy')

#Get X (Features) and Y (labels) data

trainX = MEGA_processed[:,0:3]
trainY = MEGA_processed[:,3]

#Splitting dataset into train and validation sets at 90% and 10% respectively.
X_train, X_test, y_train, y_test = train_test_split(trainX, trainY, train_size=0.90,stratify=trainY,random_state=1)

#Splitting dataset into k folds
kf = KFold(n_splits=5)
X= X_train
y = y_train

for train_index, val_index in kf.split(X):
   X_train2, X_val = X[train_index], X[val_index]
   y_train2, y_val = y[train_index], y[val_index]
    
    #Train models
   svm, knn, rf, dtree = trainModel(X_train2,y_train2)

#Predict using the trained models on the test set
predict_svm, cm_svm = predictActivity(X_test,y_test,svm)
predict_knn, cm_knn = predictActivity(X_test,y_test,knn)
predict_rf, cm_rf = predictActivity(X_test,y_test,rf)
predict_dt, cm_dt = predictActivity(X_test,y_test,dtree)



    






