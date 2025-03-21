%Here, we will extract the data from the 10 Participant files, calculate their means, and visualize them in bar graph form

num_participants = 10; %Defining final number of participants included
mean_reactiontime = zeros(num_participants, 1); %Creating base matrix to store data
mean_reaction_time = zeros(num_participants, 1); %Creating base matrix to store data
overall_accuracy1 = zeros(num_participants, 1); %Creating base matrix to store data
overall_accuracy = zeros(num_participants, 1); %Creating base matrix to store data

for i = 1:num_participants %Defining loop to include all 10 participants
    Participant_ID = sprintf('P%02d', i);
    Filename = sprintf('Participant_%s_Results.mat', Participant_ID);

    if exist(Filename, 'file')
        loadedData = load(Filename); %Load data

        mean_reactiontime(i) = loadedData.mean_reactiontime;
        mean_reaction_time(i) = loadedData.mean_reaction_time;
        overall_accuracy1(i) = loadedData.overall_accuracy1;
        overall_accuracy(i) = loadedData.overall_accuracy;

    else
        warning('File %s not found.', Filename); %If file has not been created, an error message will show to user
    end
end

group_mean_reactiontime = mean(mean_reactiontime); %Calculate group mean from participant data
group_mean_reaction_time = mean(mean_reaction_time); %Calculate group mean from participant data
group_overall_accuracy1 = mean(overall_accuracy1); %Calculate group mean from participant data
group_overall_accuracy = mean(overall_accuracy); %Calculate group mean from participant data

figure; %Create figure window to display bar graphs

%Bar Graph 1: Reaction Times
subplot(1, 2, 1); %Specify number of graphs and placement on figure
bar([group_mean_reactiontime, group_mean_reaction_time]); %Create bar graph 1
set(gca, 'XTickLabel', {'Matrix 1', 'Matrix 2'}); %Define X labels
title('Average Reaction Times'); %Set title of Graph 1
ylabel('Time (seconds)'); %Define y variable
ylim([0, 5]); %Set parameters of y variable on graph

%Bar Graph 2: Accuracy
subplot(1, 2, 2); %Specify number of graphs and placement on figure
bar([group_overall_accuracy1, group_overall_accuracy]); %Create bar graph 2
set(gca, 'XTickLabel', {'Matrix 1', 'Matrix 2'}); %Define X labels
title('Average Accuracy'); %Set title of Graph 2
ylabel('Percent Correct'); %Define y variable
ylim([0, 100]); %Set parameters of y variable on graph

sgtitle('Stimulus Search Final Results'); %Overall figure title