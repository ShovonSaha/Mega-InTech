%% Clearing existing variables
% clearvars
% clearvars -except Mdl
% clear all;
% close all;

%% Changing directory to the folder where the data file exists

% Just walking strides. Small sample connected for tuning algorithm. Also
% for Running
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\MegaIntech\DATA for Filtration_Stride _Orientation'

% % Right Walking Combined:
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\Walking\Right Walking Data'

% % Right Stairs Ascent Combined:
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\Stairs\Stairs Ascent\Right'

% Right Stairs Descent Combined:
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Desktop\Training Data\Stairs\Stairs Descent\Right'

% % Running and Standing:
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Mega Intech Data Collection\25_April_2023\Ramisha\Running and Standing'


%% Importing full csv file as a matrix

% Testing out new clips
% DataFull = readmatrix('Left_new_clips.csv');
% DataFull = readmatrix('Right_new_clips.csv');

% % Mixed activities analysis: Walking_TM >> Running >> Walking_TM >> Walking >> Stairs Descent >> Walking >> Stairs Ascent >> Walking >>
% Walking_TM >> Running >> Walking (to the computer)

% DataFull = readmatrix('Right_mixed_act.csv');
% DataFull = readmatrix('Left_mixed_act.csv');

% DataFull = readmatrix('Left_sakib_mixed.csv');
% DataFull = readmatrix('Right_sakib_mixed.csv');

% DataFull = readmatrix('Left_ramisha_mixed.csv');
% DataFull = readmatrix('Right_ramisha_mixed.csv');

% Tablet test files
% DataFull = readmatrix('Right_test.csv');
% DataFull = readmatrix('Left_test.csv');

% % Adam Stairs Ascent/Descent and Running Data
% DataFull = readmatrix('Left_stairs_ascent_descent_Adam.csv');
% DataFull = readmatrix('Right_stairs_ascent_descent_Adam.csv');
% DataFull = readmatrix('Right_running_Adam.csv');
% DataFull = readmatrix('Left_running_Adam.csv');

% % Right and Left small random data:
% DataFull = readmatrix('Right_rand.csv');
% DataFull = readmatrix('Left_rand.csv');

% % Right Running and Standing:
% DataFull = readmatrix('Left_running_standing_ramisha.csv');

% % Just walking strides. Small sample connected for filtration
% DataFull = readmatrix('Right_data_for_stride_tapped.csv');
% DataFull = readmatrix('Left_data_for_stride.csv');

% % Right Walking Combined:
% DataFull = readmatrix('RightWalkingCOMBINED.csv');

% % Left Mixed Data:
% DataFull = readmatrix('Left_Descent_Walk_Ascent_Walk.csv');

% % Right Stairs Ascent Combined:
% DataFull = readmatrix('RightStairsAscentCOMBINED.csv');

% Right Stairs Descent Combined:
% DataFull = readmatrix('RightStairsDescentCOMBINED.csv');

% % Left Stairs and Walking (TAPED): Stairs Descent -> Ascent -> Walking
% DataFull = readmatrix('Left_stairs_walking.csv');

%% Reading only GyroY Data. [Updated to GyroY from GyroX after checking the
% orientation of the new set of sensors.
% % 20 Strides
% DataGyroY = DataFull(1804:4273,13);

% Left (without tapped)
% DataGyroY = DataFull(2974:5328,13);

% % Right Running and Standing:
% DataGyroY = DataFull(:,13);

% DataGyroY = DataFull(:,13);

% Other Gyros
% DataGyroX = DataFull(:,12);
% DataGyroZ = DataFull(:,14);

% DataGyroY = DataFull(:,13);

% Other Gyros
% DataGyroX = DataFull(:,12);
% DataGyroZ = DataFull(:,14);

%% Changing directory for JULIA and DAVE's data folders:

% JULIA's DATA

% Julia_20231206
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231206\ImpactSense'

% Julia_20231218
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231218\ImpactSense'

% Julia_20240108
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20240108\ImpactSense'

% Dave
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Dave_Data\ImpactSense'

%% Processing DATA: Reading csv file and extracting data

% No Activity = 0
% 
% Walking = 1
% Stairs Ascent = 2
% Stairs Descent = 3
% Running = 4
% 
% Other = 5

% Features matrix update:
% Column         Content
%   1      1st Positive Peak Index
%   2      2nd Positive Peak Index
%   3      1st Negative Peak Index
%   4      Max Magnitude of the Positive Peak
%   5      Activity-based on Magnitude

% To reverse the signal: The (-) sign needs to be removed put infront of
% the -lowpass(); during **Data-Filtration**
% filtGyroY = -lowpass(DataGyroY,2/100); 


% Date: Julia_20231206 (06 December, 2023)

% Dataset_1: EMWM010117
% DataFull = readmatrix('Julia_20231206_ImpactSense_EMWM010117Aidf_Left_EE4623FE1AA4_06122023092906.csv');
% DataFull = readmatrix('Julia_20231206_ImpactSense_EMWM010117Aidf_Right_D8F779651FCC_06122023093317.csv');  % Signal needs to be reversed.

% Dataset_2: HMWM010117
% DataFull = readmatrix('Julia_20231206_ImpactSense_HMWM010117Jidf_Left_EE4623FE1AA4_06122023091408.csv');   
% DataFull = readmatrix('Julia_20231206_ImpactSense_HMWM010117Jidf_Right_D8F779651FCC_06122023090957.csv');


% Date: % Julia_20231218 (18 December, 2023)

% Dataset_1: Bethany
% DataFull = readmatrix('Julia_20231218_ImpactSense_bethany_Left_EE4623FE1AA4_18122023101143.csv'); 
% DataFull = readmatrix('Julia_20231218_ImpactSense_bethany_Right_D8F779651FCC_18122023101409.csv'); 

% Dataset_2: CMwm070222
% DataFull = readmatrix('Julia_20231218_ImpactSense_CMwm070222Pidf_Left_EE4623FE1AA4_18122023100400.csv');
% DataFull = readmatrix('Julia_20231218_ImpactSense_CMwm070222Pidf_Right_D8F779651FCC_18122023095958.csv');

% Dataset_3: MMwm070222
% DataFull = readmatrix('Julia_20231218_ImpactSense_MMwm070222Nidf_Left_EE4623FE1AA4_18122023091636.csv');
% DataFull = readmatrix('Julia_20231218_ImpactSense_MMwm070222Nidf_Right_D8F779651FCC_18122023092027.csv);

% Dataset_4: RMwm070222
% DataFull = readmatrix('Julia_20231218_ImpactSense_RMwm070222Didf_Left_EE4623FE1AA4_18122023093616.csv');
% DataFull = readmatrix('Julia_20231218_ImpactSense_RMwm070222Didf_Right_D8F779651FCC_18122023093348.csv');

% Dataset_5: VMwm070222
% DataFull = readmatrix('Julia_20231218_ImpactSense_VMwm070222Aidm_Left_EE4623FE1AA4_18122023094739.csv');
% DataFull = readmatrix('Julia_20231218_ImpactSense_VMwm070222Aidm_Right_D8F779651FCC_18122023095005.csv');



% Date: Julia_20240108 (08 January, 2024)

% Dataset_1: BMWM070222H
% DataFull = readmatrix('BMWM070222H_Left_EE4623FE1AA4_08012024100659.csv'); 
% DataFull = readmatrix('BHMWM070222H_Right_D8F779651FCC_08012024100916.csv'); 

% Dataset_2: BMWM070222S
% DataFull = readmatrix('BMWM070222S_Left_EE4623FE1AA4_08012024095043.csv');
% DataFull = readmatrix('BMWM070222S_Right_D8F779651FCC_08012024094911.csv');

% Dataset_3: GMWM070222D
% DataFull = readmatrix('GMWM070222D_Left_EE4623FE1AA4_08012024092050.csv');
% DataFull = readmatrix('GMWM070222D_Right_D8F779651FCC_08012024091854.csv');

% Dataset_4: HMWM070222A
% DataFull = readmatrix('HMWM0702222A_Left_EE4623FE1AA4_08012024090515.csv');
% DataFull = readmatrix('HMWM070222A_Right_D8F779651FCC_08012024090751.csv');

% Dataset_5: MMWM07022R
% DataFull = readmatrix('MMWM07022R_Left_EE4623FE1AA4_08012024092939.csv');
% DataFull = readmatrix('MMWM070222R_Right_D8F779651FCC_08012024092812.csv');

% Dataset_6: MMWM070222E
% DataFull = readmatrix('MMWM070222E_Left_EE4623FE1AA4_08012024093839.csv');
% DataFull = readmatrix('MMWM070222E_Right_D8F779651FCC_08012024094005.csv');

% Dataset_7: MMWM070222M
% DataFull = readmatrix('MMWM070222M_Left_EE4623FE1AA4_08012024095925.csv');
% DataFull = readmatrix('MMWM070222M_Right_D8F779651FCC_08012024100051.csv');



% Date: Dave (06 March, 2024)

% Dataset_1: Dave
% DataFull = readmatrix('Dave_20240306185547_Dave_Left_EE4623FE1AA4_06032024015352.csv'); 
% DataFull = readmatrix('Dave_20240306185547_Dave_Right_D8F779651FCC_06032024015118.csv'); 

%% Plotting all of the gyro and acc data for analysis

clear all;
close all;

% Changing directory for TURNING data folders:
cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Turning_Data\180_slow_normal_fast'
DataFull = readmatrix('Right_180_slow_normal_fast.csv');   

% Julia_20231206
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231206\ImpactSense'

% Date: Julia_20231206 (06 December, 2023)
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231206\ImpactSense'

% Dataset_2: HMWM010117
% DataFull = readmatrix('Julia_20231206_ImpactSense_HMWM010117Jidf_Left_EE4623FE1AA4_06122023091408.csv');   
% DataFull = readmatrix('Julia_20231206_ImpactSense_HMWM010117Jidf_Right_D8F779651FCC_06122023090957.csv');

% Datafull Field Names and Column No.
% Packet#	 Month	 Day	 Year	 Hour	 Minute	 Second	 MS	 ACC X	 ACC Y	 ACC Z	 GYR X	 GYR Y	 GYR Z
%   1	       2	  3	       4	  5	        6	    7	  8	   9	  10       11      12	  13       14 



% % Extract gyroscope and accelerometer data
% DataGyroX = DataFull(:, 12);
% DataGyroY = DataFull(:, 13);
% DataGyroZ = DataFull(:, 14);
% DataAccX = DataFull(:, 9);
% DataAccY = DataFull(:, 10);
% DataAccZ = DataFull(:, 11);
% 
% % Create no. of packets vector
% packets = DataFull(:, 1); 
% 
% FilteredDataGyroX = -lowpass(DataGyroX,2/100);
% FilteredDataGyroY = -lowpass(DataGyroY,2/100);
% FilteredDataGyroZ = -lowpass(DataGyroZ,2/100);
% FilteredDataAccX = -lowpass(DataAccX,2/100);
% FilteredDataAccY = -lowpass(DataAccY,2/100);
% FilteredDataAccZ = -lowpass(DataAccZ,2/100);
% 
% % Plot filtered gyroscope data
% figure;
% subplot(2, 1, 1);
% plot(packets, FilteredDataGyroX, 'r', packets, FilteredDataGyroY, 'g', packets, FilteredDataGyroZ, 'b');
% % plot(packets, FilteredDataGyroY, 'g', packets, FilteredDataGyroZ, 'b');
% xlabel('No. of Packets');
% ylabel('Filtered Gyroscope Data');
% legend('GyroX', 'GyroY', 'GyroZ');
% % legend('GyroY', 'GyroZ');
% title('Filtered Gyroscope Data');
% 
% % Plot filtered accelerometer data
% subplot(2, 1, 2);
% plot(packets, FilteredDataAccX, 'r', packets, FilteredDataAccY, 'g', packets, FilteredDataAccZ, 'b');
% xlabel('No. of Packets');
% ylabel('Filtered Accelerometer Data');
% legend('AccX', 'AccY', 'AccZ');
% title('Filtered Accelerometer Data');

%% Filtering loaded data using a low-pass filter
% New filter parameter after discussion with James and Ranjani
% % filtGyroY = lowpass(DataGyroX,0.502654824); % New filter. Old one works
% better

% % Remove columns 9 to 12 from DataFull
% DataFull(:, 9:12) = [];

% Now DataFull contains all columns except columns 9 to 12
% Packet#	 Month	 Day	 Year	 Hour	 Minute	 Second	 MS	 GYR Y	 GYR Z
%   1	       2	  3	       4	  5	        6	    7	  8	   9	  10

% % After removing the columns
% DataGyroY = DataFull(:,9);

% If the columns were not removed
DataGyroY = DataFull(:,13);
DataGyroZ = DataFull(:, 14);

filtGyroY = -lowpass(DataGyroY,2/100); % The (-) sign needs to be removed put infront of the (-)lowpass() to reverse the signal
filtGyroZ = -lowpass(DataGyroZ,2/100);


figure;
plot(-filtGyroY);
hold on;
plot(-filtGyroZ);
hold off;
xlabel('No. of Packets');
ylabel('Gyro');
title('Filtered Gyro Y & Gyro Z');
legend('Filtered Gyro Y', 'Filtered Gyro Z');


% filtGyroY = lowpass(DataGyroY,5/100);

% Old filter parameter
% filtGyroY = lowpass(DataGyroX,8/100);
% [filtGyroY,d]= lowpass(DataGyroX,8/100,100);

%% Activity or No-activity detection

% Define parameters
window_size = 15;
activity_threshold = 100; % Adjust as needed
high_val = 10000;

% Initialize labels vector
labels = zeros(size(DataFull, 1), 1);

% Iterate over filtGyroY data in a moving window
for i = 1:(length(filtGyroY) - window_size + 1)
    % Extract window of filtGyroY data
    window_data = filtGyroY(i:i+window_size-1);
    
    % Calculate standard deviation of the window data
    window_std_dev = std(window_data);
    
    % Check if std_dev is below activity threshold
    if window_std_dev < activity_threshold
        % Label all datapoints in the window as no activity (0)
        labels(i:i+window_size-1) = 0;
    else
        % Label all datapoints in the window as activity (1 or any other high value)
        labels(i:i+window_size-1) = high_val;
    end
end

% Append the labels to the DataFull matrix as the 15th column
DataFull_labeled = [DataFull, labels];


% 3 Window -threshold based activity/no-activity labelling
consecutive_windows = 20; % Number of consecutive windows required for labeling

% Initialize activity counters
activity_counter = 0;
no_activity_counter = 0;

% Initialize the 16th column of DataFull_labeled
DataFull_labeled(:, 16) = 0;

% Iterate through the 15th column of DataFull_labeled
for i = 1:length(DataFull_labeled) - window_size + 1
    % Extract the window of activity labels
    window_labels = DataFull_labeled(i:i+window_size-1, 15);

    % Count the number of activity and no activity labels in the window
    num_activity = sum(window_labels);
    num_no_activity = window_size - num_activity;

    % Check if the number of activity or no activity labels exceeds the threshold
    if num_activity >= activity_threshold * window_size
        activity_counter = activity_counter + 1;
        no_activity_counter = 0;
    elseif num_no_activity >= (1 - activity_threshold) * window_size
        activity_counter = 0;
        no_activity_counter = no_activity_counter + 1;
    else
        activity_counter = 0;
        no_activity_counter = 0;
    end

    % Label the 16th column based on consecutive activity or no activity windows
    if activity_counter >= consecutive_windows
        DataFull_labeled(i:i+window_size-1, 16) = high_val; % Label as activity
    elseif no_activity_counter >= consecutive_windows
        DataFull_labeled(i:i+window_size-1, 16) = 0; % Label as no activity
    end
end

% Define parameters
min_segment_length = 60; % Minimum length of a segment to be retained

% Initialize activity and no activity segments
activity_segments = []; % 
no_activity_segments = [];

% Extract segments of activity and no activity
for i = 1:length(DataFull_labeled)
    if DataFull_labeled(i, 16) == high_val
        if isempty(activity_segments) || activity_segments(end, 2) < i-1
            activity_segments = [activity_segments; i, i];
        else
            activity_segments(end, 2) = i;
        end
    else
        if isempty(no_activity_segments) || no_activity_segments(end, 2) < i-1
            no_activity_segments = [no_activity_segments; i, i];
        else
            no_activity_segments(end, 2) = i;
        end
    end
end

% Merge adjacent segments that are below the minimum length threshold
activity_segments = merge_segments(activity_segments, min_segment_length);
no_activity_segments = merge_segments(no_activity_segments, min_segment_length);

% Update the 16th column of DataFull_labeled based on the merged segments
DataFull_labeled(:, 16) = 0; % Reset the 16th column
for i = 1:size(activity_segments, 1)
    DataFull_labeled(activity_segments(i, 1):activity_segments(i, 2), 16) = high_val;
end
for i = 1:size(no_activity_segments, 1)
    DataFull_labeled(no_activity_segments(i, 1):no_activity_segments(i, 2), 16) = 0;
end

% Plot filtGyroY and the 16th column of DataFull_labeled
figure;
plot(filtGyroY, 'b', 'LineWidth', 1.5);
hold on;
plot(DataFull_labeled(:, 16), 'r', 'LineWidth', 1.5);
hold off;
xlabel('No. of Packets');
ylabel('Data / Activity Label');
title('Filtered Gyro Y Data and Activity Label');
legend('Filtered Gyro Y', 'Activity Label');

% merged_segments() initialized at the very end of the file: Function to merge adjacent segments below the minimum length threshold


%% Analyzing Gyro-Z data for Turn-detection

% Define window size for integration
window_size = 10;

% Initialize arrays to store integrated values
integrated_filtGyroY = zeros(size(DataFull_labeled, 1), 1);
integrated_filtGyroZ = zeros(size(DataFull_labeled, 1), 1);

% Integrate filtGyroY and filtGyroZ data for activity segments
for i = 1:size(activity_segments, 1)
    % Extract segment of filtGyroY and filtGyroZ data
    filtGyroY_activity_segment = filtGyroY(activity_segments(i, 1):activity_segments(i, 2));
    filtGyroZ_activity_segment = filtGyroZ(activity_segments(i, 1):activity_segments(i, 2));
    
    % Divide the segment into smaller windows
    num_windows = ceil(length(filtGyroY_activity_segment) / window_size);
    
    % Integrate each window using trapz
    for j = 1:num_windows
        % Calculate window indices
        start_idx = (j - 1) * window_size + 1;
        end_idx = min(j * window_size, length(filtGyroY_activity_segment));
        window_indices = start_idx:end_idx;
        
        % Integrate the current window using trapz if window_indices is not empty
        if ~isempty(window_indices)
            integrated_segment_Y = trapz(filtGyroY_activity_segment(window_indices));
            integrated_segment_Z = trapz(filtGyroZ_activity_segment(window_indices));
        else
            integrated_segment_Y = 0; % Set to 0 if window_indices is empty
            integrated_segment_Z = 0; % Set to 0 if window_indices is empty
        end
        
        % Store the integrated value for each window
        integrated_filtGyroY(activity_segments(i, 1) + start_idx - 1) = integrated_segment_Y;
        integrated_filtGyroZ(activity_segments(i, 1) + start_idx - 1) = integrated_segment_Z;
    end
end


% % Plot filtGyroY, filtGyroZ, and their integrated values in one plot
% figure;
% plot(filtGyroY, 'b', 'LineWidth', 1.5);
% hold on;
% plot(filtGyroZ, 'r', 'LineWidth', 1.5);
% % plot(integrated_filtGyroY, 'g--', 'LineWidth', 1.5);
% plot(integrated_filtGyroZ, 'm--', 'LineWidth', 1.5);
% plot(DataFull_labeled(:, 16), 'k', 'LineWidth', 1.5);
% hold off;
% xlabel('No. of Packets');
% ylabel('Data / Integrated Data');
% title('Filtered Gyro Y and Z Data with Integrated Values');
% % legend('Filtered Gyro Y', 'Filtered Gyro Z', 'Integrated Gyro Y', 'Integrated Gyro Z');
% legend('Filtered Gyro Y', 'Filtered Gyro Z', 'Integrated Gyro Z', 'Activity label');



% % Detect peaks in the smoothed angular velocity signal
% [pks, locs] = findpeaks(integrated_filtGyroZ);
% 
% % Define the threshold for identifying significant peaks
% threshold = 30000; % Adjust as needed
% significant_peaks = pks > threshold;
% 
% % Filter out insignificant peaks
% significant_pks = pks(significant_peaks);
% significant_locs = locs(significant_peaks);
% 
% % Initialize an array to store the labeled segments
% turn_segments = zeros(size(DataFull_labeled, 1), 1);
% 
% % Iterate over the significant peaks
% for i = 1:length(significant_locs)
%     % Find the start and end indices of the segment around the peak
%     start_idx = max(significant_locs(i) - window_size, 1);
%     end_idx = min(significant_locs(i) + window_size, size(DataFull_labeled, 1));
% 
%     % Label the segment in DataFull_labeled(:, 16)
%     turn_segments(start_idx:end_idx) = 15000;
% end
% 
% % Iterate over the significant peaks
% for i = 1:length(significant_locs)
%     % Find the start and end indices of the segment around the peak
%     start_idx = max(significant_locs(i) - window_size, 1);
%     end_idx = min(significant_locs(i) + window_size, size(DataFull_labeled, 1));
% 
%     % Label the segment in DataFull_labeled(:, 16)
%     turn_segments(start_idx:end_idx) = 15000;
% end
% 
% % Find indices where the absolute value of integrated_filtGyroZ exceeds the threshold
% abs_integrated_filtGyroZ = abs(integrated_filtGyroZ);
% significant_indices = find(abs_integrated_filtGyroZ > threshold);
% 
% % Plot filtGyroZ, integrated_filtGyroZ, and the labeled segments in one plot
% figure;
% plot(filtGyroZ, 'r', 'LineWidth', 1.5);
% hold on;
% plot(integrated_filtGyroZ, 'm--', 'LineWidth', 1.5);
% plot(DataFull_labeled(:, 16), 'k', 'LineWidth', 1.5);
% plot(significant_indices, filtGyroZ(significant_indices), 'go', 'MarkerSize', 10); % Plot significant points
% plot(turn_segments, 'g', 'LineWidth', 1.5);
% hold off;
% xlabel('No. of Packets');
% ylabel('Data / Integrated Data');
% title('Filtered Gyro Y and Z Data with Integrated Values and Turn Segments');
% legend('Filtered Gyro Z', 'Integrated Gyro Z', 'Activity Label', 'Significant Points', 'Turn Segments');




% Define the threshold for identifying significant peaks
threshold = 30000; % Adjust as needed

% Initialize an array to store the labeled segments
turn_segments = zeros(size(DataFull_labeled, 1), 1);

% Find the indices where the absolute value of integrated_filtGyroZ exceeds the threshold
abs_integrated_filtGyroZ = abs(integrated_filtGyroZ);
significant_indices = find(abs_integrated_filtGyroZ > threshold);

% Iterate over the significant indices and label the segments in DataFull_labeled(:, 16)
window_size = 10;
for i = 1:length(significant_indices)
    % Find the start and end indices of the segment around the threshold crossing
    start_idx = max(significant_indices(i) - window_size, 1);
    end_idx = min(significant_indices(i) + window_size, size(DataFull_labeled, 1));
    
    % Label the segment in DataFull_labeled(:, 16)
    turn_segments(start_idx:end_idx) = 15000;
end

% Plot filtGyroZ, integrated_filtGyroZ, and the labeled segments in one plot
figure;
plot(filtGyroZ, 'r', 'LineWidth', 1.5);
hold on;
plot(integrated_filtGyroZ, 'm--', 'LineWidth', 1.5);
plot(DataFull_labeled(:, 16), 'k', 'LineWidth', 1.5);
plot(significant_indices, filtGyroZ(significant_indices), 'go', 'MarkerSize', 10); % Plot significant points
plot(turn_segments, 'g', 'LineWidth', 1.5);
hold off;
xlabel('No. of Packets');
ylabel('Data / Integrated Data');
title('Filtered Gyro Y and Z Data with Integrated Values and Turn Segments');
legend('Filtered Gyro Z', 'Integrated Gyro Z', 'Activity Label', 'Significant Points', 'Turn Segments');


%% Calculate Standard Deviation in Activity Segments and Plot Data

% Define window size for activity segments
window_size = 15;

% Initialize array to store standard deviation values
std_dev_values = zeros(size(DataFull_labeled, 1), 1);

% Calculate standard deviation of filtered gyro Y signal in activity segments
for i = 1:size(activity_segments, 1)
    % Extract segment of filtered gyro Y data
    filtGyroY_activity_segment = filtGyroY(activity_segments(i, 1):activity_segments(i, 2));
    
    % Calculate standard deviation of the segment
    std_dev_segment = std(filtGyroY_activity_segment);
    
    % Store the standard deviation value for each packet in the segment
    std_dev_values(activity_segments(i, 1):activity_segments(i, 2)) = std_dev_segment;
end

% Plot filtered gyro Y data, standard deviation, and activity segment marks
figure;
plot(filtGyroY, 'b', 'LineWidth', 1.5);
hold on;
plot(std_dev_values, 'r', 'LineWidth', 1.5);
plot(DataFull_labeled(:, 16), 'k', 'LineWidth', 1.5);
hold off;
xlabel('No. of Packets');
ylabel('Data / Standard Deviation');
title('Filtered Gyro Y Data with Standard Deviation and Activity Segments');
legend('Filtered Gyro Y', 'Standard Deviation', 'Activity Segments');

%% Dynamic thresholding

% Parameters
window_size = 10; % Window size for smoothing
alpha = 0.2; % Smoothing parameter for exponential smoothing

% Initialize arrays
integrated_filtGyroZ = zeros(size(DataFull_labeled, 1), 1);
gyroY_std_dev = zeros(size(DataFull_labeled, 1), 1);
threshold = zeros(size(DataFull_labeled, 1), 1);

% Integrate filtGyroZ data for activity segments
for i = 1:size(activity_segments, 1)
    % Extract segment of filtGyroZ data
    filtGyroZ_activity_segment = filtGyroZ(activity_segments(i, 1):activity_segments(i, 2));
    
    % Integrate the segment using cumtrapz
    integrated_segment_Z = cumtrapz(filtGyroZ_activity_segment);
    
    % Store the integrated value for each packet
    integrated_filtGyroZ(activity_segments(i, 1):activity_segments(i, 2)) = integrated_segment_Z;
    
    % Calculate standard deviation of gyro Y signal for the segment
    gyroY_std_dev(activity_segments(i, 1):activity_segments(i, 2)) = std(filtGyroY(activity_segments(i, 1):activity_segments(i, 2)));
end

% Calculate threshold using combined thresholding
threshold = gyroY_std_dev + max(integrated_filtGyroZ) * 0.1; % Adjust the factor as needed

% Initialize dynamic threshold
dynamic_threshold = zeros(size(DataFull_labeled, 1), 1);

% Dynamic Threshold Adjustment using exponential smoothing
for i = 2:length(threshold)
    dynamic_threshold(i) = alpha * threshold(i) + (1 - alpha) * dynamic_threshold(i-1);
end

% Plot filtered gyro Y data, standard deviation, and activity segment marks
figure;
plot(filtGyroY, 'b', 'LineWidth', 1.5);
hold on;
plot(gyroY_std_dev, 'g--', 'LineWidth', 1.5);
plot(DataFull_labeled(:, 16), 'k', 'LineWidth', 1.5);
plot(dynamic_threshold, 'r', 'LineWidth', 1.5);
hold off;
xlabel('No. of Packets');
ylabel('Data / Threshold');
title('Filtered Gyro Y Data, Standard Deviation, and Activity Segments');
legend('Filtered Gyro Y', 'Standard Deviation', 'Activity Segments', 'Dynamic Threshold');


%% Stride Segmentation with Activity Segments

% % Define the minimum peak distance
% min_peak_distance = 60; % Adjust as needed
% 
% % Initialize strides
% strides_y = [];
% strides_z = [];
% 
% % Run stride segmentation algorithm only for segments longer than min_peak_distance
% for i = 1:length(activity_segments)
%     % Extract segment of filtGyroY and filtGyroZ data for Activity Segments
%     filtGyroY_activity_segment = filtGyroY(activity_segments(i, 1):activity_segments(i, 2));
%     filtGyroZ_activity_segment = filtGyroZ(activity_segments(i, 1):activity_segments(i, 2));
% 
%     % Check if the segment is longer than the preset MinPeakDistance
%     if length(filtGyroY_activity_segment) >= min_peak_distance
%         % Run stride segmentation algorithm
%         [peak_y, ind_y] = findpeaks(filtGyroY_activity_segment, 'MinPeakHeight', 200, 'MinPeakProminence', 250, 'MinPeakDistance', min_peak_distance);
%         % [peak_z, ind_z] = findpeaks(filtGyroZ_activity_segment, 'MinPeakHeight', 200, 'MinPeakProminence', 250, 'MinPeakDistance', min_peak_distance);
% 
%         % Process peaks within the segment
%         % k = 1;
% 
%         for peakIter = 2:length(peak_y)
%             if ind_y(peakIter) - ind_y(peakIter-1) > 300
%                 continue
%             else
%                 oneStride_y = -filtGyroY_activity_segment(ind_y(peakIter-1):ind_y(peakIter));
%                 oneStride_z = -filtGyroZ_activity_segment(ind_y(peakIter-1):ind_y(peakIter));
% 
%                 % Normalizing the data and the stride times
%                 originalFs = length(oneStride_y);
%                 desiredFs = 100;
%                 [p, q] = rat(desiredFs/originalFs);
%                 oneStride_y = resample(oneStride_y, p, q)';
%                 oneStride_z = resample(oneStride_z, p, q)';
% 
%                 % Storing oneStride into strides
%                 % strides(:, k) = oneStride;
%                 % k = k + 1;
% 
%                 % Append oneStride to strides matrix
%                 strides_y(:, end+1) = oneStride_y;
%                 strides_z(:, end+1) = oneStride_z;
%             end
%         end
%     end
% end

% Plot the strides if needed
% figure;
% plot(strides_y);
% hold on;
% plot(strides_z);
% hold off;

%% Stride Segmentation

% Original tuning values used by Alysson 
% [peak,ind] = findpeaks((-filtGyroY),'MinPeakHeight',200,'MinPeakProminence',250,'MinPeakDistance',60);
% 
% [peak,ind] = findpeaks((filtGyroY),'MinPeakHeight',200,'MinPeakProminence',250,'MinPeakDistance',60); 
% 
% k = 1;
% for peakIter = 2 : length(peak)
%     if ind(peakIter)-ind(peakIter-1) > 300
%         continue
%     else
%         oneStride = -filtGyroY(ind(peakIter-1):ind(peakIter));
% 
% %         Normalizing the data and the stride times
%         originalFs=length(oneStride);
%         desiredFs = 100;
%         [p,q] = rat(desiredFs/originalFs);
%         oneStride = resample(oneStride,p,q)';
%         % plot(oneStride);
% 
% % Storing oneStride into strides
%         strides(:,k) = oneStride;
%         k = k + 1;
%     end
% end
% 
% % plot(strides);


%% Feature Extraction for Activity Segments

% peakStrideIter = 0;
% 
% [m,n] = size(strides_y);
% 
% peakStridesMegnitude = zeros(n, 1); % For storing the magnitude of the peaks
% 
% features = zeros(n,3);
% 
% for peakStrideIter = 1:n 
% %     Original tuning values used by Alysson
%     % [peakStrides,indStrides] = findpeaks(strides_y(:,peakStrideIter),'MinPeakProminence',100,'MinPeakHeight',50,'MinPeakDistance',20);
% 
%     positive_peak_height = 2000; % Threshold for considering a positive peak
%     [peakStrides,indStrides] = findpeaks(strides_y(:,peakStrideIter),'MinPeakProminence',100,'MinPeakHeight',positive_peak_height,'MinPeakDistance',20);
% 
%     % Storing values of peakStrides for checking stride is Running or
%     % Stairs Ascent
%     % Calculate the magnitude as the maximum value of peakStrides
%     % if ~isempty(peakStrides)
%     %     peakStridesMegnitude(peakStrideIter) = max(peakStrides);
%     % end
% 
%     % downstairs 1st and second peak and stair ascent and walking
%     % [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',10,'MinPeakHeight',20,'MinPeakDistance',20);
% 
% %     Original tuning values used by Alysson  
% %     [negPeakStrides,negIndStrides] = findpeaks(-strides(:,peakStrideIter),'MinPeakProminence',125,'MinPeakHeight',20); 
% 
%     % walking 2nd peak negative
%     % 2800 works good with Stairs Descent
%     % 2600 for walking. Also good for Stairs Descent (might have to design
%     % the algorithm to classify as Descent when two positive peaks are
%     % found
% 
%     negative_peak_height = 2600; % Threshold for considering a negative peak
%     [negPeakStrides,negIndStrides] = findpeaks(-strides_y(:,peakStrideIter),'MinPeakProminence',125,'MinPeakHeight',negative_peak_height); 
% 
%     % Restricting the analysis from 20 to 80 percent of the strides
%     % original is set at 125 for both 
%     negPeakStrides = negPeakStrides((negIndStrides>20) & (negIndStrides<80));
%     negIndStrides = negIndStrides((negIndStrides>20) & (negIndStrides<80));
% 
%     if isempty(peakStrides) && isempty(negPeakStrides)
%         % disp("Both peakStrides and negPeakStrides are empty")
%         continue;
%     elseif isempty(peakStrides) || isempty(negPeakStrides)
% %     Checking for empty arrays
%         if isempty(peakStrides)
%             if ~isempty(negPeakStrides)
%                 features(peakStrideIter,3) = negIndStrides(1);
%             end
%         else
%             if length(peakStrides)==1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,4) = max(peakStrides);
% 
%             else length(peakStrides)>1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,2) = indStrides(2);
%                 features(peakStrideIter,4) = max(peakStrides);
%             end
%         end
%     else
%         if length(peakStrides)==1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,3) = negIndStrides(1);
%                 features(peakStrideIter,4) = max(peakStrides);
%             else length(peakStrides)>1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,2) = indStrides(2);
%                 features(peakStrideIter,3) = negIndStrides(1);
%                 features(peakStrideIter,4) = max(peakStrides);
%         end
%     end
% end

%% Features matrix:
% % Column         Content
% %   1      1st Positive Peak Index
% %   2      2nd Positive Peak Index
% %   3      1st Negative Peak Index
% %   4      Max Magnitude of the Positive Peak


%% Feature Extraction

% peakStrideIter = 0;
% 
% [m,n] = size(strides);
% 
% peakStridesMegnitude = zeros(n, 1); % For storing the magnitude of the peaks
% 
% features = zeros(n,3);
% 
% for peakStrideIter = 1:n 
% %     Original tuning values used by Alysson
%     % [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',100,'MinPeakHeight',50,'MinPeakDistance',20);
% 
%     positive_peak_height = 2000; % Threshold for considering a positive peak
%     [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',100,'MinPeakHeight',positive_peak_height,'MinPeakDistance',20);
% 
%     % Storing values of peakStrides for checking stride is Running or
%     % Stairs Ascent
%     % Calculate the magnitude as the maximum value of peakStrides
%     % if ~isempty(peakStrides)
%     %     peakStridesMegnitude(peakStrideIter) = max(peakStrides);
%     % end
% 
%     % downstairs 1st and second peak and stair ascent and walking
%     % [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',10,'MinPeakHeight',20,'MinPeakDistance',20);
% 
% %     Original tuning values used by Alysson  
% %     [negPeakStrides,negIndStrides] = findpeaks(-strides(:,peakStrideIter),'MinPeakProminence',125,'MinPeakHeight',20); 
% 
%     % walking 2nd peak negative
%     % 2800 works good with Stairs Descent
%     % 2600 for walking. Also good for Stairs Descent (might have to design
%     % the algorithm to classify as Descent when two positive peaks are
%     % found
% 
%     negative_peak_height = 2600; % Threshold for considering a negative peak
%     [negPeakStrides,negIndStrides] = findpeaks(-strides(:,peakStrideIter),'MinPeakProminence',125,'MinPeakHeight',negative_peak_height); 
% 
%     % Restricting the analysis from 20 to 80 percent of the strides
%     % original is set at 125 for both 
%     negPeakStrides = negPeakStrides((negIndStrides>20) & (negIndStrides<80));
%     negIndStrides = negIndStrides((negIndStrides>20) & (negIndStrides<80));
% 
%     if isempty(peakStrides) && isempty(negPeakStrides)
%         % disp("Both peakStrides and negPeakStrides are empty")
%         continue;
%     elseif isempty(peakStrides) || isempty(negPeakStrides)
% %     Checking for empty arrays
%         if isempty(peakStrides)
%             if ~isempty(negPeakStrides)
%                 features(peakStrideIter,3) = negIndStrides(1);
%             end
%         else
%             if length(peakStrides)==1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,4) = max(peakStrides);
% 
%             else length(peakStrides)>1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,2) = indStrides(2);
%                 features(peakStrideIter,4) = max(peakStrides);
%             end
%         end
%     else
%         if length(peakStrides)==1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,3) = negIndStrides(1);
%                 features(peakStrideIter,4) = max(peakStrides);
%             else length(peakStrides)>1
%                 features(peakStrideIter,1) = indStrides(1);
%                 features(peakStrideIter,2) = indStrides(2);
%                 features(peakStrideIter,3) = negIndStrides(1);
%                 features(peakStrideIter,4) = max(peakStrides);
%         end
%     end
% end
% 
% % Features matrix:
% % Column         Content
% %   1      1st Positive Peak Index
% %   2      2nd Positive Peak Index
% %   3      1st Negative Peak Index
% %   4      Max Magnitude of the Positive Peak
% 
%% Labelling Data based on Features for training the model
% % No Activity = 0
% % 
% % Walking = 1
% % Stairs Ascent = 2
% % Stairs Descent = 3
% % Running = 4
% % 
% % Other = 5
% 
% % Features matrix update:
% % Column         Content
% %   1      1st Positive Peak Index
% %   2      2nd Positive Peak Index
% %   3      1st Negative Peak Index
% %   4      Max Magnitude of the Positive Peak
% %   5      Activity-based on Magnitude
% 
% runningMagThreshold = 15000;
% 
% for peakStrideIter = 1:n
%     % Check for no activity
%     if (features(peakStrideIter,1) == 0)
%         features(peakStrideIter,5) = 0; % No Activity
%     elseif (((features(peakStrideIter,1) == 0) && (features(peakStrideIter,2) == 0) && (features(peakStrideIter,3) == 0))) % No peaks found
%         features(peakStrideIter,5) = 0; % No Activity
%     elseif (features(peakStrideIter,1) > 0 ) && (features(peakStrideIter,2) == 0) && (features(peakStrideIter,3) > 0)
%         if (features(peakStrideIter,4) > runningMagThreshold)
%             features(peakStrideIter,5) = 4; % Running
%         else
%             features(peakStrideIter,5) = 1; % Walking stride
%         end
%         % features(peakStrideIter,5) = 1; % Walking stride
%     elseif ((features(peakStrideIter,1) > 0) && (features(peakStrideIter,2)) > 0) == 1
%         features(peakStrideIter,5) = 3; % Stairs Descent stride
%     elseif ((features(peakStrideIter,1)> 0) && (features(peakStrideIter,2) == 0) && (features(peakStrideIter,3)== 0))
%         % Stairs Ascent or Running. 
%         % Need to check the value of the peaks to confirm which one is it
%         % Running: Peaks >11,000
%         if (peakStridesMegnitude(peakStrideIter) > runningMagThreshold)
%             features(peakStrideIter,5) = 4; % Running
%         else
%             features(peakStrideIter,5) = 2; % Stairs Ascent stride
%         end
%     else
%         features(peakStrideIter,5) = 5 % Other
%     end
% end
% 
% %% Activity Classification and Re-Classification
% 
% % No Activity = 0
% % Walking = 1
% % Stairs Ascent = 2
% % Stairs Descent = 3
% % Running = 4
% % Other = 5
% 
% % Features matrix update:
% % Column         Content
% %   1      1st Positive Peak Index
% %   2      2nd Positive Peak Index
% %   3      1st Negative Peak Index
% %   4      Max Magnitude of the Positive Peak
% %   5      Activity-based on Magnitude
% %   6      Threshold-based Activity (Re-classification after 3 consecutive activities
% 
% % A activity needs to be classified for at least THREE strides before it can be re-classified
% consecutiveCount = 0;
% classifiedActivity = features(1,5);  % Assuming activity values start from 0
% 
% for peakStrideIter = 1:n
%     % features(peakStrideIter,6) = consecutiveCount;
%     activity = features(peakStrideIter,5);
% 
%     if peakStrideIter ~= 1
%         prevActivity = features(peakStrideIter-1,5);
% 
%         if (prevActivity == activity)
%         consecutiveCount = consecutiveCount + 1;
% 
%             if (consecutiveCount >= 3)
%                 classifiedActivity = prevActivity;
%                 features(peakStrideIter,6) = prevActivity;  % Assign new activity after 3 consecutive occurrences
%                 features(peakStrideIter-1,6) = prevActivity;
%                 features(peakStrideIter-2,6) = prevActivity;
%                 features(peakStrideIter-3,6) = prevActivity;
%             else
%                 features(peakStrideIter,6) = classifiedActivity;
%             end
% 
%         else
%             consecutiveCount = 0; % Resetting counting
%             features(peakStrideIter,6) = classifiedActivity;
%         end
% 
%     end   
% 
% end
% 
% figure;
% plot(features(:,5:end),'DisplayName','features(:,5:end)');
% title('Activity Classification based on 3-stride Threshold');
% xlabel('Stride Number');
% ylabel('Activity Number');
% legend('Activity', 'Threshold-Based Activity');
% % text('Activity Numbers: ', 'FontSize', 12, 'Color', 'r');

%% Subplotting all the activities after the 
% Threshold-based Segmentation of activitiies

% figure;
% 
% plot(strides(:,147:163));

% 
% % Walking = 1
% subplot(2, 2, 1);
% plot(strides(:,46:112);
% title('Walking = 1');
% xlabel('Normalized Time');
% ylabel('Magnitude');
% 
% % Stairs Ascent = 2
% subplot(2, 2, 2);
% plot(strides(:,46:112));
% title('Stairs Ascent = 2');
% xlabel('Normalized Time');
% ylabel('Magnitude');
% 
% % Stairs Descent = 3
% subplot(2, 2, 3);
% plot(strides(:,46:112));
% title('Stairs Descent = 3');
% xlabel('Normalized Time');
% ylabel('Magnitude');
% 
% % Running = 4
% subplot(2, 2, 4);
% plot(strides(:,46:112));
% title('Running = 4');
% xlabel('Normalized Time');
% ylabel('Magnitude');

%% 
% [label,NegLoss,PBScore,Posterior]=predict(Mdl,features);
% 
% visualLabel = zeros(length(label),1);
% 
% for j = 1:length(label)
%     if strcmp(label(j,1),'a')
% %         stairs ascent
%         visualLabel(j,1) = 1;
%     elseif strcmp(label(j,1),'d')
% %         stairs descent
%         visualLabel(j,1) = 2;
%     elseif strcmp(label(j,1),'w')
% %         walking
%         visualLabel(j,1) = 3;
%     elseif strcmp(label(j,1),'s')
% %         standing
%         visualLabel(j,1) = 4;
%     elseif strcmp(label(j,1),'o')
% %         running/skipping
%         visualLabel(j,1) = 5;
%     elseif strcmp(label(j,1),'f')
% %         random act
%         visualLabel(j,1) = 6;
%     else
% %         cannot detect
% %         visualLabel(j) = 0;
%     end
% end
% 
% plot(visualLabel);

%% Further visualization







%% Functions initialized

% Function to merge adjacent segments below the minimum length threshold
function merged_segments = merge_segments(segments, min_length)
    merged_segments = [];
    if ~isempty(segments)
        merged_segments = segments(1, :);
        for i = 2:size(segments, 1)
            if segments(i, 1) - merged_segments(end, 2) <= min_length
                merged_segments(end, 2) = segments(i, 2);
            else
                merged_segments = [merged_segments; segments(i, :)];
            end
        end
    end
end