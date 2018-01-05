clear all; close all; clc;
load('DATA_NEW_FEAT');

CONDATA = [];

for i = 1:length(DATA)
    for j=1:length(DATA{i})
        CONDATA = [CONDATA ; DATA{i}{j}];
    end
end

[IDX] = kmeans(CONDATA,10);

temp = 1;

for i = 1:length(DATA)
    for j=1:length(DATA{i})
        s = size([DATA{i}{j}],2);
        k = size([DATA{i}{j}],1);
        DATA{i}{j}(:,s+1) = IDX(temp : temp+k-1);
        temp = k+1;
    end
end 

clear CONDATA IDX i j k s temp
save('DATA_WITH_SUBUNITS');

