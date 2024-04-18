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

%% Reading only GyroY Data. [Updated to GyroY from GyroX after checking the orientation of the new set of sensors]

% % 20 Strides
% DataGyroY = DataFull(1804:4273,13);

% Left (without tapped)
% DataGyroY = DataFull(2974:5328,13);

% Datafull Field Names and Column No.
% Packet#	 Month	 Day	 Year	 Hour	 Minute	 Second	 MS	 ACC X	 ACC Y	 ACC Z	 GYR X	 GYR Y	 GYR Z
%   1	       2	  3	       4	  5	        6	    7	  8	   9	  10       11      12	  13       14 

% Other Gyros
% DataGyroX = DataFull(:,12);
% DataGyroY = DataFull(:,13);   % Right signal for detecting activities
% DataGyroZ = DataFull(:,14);



%% Filtering the signal

% Better filter (currently in-use)
filtGyroY = lowpass(DataGyroY,2/100);

% Old filter parameter
% filtGyroY = lowpass(DataGyroY,8/100);
% [filtGyroY,d]= lowpass(DataGyroY,8/100,100);


%% Stride Segmentation 

% Original tuning values used by Alysson 
[peak,ind] = findpeaks((-filtGyroY),'MinPeakHeight',200,'MinPeakProminence',250,'MinPeakDistance',60);

[peak,ind] = findpeaks((filtGyroY),'MinPeakHeight',200,'MinPeakProminence',250,'MinPeakDistance',60); 

k = 1;
for peakIter = 2 : length(peak)
    if ind(peakIter)-ind(peakIter-1) > 300
        continue
    else
        oneStride = -filtGyroY(ind(peakIter-1):ind(peakIter));

%         Normalizing the data and the stride times
        originalFs=length(oneStride);
        desiredFs = 100;
        [p,q] = rat(desiredFs/originalFs);
        oneStride = resample(oneStride,p,q)';
        % plot(oneStride);

% Storing oneStride into strides
        strides(:,k) = oneStride;
        k = k + 1;
    end
end

% plot(strides);


%% Feature Extraction

peakStrideIter = 0;

[m,n] = size(strides);

peakStridesMegnitude = zeros(n, 1); % For storing the magnitude of the peaks

features = zeros(n,3);

for peakStrideIter = 1:n 
%     Original tuning values used by Alysson
    % [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',100,'MinPeakHeight',50,'MinPeakDistance',20);

    positive_peak_height = 2000; % Threshold for considering a positive peak
    [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',100,'MinPeakHeight',positive_peak_height,'MinPeakDistance',20);

    % Storing values of peakStrides for checking stride is Running or
    % Stairs Ascent
    % Calculate the magnitude as the maximum value of peakStrides
    % if ~isempty(peakStrides)
    %     peakStridesMegnitude(peakStrideIter) = max(peakStrides);
    % end

    % downstairs 1st and second peak and stair ascent and walking
    % [peakStrides,indStrides] = findpeaks(strides(:,peakStrideIter),'MinPeakProminence',10,'MinPeakHeight',20,'MinPeakDistance',20);

%     Original tuning values used by Alysson  
%     [negPeakStrides,negIndStrides] = findpeaks(-strides(:,peakStrideIter),'MinPeakProminence',125,'MinPeakHeight',20); 

    % walking 2nd peak negative
    % 2800 works good with Stairs Descent
    % 2600 for walking. Also good for Stairs Descent (might have to design
    % the algorithm to classify as Descent when two positive peaks are
    % found

    negative_peak_height = 2600; % Threshold for considering a negative peak
    [negPeakStrides,negIndStrides] = findpeaks(-strides(:,peakStrideIter),'MinPeakProminence',125,'MinPeakHeight',negative_peak_height); 

    % Restricting the analysis from 20 to 80 percent of the strides
    % original is set at 125 for both 
    negPeakStrides = negPeakStrides((negIndStrides>20) & (negIndStrides<80));
    negIndStrides = negIndStrides((negIndStrides>20) & (negIndStrides<80));

    if isempty(peakStrides) && isempty(negPeakStrides)
        % disp("Both peakStrides and negPeakStrides are empty")
        continue;
    elseif isempty(peakStrides) || isempty(negPeakStrides)
%     Checking for empty arrays
        if isempty(peakStrides)
            if ~isempty(negPeakStrides)
                features(peakStrideIter,3) = negIndStrides(1);
            end
        else
            if length(peakStrides)==1
                features(peakStrideIter,1) = indStrides(1);
                features(peakStrideIter,4) = max(peakStrides);

            else length(peakStrides)>1
                features(peakStrideIter,1) = indStrides(1);
                features(peakStrideIter,2) = indStrides(2);
                features(peakStrideIter,4) = max(peakStrides);
            end
        end
    else
        if length(peakStrides)==1
                features(peakStrideIter,1) = indStrides(1);
                features(peakStrideIter,3) = negIndStrides(1);
                features(peakStrideIter,4) = max(peakStrides);
            else length(peakStrides)>1
                features(peakStrideIter,1) = indStrides(1);
                features(peakStrideIter,2) = indStrides(2);
                features(peakStrideIter,3) = negIndStrides(1);
                features(peakStrideIter,4) = max(peakStrides);
        end
    end
end


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