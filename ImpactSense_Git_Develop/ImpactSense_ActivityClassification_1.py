#Import libraries
import numpy as np
import pandas as pd

from ActivityClassification.MEGAInsoleAnalysis import*

# Importing sensor data
folderpath = 'data/Left'
MEGAsensor_data = loadData(folderpath)

def processData(data):
    """
      Process sensor data by performing the following steps:
      1) Convert to numpy array
      2) Extract Gyro(X-axis) column (index #11) and labels (index #?)
      3) Filtering Gyro data
      4) Segment into strides
      5) Extract the features

      Input: sensor data
      Returns: Features
    """
    Mega = data.values
    GyroX = Mega[:,11]
    gt=Mega[:,14].reshape(-1,1)
    filtData = filterDataFIR(GyroX)
    strides,strideIndex = segmentStrides(filtData)
    features = extractFeatures(strides)
    labels = gt[strideIndex]
    processed = (np.concatenate([features,labels],axis=1)).astype(int)

    return processed

#Process data
MEGA_processed= map(processData,MEGAsensor_data)
MEGA_processed_list = list(MEGA_processed)
MEGA_processed_combined = np.array(np.concatenate(MEGA_processed_list))

#Save processed data as npy file
np.save('MEGA_processed.npy',MEGA_processed_combined)

#For verification purpose 
processed_df= pd.DataFrame(MEGA_processed_combined)
processed_df.to_csv('processedLeft.csv', header=False, index=False)








