%% Clearing existing variables
% clearvars
close all;
clear all;

%% Importing data for processing
% Changing directory to the folder where the data file exists
cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\MegaIntech\DATA for Filtration_Stride _Orientation'

% Importing Participant's Data respective csv files
DataFullLeft = readmatrix('Left_data_for_stride.csv');
DataFullRight = readmatrix('Right_data_for_stride_tapped.csv');

% Reading only GyroX Data
DataGyroXLeft = DataFullLeft(:,12);
DataGyroYLeft = DataFullLeft(:,13);
DataGyroZLeft = DataFullLeft(:,14);

DataGyroXRight = DataFullRight(:,12);
DataGyroYRight = DataFullRight(:,13);
DataGyroZRight = DataFullRight(:,14);

%% Data filtration
% Filtering loaded data using a low-pass filter. 
FiltDataGyroXLeft = lowpass(DataGyroXLeft,8/100);
FiltDataGyroYLeft = lowpass(DataGyroYLeft,8/100);
FiltDataGyroZLeft = lowpass(DataGyroZLeft,8/100);

FiltDataGyroXRight = lowpass(DataGyroXRight,8/100);
FiltDataGyroYRight = lowpass(DataGyroYRight,8/100);
FiltDataGyroZRight = lowpass(DataGyroZRight,8/100);

%% Plotting filtered data

% Create a figure with two subplots for both Left and Right devices
figure;

% First subplot
subplot(2, 1, 1);
plot(FiltDataGyroXLeft);
title('Left Sensor');
xlabel('Time');
ylabel('Gyro');

hold on;
plot(FiltDataGyroYLeft, 'r');
plot(FiltDataGyroZLeft, 'y');

hold off;
legend('GyroX', 'GyroY', 'GyroZ');

% Second subplot
subplot(2, 1, 2);
plot(FiltDataGyroXRight);
title('Right Sensor (tapped)');
xlabel('Time');
ylabel('GyroX');

hold on;

plot(FiltDataGyroYRight, 'r');
plot(FiltDataGyroZRight, 'y');

hold off;