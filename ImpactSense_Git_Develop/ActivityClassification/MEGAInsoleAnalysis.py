import numpy as np
import pandas as pd
import pickle
import glob
import sympy as sym
import seaborn as sns
import matplotlib.pyplot as plt
from pylab import *
from scipy.signal import *

#Machine learning
from sklearn.svm import SVC
#from sklearn.multiclass import OneVsRestClassifier, OneVsOneClassifier
from sklearn.neighbors import KNeighborsClassifier #K-Neighbors classifier
from sklearn.tree import DecisionTreeClassifier #Decision Tree classifier
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics

def loadData(path):
    """
    1. Loads multiple csv files for each activity or participant.
    2. Reads each csv file into a dataframe.
    3. Dataframes placed in a list.

    Input: path to folder containing the csv files
    Returns: list of dataframes (for each activity or participant)
    """
    filepath = glob.glob(path + "/*.csv")

    def readCsv(args):
        #Reads csv file into a dataframe
        return pd.read_csv(args, index_col=False, header=None)
    
    df = map(readCsv,filepath)
    listdf = list(df)

    return listdf 


def filterData(data):
    """
        Filters the loaded data using a low-pass, butterworth filter of order N.
        Input: sensor data
        Returns: filtered data
    """    
    N,_ = buttord(8/100,0.3,3,60)
    b,a= butter(N,0.08,'low')
    filtered_data = lfilter(b,a,data)

    return filtered_data

def filterDataFIR(data):
    """
        Filters the loaded data using a low pass, FIR filter of order N.
        Input: sensor data
        Returns: filtered data

    """

    #The desired width of the transition (rad/s) from pass to stop 
    width = 0.05

    #The desired attenuation in the stop band (dB).
    ripple_db = 60.0

    #Calculate the order and Kaiser parameter for the FIR filter.
    N, beta = kaiserord(ripple_db, width)

    # The cutoff frequency of the filter (rad/s).
    cutoff_wn = 0.08

    # Use firwin with a Kaiser window to create a lowpass FIR filter.
    taps = firwin(N, cutoff_wn, window=('kaiser', beta))

    # Use lfilter to filter x with the FIR filter.
    filtered_data = lfilter(taps, 1.0, data)

    return filtered_data

def segmentStrides(fdata, debug=False):
    """
       Segments the filtered data into strides.
       1) Finding peaks and their corresponding indices.
       2) Resample the data to 100 Hz.
       3) Store each stride into a numpy array
    
       Input: filtered data
       Returns: segmented data(strides)
    """

    ind,_ = find_peaks((-fdata),height=200, distance=60, prominence=250)
    peak = -fdata[ind]

    if debug:
        print(ind)
        print('')
        print(len(peak))
        print('')
        print(peak)
        

    desiredFs=100
    strides = np.zeros((desiredFs,0))
    stride_ind = np.zeros((0,1))

    for peakIter in range(1,len(peak)):
        if ind[peakIter] - ind[peakIter - 1] > 300:
            continue
        else:
            oneStride = fdata[np.arange(ind[peakIter - 1],ind[peakIter]+1)]
            #Resampling the data
            originalFs = len(oneStride)
            a = sym.Rational(desiredFs, originalFs)
            u = a.numerator
            d = a.denominator
            oneStride = resample_poly(oneStride,u,d) 

            # Storing oneStride into numpy array strides
            strides = np.column_stack([strides, oneStride])
            #Keeping index corressponding to stride
            stride_ind = np.row_stack([stride_ind,ind[peakIter]])
            
    stride_ind = (stride_ind.reshape(-1)).astype(int)
                   
    return strides, stride_ind

def extractFeatures(strides, debug=False):
    """
      Extracts features from the strides.
      Features extracted: 1st +ve peak, 2nd +ve peak and 1st -ve peak
      Input: strides
      Returns: features
    """
    #peakIter = 0
    m,n = strides.shape
    features = np.zeros((n,3))

    if debug:
        print(m)
        print(n)

    for peakStrideIter in range(0,n):
    
        indStrides,_ = find_peaks(strides[:,peakStrideIter],height=50, distance=20, prominence=100)
        peakStrides = strides[indStrides]
        
        negIndStrides,_ = find_peaks(-strides[:,peakStrideIter],height=125,prominence=125)
        negPeakStrides = strides[negIndStrides]
        
        # Restricting the analysis from 20 to 80 percent of the strides
        # original is set at 125 for both
        negPeakStrides = negPeakStrides[np.logical_and((negIndStrides > 20),(negIndStrides < 80))]
        negIndStrides = negIndStrides[np.logical_and((negIndStrides > 20),(negIndStrides < 80))]

        if len(peakStrides)==0 and len(negPeakStrides)==0:
            break   #Need modification for standing - Shovon
        else:
            if len(peakStrides)==0 or len(negPeakStrides)==0:
                #     Checking for empty arrays
                if len(peakStrides)==0:
                    if not len(negPeakStrides)==0 :
                        features[peakStrideIter,2] = negIndStrides[0]
                else:
                    if len(peakStrides) == 1:
                        features[peakStrideIter,0] = indStrides[0]
                    else:
                        len(peakStrides) > 1
                        features[peakStrideIter,0] = indStrides[0]
                        features[peakStrideIter,1] = indStrides[1]
            else:
                if len(peakStrides) == 1:
                    features[peakStrideIter,0] = indStrides[0]
                    features[peakStrideIter,2] = negIndStrides[0]
                else:
                    len(peakStrides) > 1
                    features[peakStrideIter,0] = indStrides[0]
                    features[peakStrideIter,1] = indStrides[1]
                    features[peakStrideIter,2] = negIndStrides[0]

    return features

def trainModel(x,y):
    """
       Train the model using ML classifiers. 
       Input: features (x), labels (y)
       Returns: model
    """  
    #Train - SVM (Support Vector Machines)
    model1 = SVC(kernel='rbf')
    model1.fit(x,y)

    #Train - KNN (K-Nearest Neighbours)
    model2 = KNeighborsClassifier(n_neighbors=5)
    model2.fit(x,y)

    #Train - Random Forest 
    model3 = RandomForestClassifier(n_estimators=150)
    model3.fit(x,y)

    #Train - Decision Trees
    model4 = DecisionTreeClassifier(random_state=0)
    model4.fit(x,y)

    return model1, model2, model3, model4

def predictActivity(testdata,label,model):
    """
        Predict activity, given each set of features
        Input: test features, test labels, model
        Returns: activity predictions, confusion matrix
    """
    prediction = model.predict(testdata)
    print(metrics.accuracy_score(prediction,label))
    print(metrics.classification_report(label,prediction))

#Generate the confusion matrix and prediction accuracy
    cm = metrics.confusion_matrix(label,prediction)
    cm_df = pd.DataFrame(cm,
                     index = ['walk','ascent','descent','stand'], 
                     columns = ['walk','ascent','descent','stand'])
    
    #Visualize the confusion matrix
    sns.heatmap(cm_df,annot=True,fmt="d")
    plt.show()

    return prediction,cm_df

def saveModel(model, filename):
    """Save ML model
       Input: Name of file to save the model
    """
    pickle.dump(model, open(filename, "wb"))

    return


def loadModel(filename):
    """Load ML model
       Input: filename of model
       Returns: model
    """
    
    model = pickle.load(open(filename, "rb"))

    return model

