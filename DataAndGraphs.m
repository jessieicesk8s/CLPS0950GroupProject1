%Switching up the plan a bit: here will take the means from each
%Participant text file and create the bar graph accordingly

read Participant1.mat
read Participant2.mat
etc.

figure;

x = ["Matrix 1" "Matrix 2"];
y1 = [mean_grouptime1, mean_grouptime2]; %comma in between
y2 = [mean_groupaccuracy1; mean_groupaccuracy2]; %semicolon in between

%Bar Graph 1: Reaction Times
subplot(1, 2, 1);
bar(x,y1);
title('Average Reaction Times');
ylabel('Seconds)')

%Bar Graph 2: Accuracy
subplot(1, 2, 2);
bar(x,y2);
title('Average Accuracy');
ylabel('Percent Correct');

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
