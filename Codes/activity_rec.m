%% Clearing existing variables
% clearvars
% clearvars -except Mdl
clear all;
close all;

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


%% Changing directory to the folder where the data file exists

% JULIA's DATA

% Julia_20231206
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231206\ImpactSense'

% Julia_20231218
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20231218\ImpactSense'

% Julia_20240108
cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Julia_Data\Julia_20240108\ImpactSense'

% Dave
% cd 'C:\Users\shovo\OneDrive - University of Waterloo\Documents\NRE Lab\Mega InTech\Dave_Data\ImpactSense'


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


%% Processing JULIA and DAVE's DATA: Reading csv file and extracting GyroY data

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
% filtData = -lowpass(DataGyroY,2/100); 


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



DataGyroY = DataFull(:,13);

%% Filtering loaded data using a low-pass filter
% New filter parameter after discussion with James and Ranjani
% % filtData = lowpass(DataGyroX,0.502654824); % New filter. Old one works
% better

filtData = -lowpass(DataGyroY,2/100); % The (-) sign needs to be removed put infront of the (-)lowpass() to reverse the signal

% figure;
% plot(-filtData);

% filtData = lowpass(DataGyroY,5/100);

% Old filter parameter
% filtData = lowpass(DataGyroX,8/100);
% [filtData,d]= lowpass(DataGyroX,8/100,100);



%% Stride Segmentation
% Original tuning values used by Alysson 
% [peak,ind] = findpeaks((-filtData),'MinPeakHeight',200,'MinPeakProminence',250,'MinPeakDistance',60);
 
[peak,ind] = findpeaks((filtData),'MinPeakHeight',200,'MinPeakProminence',250,'MinPeakDistance',60); 

k = 1;
for peakIter = 2 : length(peak)
    if ind(peakIter)-ind(peakIter-1) > 300
        continue
    else
        oneStride = -filtData(ind(peakIter-1):ind(peakIter));

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

% Features matrix:
% Column         Content
%   1      1st Positive Peak Index
%   2      2nd Positive Peak Index
%   3      1st Negative Peak Index
%   4      Max Magnitude of the Positive Peak

%% Labelling Data based on Features for training the model
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

runningMagThreshold = 15000;

for peakStrideIter = 1:n
    % Check for no activity
    if (features(peakStrideIter,1) == 0)
        features(peakStrideIter,5) = 0; % No Activity
    elseif (((features(peakStrideIter,1) == 0) && (features(peakStrideIter,2) == 0) && (features(peakStrideIter,3) == 0))) % No peaks found
        features(peakStrideIter,5) = 0; % No Activity
    elseif (features(peakStrideIter,1) > 0 ) && (features(peakStrideIter,2) == 0) && (features(peakStrideIter,3) > 0)
        if (features(peakStrideIter,4) > runningMagThreshold)
            features(peakStrideIter,5) = 4; % Running
        else
            features(peakStrideIter,5) = 1; % Walking stride
        end
        % features(peakStrideIter,5) = 1; % Walking stride
    elseif ((features(peakStrideIter,1) > 0) && (features(peakStrideIter,2)) > 0) == 1
        features(peakStrideIter,5) = 3; % Stairs Descent stride
    elseif ((features(peakStrideIter,1)> 0) && (features(peakStrideIter,2) == 0) && (features(peakStrideIter,3)== 0))
        % Stairs Ascent or Running. 
        % Need to check the value of the peaks to confirm which one is it
        % Running: Peaks >11,000
        if (peakStridesMegnitude(peakStrideIter) > runningMagThreshold)
            features(peakStrideIter,5) = 4; % Running
        else
            features(peakStrideIter,5) = 2; % Stairs Ascent stride
        end
    else
        features(peakStrideIter,5) = 5 % Other
    end
end

%% Activity Classification and Re-Classification

% No Activity = 0
% Walking = 1
% Stairs Ascent = 2
% Stairs Descent = 3
% Running = 4
% Other = 5

% Features matrix update:
% Column         Content
%   1      1st Positive Peak Index
%   2      2nd Positive Peak Index
%   3      1st Negative Peak Index
%   4      Max Magnitude of the Positive Peak
%   5      Activity-based on Magnitude
%   6      Threshold-based Activity (Re-classification after 3 consecutive activities

% A activity needs to be classified for at least THREE strides before it can be re-classified
consecutiveCount = 0;
classifiedActivity = features(1,5);  % Assuming activity values start from 0

for peakStrideIter = 1:n
    % features(peakStrideIter,6) = consecutiveCount;
    activity = features(peakStrideIter,5);
    
    if peakStrideIter ~= 1
        prevActivity = features(peakStrideIter-1,5);
        
        if (prevActivity == activity)
        consecutiveCount = consecutiveCount + 1;
            
            if (consecutiveCount >= 3)
                classifiedActivity = prevActivity;
                features(peakStrideIter,6) = prevActivity;  % Assign new activity after 3 consecutive occurrences
                features(peakStrideIter-1,6) = prevActivity;
                features(peakStrideIter-2,6) = prevActivity;
                features(peakStrideIter-3,6) = prevActivity;
            else
                features(peakStrideIter,6) = classifiedActivity;
            end
        
        else
            consecutiveCount = 0; % Resetting counting
            features(peakStrideIter,6) = classifiedActivity;
        end
    
    end   

end

figure;
plot(features(:,5:end),'DisplayName','features(:,5:end)');
title('Activity Classification based on 3-stride Threshold');
xlabel('Stride Number');
ylabel('Activity Number');
legend('Activity', 'Threshold-Based Activity');
% text('Activity Numbers: ', 'FontSize', 12, 'Color', 'r');

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