%% Clearing existing variables
% clearvars
close all;
clear all;

%% Importing data for processing
% Changing directory to the folder where the data file exists
cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\MegaIntech\Data for Filtration Design'

% Importing Participant's Data respective csv files
% DataFull = readmatrix('Left_normal_walking_for_filter_design[1].csv');

% Reading only GyroX Data
% Left:
% 40 Steps // Start : End = 2738 : 5173

% Right:
% 40 Steps // Start : End = 2293 : 4727
DataFullLeft = readmatrix('Left_data_for_stride.csv');
DataFullRight = readmatrix('Right_data_for_stride_tapped.csv');

DataFullLeftGyroX = DataFullLeft(:,12);
DataFullRightGyroX = DataFullRight(:,12);

%% Data filtration
% Filtering loaded data using a low-pass filter.
FiltDataGyroXRight = lowpass(DataFullRightGyroX,8/100);
FiltDataGyroXLeft = lowpass(DataFullLeftGyroX,8/100);

%% Plotting filtered data

% Create a figure with two subplots for both Left and Right devices
figure;

% First subplot
subplot(2, 2, 1);
plot(DataFullLeftGyroX);
title('Unfiltered Left');
xlabel('Time');
ylabel('GyroX');

% Second subplot
subplot(2, 2, 3);
plot(FiltDataGyroXLeft);
title('Filtered Left');
xlabel('Time');
ylabel('GyroX');

% Third subplot
subplot(2, 2, 2);
plot(DataFullRightGyroX);
title('Unfiltered Right (Tapped)');
xlabel('Time');
ylabel('GyroX');

% Forth subplot
subplot(2, 2, 4);
plot(FiltDataGyroXRight);
title('Filtered Right');
xlabel('Time');
ylabel('GyroX');