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
set(gca, 'XTickLabel', {'Matrix 1', 'Matrix 2'});
title('Average Reaction Times');
ylabel('Time (seconds)');
ylim([0, 10]);

%Bar Graph 2: Accuracy
subplot(1, 2, 2);
bar([group_overall_accuracy1, group_overall_accuracy]);
set(gca, 'XTickLabel', {'Matrix 1', 'Matrix 2'});
title('Average Accuracy');
ylabel('Percent Correct');
ylim([0, 100]);

sgtitle('Stimulus Search Final Results');