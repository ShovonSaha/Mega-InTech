#Import libraries
import numpy as np
import pandas as pd
#import pickle
import matplotlib.pyplot as plt
from pylab import *

from ActivityClassification.MEGAInsoleAnalysis import*

"""
This script used to test the data processing algorithms using a single file
Note: If you want to view the data or results like stride shape or features, uncomment the print statements

"""
# Importing sensor data and ground truth 
MEGAsensor_data = pd.read_csv('data/Right/RightStandingCOMBINED.csv',index_col=False, header=None)

#To visualize structure of the data
MEGAsensor_data.head()

# Reading only GyroX Data
Mega = MEGAsensor_data.values
GyroX = Mega[:,11]
#print(GyroX)

#Convert label to numpy array 
gt=Mega[:,14]  
#print(gt)

#Filtering the data
filtData = filterDataFIR(GyroX)
#print(filtData)

#Segmenting strides
strides, strIndex = segmentStrides(filtData, debug=True)
#print(strides.shape)
#print('')
#print(strides)
#print(strIndex)

#Feature extraction
features = extractFeatures(strides, debug=True)
#print(features.shape)
#print('')
#print(features)

#Activity classification

#Activity key

#1   walking
#2   stair ascent
#3   stair descent
#4   standing

#Load model
#model_file = 'Mdl.pickle'
#model = pickle.load(open(model_file, "rb"))

#Generate the predictions and confusion matrix
#prediction,cm_df = predictActivity(features, gt ,model) 
#print(prediction)

#Visualize the confusion matrix
#sns.heatmap(cm_df,annot=True,fmt="d")
#Save figure
#plt.savefig('confusionmatrix1.jpg')

#plot data
#plt.plot(prediction)
#plt.ylabel('Activity')
#plt.show()




