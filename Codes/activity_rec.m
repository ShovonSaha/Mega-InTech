%% Clearing existing variables
% clearvars
% clearvars -except Mdl
% clear all;
% close all;

%% ARCHIEVED: Changing directory for JULIA and DAVE's data folders:

% JULIA's DATA

% Julia_20231206
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231206\ImpactSense'

% Julia_20231218
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231218\ImpactSense'

% Julia_20240108
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20240108\ImpactSense'

% Dave
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Dave_Data\ImpactSense'

%% ARCHIEVED: Reading matrices

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

%% Changing directory to recent data files

clear all;
close all;

% Changing directory for TURNING data folders:
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Turning_Data\180_slow_normal_fast'
% DataFull = readmatrix('Right_180_slow_normal_fast.csv'); 

cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Turning_Data\180_varying_speed_stop_before_turns'
DataFull = readmatrix('Right_varying_speed_turning.csv');
% DataFull = readmatrix('Left_varying_speed_turning.csv');

% Datafull Field Names and Column No.
% Packet#	 Month	 Day	 Year	 Hour	 Minute	 Second	 MS	 ACC X	 ACC Y	 ACC Z	 GYR X	 GYR Y	 GYR Z
%   1	       2	  3	       4	  5	        6	    7	  8	   9	  10       11      12	  13       14 

%% Filtering loaded data using a low-pass filter

% If the columns were not removed
DataGyroY = DataFull(:,13);
DataGyroZ = DataFull(:, 14);

filtGyroY = lowpass(DataGyroY,2/100); % The (-) sign needs to be removed put infront of the (-)lowpass() to reverse the signal
filtGyroZ = lowpass(DataGyroZ,2/100);


% figure;
% plot(-filtGyroY);
% hold on;
% plot(-filtGyroZ);
% hold off;
% xlabel('No. of Packets');
% ylabel('Gyro');
% title('Filtered Gyro Y & Gyro Z');
% legend('Filtered Gyro Y', 'Filtered Gyro Z');


% filtGyroY = lowpass(DataGyroY,5/100);


%% Extracting & plotting gyroscope and accelerometer data 

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


%% Filtered Gyro Z and Accelerometer Y Data

% figure;
% 
% % Plot filtered Gyro Z data
% plot(packets, FilteredDataGyroZ, 'b');
% hold on;
% 
% % Plot filtered Acceleration Y data
% plot(packets, FilteredDataAccY, 'g');
% hold off;
% 
% xlabel('No. of Packets');
% ylabel('Filtered Data');
% title('Filtered Gyro Z and Accelerometer Y Data');
% legend('Gyro Z', 'Acceleration Y');

%% Activity or No-activity detection

% Define parameters
window_size = 65;
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

% Plot Filtered Gyro Y Data and Activity Label
% figure;
% plot(filtGyroY, 'b', 'LineWidth', 1.5);
% hold on;
% plot(DataFull_labeled(:, 15), 'r', 'LineWidth', 1.5);
% hold off;
% xlabel('No. of Packets');
% ylabel('Data / Activity Label');
% title('Filtered Gyro Y Data and Activity Label');
% legend('Filtered Gyro Y', 'Activity Label');


%% Turn Detection 
% Calculate Standard Deviation of Filtered Gyro Z for Each Activity Segment and Detect Turns

% Initialize the 16th column for storing the standard deviation values
DataFull_labeled(:, 16) = 0;

% Initialize the 17th column for turn detection flags
DataFull_labeled(:, 17) = 0;

% Find the start and end indices of each activity segment
activity_starts = find(diff([0; DataFull_labeled(:, 15) > 0]) == 1);
activity_ends = find(diff([DataFull_labeled(:, 15) > 0; 0]) == -1);

% % Threshold for turn detection (this might need tuning based on your data)
turn_threshold = 1.3 * max(std(abs(filtGyroZ)));  % Example threshold as 10% of the maximum standard deviation observed

% Iterate over each activity segment
for i = 1:length(activity_starts)
    start_idx = activity_starts(i);
    end_idx = activity_ends(i);

    % Calculate the standard deviation of filtGyroZ within the segment
    segment_std_dev = std(abs(filtGyroZ(start_idx:end_idx)));

    % Store the standard deviation in the 16th column for all indices within this segment
    DataFull_labeled(start_idx:end_idx, 16) = segment_std_dev;

    % Check if the segment_std_dev exceeds the threshold
    if segment_std_dev > turn_threshold
        DataFull_labeled(start_idx:end_idx, 17) = 1;  % Mark as a turn
    end
end


%% Plotting Turn Segments with Filtered Gyro Z and Gyro Y Data, Activity Segments and Std Dev of Gyro Z

figure;

% Plot filtered Gyro Z data
plot(filtGyroZ, 'b', 'LineWidth', 1.5);
hold on;

% Plot filtered Gyro Y data
plot(filtGyroY, 'g', 'LineWidth', 1.5);

% Overlay standard deviation values from the 16th column scaled for visibility
std_dev_plot = DataFull_labeled(:, 16) * max(filtGyroZ) / max(DataFull_labeled(:, 16));  % Scale to fit plot, adjust as necessary
plot(std_dev_plot, 'r--', 'LineWidth', 1.5);

% Highlight activity segments visually
activity_indicator = (DataFull_labeled(:, 15) > 0) * max(filtGyroZ);
plot(activity_indicator, 'k', 'LineWidth', 0.5); % Using a thin black line to indicate activity periods

% Plot turn segments
turn_indicator = (DataFull_labeled(:, 17) > 0) * max(filtGyroZ) * 0.8;  % Scaled for visibility
plot(turn_indicator, 'm', 'LineWidth', 2);

hold off;

% Labeling the plot
xlabel('Sample Number');
ylabel('Filtered Gyro Data and Std Dev Values');
title('Filtered Gyro Z and Y Data, Activity Segments, Std Deviation, and Turns');
legend('Filtered Gyro Z', 'Filtered Gyro Y', 'Standard Deviation per Segment', 'Activity Indicator', 'Turns Detected');

%% Extracting filtGyroY Data from Activity Segments that Do Not Have Turns

% Logical index for activity segments
activity_segments = DataFull_labeled(:, 15) > 0;

% Logical index for segments without turns
no_turn_segments = DataFull_labeled(:, 17) == 0;

% Combine conditions: Activity segments that do not have turns
activity_no_turns = activity_segments & no_turn_segments;

% Extract filtGyroY data where there is activity but no turns
filtGyroY_activity_no_turns = filtGyroY(activity_no_turns);

% Optional: Display or analyze the extracted data
% disp('Extracted filtGyroY Data from Activity Segments Without Turns:');
% disp(filtGyroY_activity_no_turns);


%% Stride Segmentation with Advanced Filtering

% Define the minimum peak distance and peak parameters
min_peak_distance = 60; % Adjust as needed
peak_params = struct('MinPeakHeight', 200, 'MinPeakProminence', 250, 'MinPeakDistance', min_peak_distance);

% Percentage of strides to discard at the beginning and end
discard_percentage = 10; % Percentage
min_strides_discard = 2;  % Minimum number of strides to discard
max_strides_discard = 5; % Maximum number of strides to discard

% Initialize strides array
strides = [];

% Identify activity segments without turns
activity_no_turns = DataFull_labeled(:, 15) > 0 & DataFull_labeled(:, 17) == 0;
segments = find(diff([0; activity_no_turns; 0]));
starts = segments(1:2:end);
ends = segments(2:2:end) - 1;

% Process each segment
for i = 1:length(starts)
    start_idx = starts(i);
    end_idx = ends(i);

    % Extract the segment of filtGyroY data
    filtGyroY_activity_segment = filtGyroY(start_idx:end_idx);

    % Detect strides (peaks) within the segment
    if length(filtGyroY_activity_segment) >= min_peak_distance
        [peak_y, ind_y] = findpeaks(filtGyroY_activity_segment, peak_params);

        % Determine the number of strides to discard based on settings
        total_strides = length(peak_y);
        num_discard = max(min_strides_discard, min(max_strides_discard, round(discard_percentage / 100 * total_strides)));

        % Adjust indices to keep
        valid_indices = (num_discard + 1):(total_strides - num_discard);

        % Extract and process valid strides
        for peakIter = 2:length(valid_indices)
            current_index = valid_indices(peakIter);
            previous_index = valid_indices(peakIter - 1);
            oneStride = -filtGyroY_activity_segment(ind_y(previous_index):ind_y(current_index));

            % Normalizing the data and the stride times
            originalFs = length(oneStride);
            desiredFs = 100;
            [p, q] = rat(desiredFs/originalFs);
            oneStride = resample(oneStride, p, q)';

            % Append oneStride to strides matrix
            strides(:, end+1) = oneStride;
        end
    end
end

% Optional: Plot the strides if needed
figure;
plot(strides);
title('Valid Strides Extracted');
xlabel('Sample Points');
ylabel('Stride Signal Amplitude');


%% Enhanced Visualization of Stride Extraction

figure;
hold on;

% Color setup for clarity
color_segment = [0.8, 0.8, 0.8];  % Light grey for the segment data
color_stride = [0, 0.5, 0];  % Dark green for the valid strides

% Process each segment for visualization
for i = 1:length(starts)
    start_idx = starts(i);
    end_idx = ends(i);

    % Extract the segment of filtGyroY data
    filtGyroY_activity_segment = filtGyroY(start_idx:end_idx);
    t_segment = linspace(start_idx, end_idx, length(filtGyroY_activity_segment));

    % Plot the entire segment in a lighter color
    plot(t_segment, -filtGyroY_activity_segment, 'Color', color_segment, 'LineWidth', 2);

    % Detect strides within the segment
    if length(filtGyroY_activity_segment) >= min_peak_distance
        [peak_y, ind_y] = findpeaks(filtGyroY_activity_segment, peak_params);
        total_strides = length(peak_y);
        num_discard = max(min_strides_discard, min(max_strides_discard, round(discard_percentage / 100 * total_strides)));
        valid_indices = (num_discard + 1):(total_strides - num_discard);

        % Plot valid strides
        if ~isempty(valid_indices)
            for peakIter = 2:length(valid_indices)
                current_index = valid_indices(peakIter);
                previous_index = valid_indices(peakIter - 1);

                % Extract stride data
                stride_data = -filtGyroY_activity_segment(ind_y(previous_index):ind_y(current_index));
                t_stride = linspace(start_idx + ind_y(previous_index), start_idx + ind_y(current_index), length(stride_data));

                % Plot stride
                plot(t_stride, stride_data, 'Color', color_stride, 'LineWidth', 2, 'Marker', 'o', 'MarkerFaceColor', color_stride);
            end
        end
    end
end

hold off;
xlabel('Sample Number');
ylabel('filtGyroY Amplitude');
title('Visualization of Filtered GyroY Activity Segments and Extracted Strides');
legend('Segment Data', 'Extracted Strides');


%% Stride Segmentation with Activity Segments Using activity_no_turns
 
% % Define the minimum peak distance
% min_peak_distance = 60; % Adjust as needed
% 
% % Initialize strides
% strides = [];
% 
% % Recalculate activity_no_turns from DataFull_labeled with no turns
% activity_no_turns = DataFull_labeled(:, 15) > 0 & DataFull_labeled(:, 17) == 0;
% 
% % Identify contiguous blocks of true values in activity_no_turns
% segments = find(diff([0; activity_no_turns; 0]));
% starts = segments(1:2:end);
% ends = segments(2:2:end) - 1;
% 
% % Run stride segmentation algorithm only for segments longer than min_peak_distance
% for i = 1:length(starts)
%     start_idx = starts(i);
%     end_idx = ends(i);
% 
%     % Extract segment of filtGyroY data for Activity Segments
%     filtGyroY_activity_segment = filtGyroY(start_idx:end_idx);
% 
%     % Check if the segment is longer than the preset MinPeakDistance
%     if length(filtGyroY_activity_segment) >= min_peak_distance
%         % Run stride segmentation algorithm
%         [peak_y, ind_y] = findpeaks(filtGyroY_activity_segment, 'MinPeakHeight', 200, 'MinPeakProminence', 250, 'MinPeakDistance', min_peak_distance);
% 
%         % Process peaks within the segment
%         for peakIter = 2:length(peak_y)
%             if ind_y(peakIter) - ind_y(peakIter-1) > 300
%                 continue
%             else
%                 oneStride = -filtGyroY_activity_segment(ind_y(peakIter-1):ind_y(peakIter));
% 
%                 % Normalizing the data and the stride times
%                 originalFs = length(oneStride);
%                 desiredFs = 100;
%                 [p, q] = rat(desiredFs/originalFs);
%                 oneStride = resample(oneStride, p, q)';
% 
%                 % Append oneStride to strides matrix
%                 strides(:, end+1) = oneStride;
%             end
%         end
%     end
% end
% 
% % Plot the strides if needed
% figure;
% plot(strides);


%% Feature Extraction for Activity Segments

% peakStrideIter = 0;
% 
% [m,n] = size(strides);
% 
% peakStridesMagnitude = zeros(n, 1); % For storing the magnitude of the peaks
% 
% features = zeros(n,4); % Adjust the feature array size to include all necessary features
% 
% for peakStrideIter = 1:n 
%     % Settings for positive peaks
%     positive_peak_height = 2000; % Threshold for considering a positive peak
%     [peakStrides, indStrides] = findpeaks(strides(:, peakStrideIter), 'MinPeakProminence', 100, 'MinPeakHeight', positive_peak_height, 'MinPeakDistance', 20);
% 
%     % Settings for negative peaks
%     negative_peak_height = 2600; % Threshold for considering a negative peak
%     [negPeakStrides, negIndStrides] = findpeaks(-strides(:, peakStrideIter), 'MinPeakProminence', 125, 'MinPeakHeight', negative_peak_height); 
% 
%     % Restrict analysis to 20 to 80 percent of the strides
%     validNegIndices = (negIndStrides > 0.2 * m) & (negIndStrides < 0.8 * m);
%     negPeakStrides = negPeakStrides(validNegIndices);
%     negIndStrides = negIndStrides(validNegIndices);
% 
%     % Handling different cases based on peaks found
%     if isempty(peakStrides) && isempty(negPeakStrides)
%         % Both peakStrides and negPeakStrides are empty
%         continue;
%     elseif isempty(peakStrides) || isempty(negPeakStrides)
%         if isempty(peakStrides) && ~isempty(negPeakStrides)
%             features(peakStrideIter, 3) = negIndStrides(1);
%         elseif ~isempty(peakStrides)
%             features(peakStrideIter, 1) = indStrides(1); % Handle single positive peak scenario
%             features(peakStrideIter, 4) = max(peakStrides);
%         end
%     else
%         % Assign indices and magnitudes to features based on conditions
%         features(peakStrideIter, 1) = indStrides(1); % First positive peak index
%         if length(peakStrides) > 1
%             features(peakStrideIter, 2) = indStrides(2); % Second positive peak index, if exists
%         end
%         features(peakStrideIter, 3) = negIndStrides(1); % First negative peak index
%         features(peakStrideIter, 4) = max(peakStrides); % Maximum peak magnitude
%     end
% end


%% Features matrix:
% % Column         Content
% %   1      1st Positive Peak Index
% %   2      2nd Positive Peak Index
% %   3      1st Negative Peak Index
% %   4      Max Magnitude of the Positive Peak

 
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