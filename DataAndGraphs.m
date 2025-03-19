%Creating a new workspace here for us to work on the last part of our code,
%just so we don't accidentally jeopardize our previous work...

%Here, we will create the code that will store data for each participant,
%and be used to create the final graph...
%We can copy and paste whatever we make here to the
%CombinedMatrixTasks_Test



%Insert code here for storing data for each participant
%
%
%

%After storing and naming data for each participant, we will calculate the
%GROUP means below

%To make sense of how I named the variables: "ET1_Part1" stands for: elapsed time of Matrix # for Participant #...
group_times1 = ([ET1_Part1, ET1_Part2, ET1_Part3, ET1_Part4, ET1_Part5, ET1_Part6, ET1_Part7, ET1_Part8, ET1_Part9, ET1_Part10]);
mean_grouptime1 = mean(group_times1);

group_times2 = ([ET2_Part1, ET2_Part2, ET2_Part3, ET2_Part4, ET2_Part5, ET2_Part6, ET2_Part7, ET2_Part8, ET2_Part9, ET2_Part10]);
mean_grouptime2 = mean(group_times2);

group_accuracy1 = ([IC1_Part1, IC1_Part2, IC1_Part3, IC1_Part4, IC1_Part5, IC1_Part6, IC1_Part7, IC1_Part8, IC1_Part9, IC1_Part10]);
mean_groupaccuracy1 = mean(group_accuracy1);

group_accuracy2 = ([IC2_Part1, IC2_Part2, IC2_Part3, IC2_Part4, IC2_Part5, IC2_Part6, IC2_Part7, IC2_Part8, IC2_Part9, IC2_Part10]);
mean_groupaccuracy2 = mean(group_accuracy2);

%Creating the bar graphs
%If we can, Matrix 1 will be red 'r'; Matrix 2 will be blue 'b'?
%Graph 1: Group Reaction Times (M1 vs. M2)
%Graph 2: Group Accuracies (M1 vs. M2)

x = ["Matrix 1" "Matrix 2"];
y1 = [mean_grouptime1, mean_grouptime2]; %comma in between
y2 = [mean_groupaccuracy1; mean_groupaccuracy2]; %semicolon in between

b1 = bar(x,y1);
b2 = bar(x,y2);
%Add titles for both