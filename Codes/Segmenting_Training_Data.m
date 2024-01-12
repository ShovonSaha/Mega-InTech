%% Clearing existing variables
% clearvars
close all;
clear all;

%% Importing data for processing
% Changing directory to the folder where the data file exists
cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\COMBINED DATA'

% Importing Participant's Data respective csv files
% DataFullLeft = readmatrix('Left_stairs_up_down_shovon.csv');
DataFullRight = readmatrix('RightStairsAscentCOMBINED.csv');

% Importing Left Data
% DataFullLeft1 = readmatrix('LeftWalkingChristian.csv');
% DataFullLeft2 = readmatrix('LeftWalkingRamisha.csv');
% DataFullLeft3 = readmatrix('LeftWalkingShovon.csv');

% Vertical concatenation
% Data_left_full = vertcat(DataFullLeft1, DataFullLeft2, DataFullLeft3);

% Changing directory to the folder where the data file exists
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\Walking\Right Walking Data'

% Importing Right Data
% DataFullRight1 = readmatrix('RightWalkingChristian.csv');
% DataFullRight2 = readmatrix('RightWalkingRamisha.csv');
% DataFullRight3 = readmatrix('RightWalkingShovon.csv');

% Vertical concatenation
% Data_right_full = vertcat(DataFullRight1, DataFullRight2, DataFullRight3);

% Reading only GyroX Data
DataGyroX = DataFullRight(:,12);
% DataGyroXLeft = DataFullLeft(:,12);
% DataGyroXRight = DataFullRight(:,12);

% Shovon: 
% Standing Left 1: 8825 to 12383
% Standing Left 2: 33559 to 36505
% Standing Left 3: 45730 to 54262
% Standing Left 3: 61215 to 64206

% Data_left1 = DataFullLeft(8825:12383,:);
% Data_left2 = DataFullLeft(33559:36505,:);
% Data_left3 = DataFullLeft(45730:54262,:);
% Data_left4 = DataFullLeft(61215:64206,:);

% Vertical concatenation
% Data_left_full = vertcat(Data_left1, Data_left2, Data_left3, Data_left4);

% Shovon: 
% Standing Right 1: 2762 to 6320
% Standing Right 2: 27496 to 30442
% Standing Right 3: 45597 to 48199
% Standing Right 4: 55153 to 58143

% Data_right1 = DataFullRight(2762:6320,:);
% Data_right2 = DataFullRight(27496:30442,:);
% Data_right3 = DataFullRight(45597:48199,:);
% Data_right4 = DataFullRight(55153:58143,:);

% Vertical concatenation
% Data_right_full = vertcat(Data_right1, Data_right2, Data_right3, Data_right4);


%% Labelling Data
% 1 = w (Walking) || 2 = sa (Stairs Ascent) || 3 = sd (Stairs Descent) || 4 = s (Standing) || 5 = o (run, skip, free)

% Walking
% Data_left(:, 15) = 1;
% Data_right(:, 15) = 1;

% Stairs Ascent
% Data_left_full(:, 15) = 2;
% Data_right_full(:, 15) = 2;

% Stairs Descent
% Data_left_full(:, 15) = 3;
% Data_right_full(:, 15) = 3;

% Standing
% Data_left_full(:, 15) = 4;
% Data_right_full(:, 15) = 4;

%%
% No Activity = 0
% 
% Walking = 1
% Stairs Ascent = 2
% Stairs Descent = 3
% Running = 4
% 
% Other = 5

%% Data filtration
% Filtering loaded data using a low-pass filter. 
% 0.502654824
FiltDataGyroX = lowpass(DataGyroX,.502654824);
% FiltDataGyroXLeft = lowpass(DataGyroXLeft,8/100);
% FiltDataGyroXRight = lowpass(DataGyroXRight,8/100);

%% Plotting filtered data

% Create a figure with two subplots for both Left and Right devices
figure;

% First subplot
subplot(2, 1, 1);
plot(DataGyroX);
title('Unfiltered');
xlabel('Time');
ylabel('GyroX');

% Second subplot
subplot(2, 1, 2);
plot(FiltDataGyroX);
title('Filtered');
xlabel('Time');
ylabel('GyroX');


%% Creating a new csv file with the segmented data
% To change directory to the location where the files would be saved
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\Walking'

% Walking:
% writematrix(Data_left, 'LeftWalkingChristian.csv');
% writematrix(Data_right, 'RightWalkingChristian.csv');

% Stairs Ascent
% writematrix(Data_left_full, 'LeftStairsAscentRamisha.csv');
% writematrix(Data_right_full, 'RightStairsAscentRamisha.csv');

% Stairs Descent
% writematrix(Data_left_full, 'LeftStairsDescentRamisha.csv');
% writematrix(Data_right_full, 'RightStairsDescentRamisha.csv');

% Standing

% Storing COMBINED Data
% writematrix(Data_right_full, 'RightWalkingCOMBINED.csv');
% 
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\Walking\Left Walking Data'
% writematrix(Data_left_full, 'LeftWalkingCOMBINED.csv');
% 
% disp("Data Saved");