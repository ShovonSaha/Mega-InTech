%% Clearing existing variables
% clearvars
close all;
clear all;

%% Importing data for processing
% Changing directory to the folder where the data file exists
cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\MegaIntech\Data for Filtration Design'

% Importing Participant's Data respective csv files
DataFull = readmatrix('filter.csv');

% Reading only GyroX Data
% Left:
% 40 Steps // Start : End = 2738 : 5173

% Right:
% 40 Steps // Start : End = 2293 : 4727
DataGyroX = DataFull(:,1);

%% Data filtration
% Filtering loaded data using a low-pass filter.
FiltDataGyroXOld = lowpass(DataGyroX,8/100);
FiltDataGyroX = lowpass(DataGyroX,0.502654824);

%% Plotting filtered data

% Create a figure with two subplots for both Left and Right devices
figure;

% First subplot
subplot(3, 1, 1);
plot(DataGyroX);
title('Unfiltered');
xlabel('Time');
ylabel('GyroX');

% Second subplot
subplot(3, 1, 2);
plot(FiltDataGyroXOld);
title('Filtered with 8/100');
xlabel('Time');
ylabel('GyroX');

% Third subplot
subplot(3, 1, 3);
plot(FiltDataGyroX);
title('Filtered with 0.503');
xlabel('Time');
ylabel('GyroX');