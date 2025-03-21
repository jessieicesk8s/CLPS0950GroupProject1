%Here, the plan is to extract the data from the 10 Participant files,
%calculate their means, and visualize them in bar graph form

num_participants = 10;
mean_reactiontime = zeros(num_participants, 1);
mean_reaction_time = zeros(num_participants, 1);
overall_accuracy1 = zeros(num_participants, 1);
overall_accuracy = zeros(num_participants, 1);

for i = 1:num_participants
    Participant_ID = sprintf('P%02d', i);
    Filename = sprintf('Participant_%s_Results.mat', Participant_ID);

    if exist(Filename, 'file')
        loadedData = load(Filename);

        mean_reactiontime(i) = loadedData.mean_reactiontime;
        mean_reaction_time(i) = loadedData.mean_reaction_time;
        overall_accuracy1(i) = loadedData.overall_accuracy1;
        overall_accuracy(i) = loadedData.overall_accuracy;

    else
        warning('File %s not found.', Filename);
    end
end

group_mean_reactiontime = mean(mean_reactiontime);
group_mean_reaction_time = mean(mean_reaction_time);
group_overall_accuracy1 = mean(overall_accuracy1);
group_overall_accuracy = mean(overall_accuracy);

figure;

%Bar Graph 1: Reaction Times
subplot(1, 2, 1);
bar([group_mean_reactiontime, group_mean_reaction_time]);
title('Average Reaction Times');
xlabel('Matrix #');
ylabel('Time (seconds)');
ylim([0, 10]);

%Bar Graph 2: Accuracy
subplot(1, 2, 2);
bar([group_overall_accuracy1, group_overall_accuracy]);
title('Average Accuracy');
xlabel('Matrix #');
ylabel('Percent Correct');
ylim([0, 100]);

sgtitle('Stimulus Search Final Results');












%Pre-made code
%group_times1 = ([ET1_Part1, ET1_Part2, ET1_Part3, ET1_Part4, ET1_Part5, ET1_Part6, ET1_Part7, ET1_Part8, ET1_Part9, ET1_Part10]);
%mean_grouptime1 = mean(group_times1);
%group_times2 = ([ET2_Part1, ET2_Part2, ET2_Part3, ET2_Part4, ET2_Part5, ET2_Part6, ET2_Part7, ET2_Part8, ET2_Part9, ET2_Part10]);
%mean_grouptime2 = mean(group_times2);

%group_accuracy1 = ([IC1_Part1, IC1_Part2, IC1_Part3, IC1_Part4, IC1_Part5, IC1_Part6, IC1_Part7, IC1_Part8, IC1_Part9, IC1_Part10]);
%mean_groupaccuracy1 = mean(group_accuracy1);
%group_accuracy2 = ([IC2_Part1, IC2_Part2, IC2_Part3, IC2_Part4, IC2_Part5, IC2_Part6, IC2_Part7, IC2_Part8, IC2_Part9, IC2_Part10]);
%mean_groupaccuracy2 = mean(group_accuracy2);
