clear all; close all
load('DATA_NEW_FEAT')
load('SUBUNITS')

for i = 1:8 %length(DATA)
    for j =1:2 %length(DATA{i})
        figure; hold on; box on;
        plot(DATA{i}{j}(:,1));
        for x = 1:length(DATA{i}{j}(:,1))
        text(x,DATA{i}{j}(x,1),['',num2str(SUBUNITS{i}{j}(x)),'']);
        end
    end
end