clear all; close all; clc
load('DATA_ALL_G');

for i =1:length(DATA);
    for j = 1:length(DATA{i})
         DATA{i}{j}(:,5)  = DATA{i}{j}(:,1)-DATA{i}{j}(:,3); %xd-xa
         DATA{i}{j}(:,6)  = DATA{i}{j}(:,2)-DATA{i}{j}(:,4); %yd-ya
         DATA{i}{j}(:,7)  = [0; diff(DATA{i}{j}(:,1))]; %Vxd
         DATA{i}{j}(:,8)  = [0; diff(DATA{i}{j}(:,2))]; %Vyd
         DATA{i}{j}(:,9)  = [0; diff(DATA{i}{j}(:,3))]; %Vxa
         DATA{i}{j}(:,10) = [0; diff(DATA{i}{j}(:,4))]; %Vya
%         DATA{i}{j}(:,11) = [0; diff(DATA{i}{j}(:,5))]; %vxd-vxa
%         DATA{i}{j}(:,12) = [0; diff(DATA{i}{j}(:,6))]; %vyd-vya
%         DATA{i}{j}(:,11) = [0; diff(DATA{i}{j}(:,7))]; %axd
%         DATA{i}{j}(:,12) = [0; diff(DATA{i}{j}(:,8))]; %ayd
%         DATA{i}{j}(:,13) = [0; diff(DATA{i}{j}(:,9))]; %axa
%         DATA{i}{j}(:,14) = [0; diff(DATA{i}{j}(:,10))]; %aya
%         DATA{i}{j}(:,11) = ((DATA{i}{j}(:,7)).^2 +((DATA{i}{j}(:,8)).^2)).^(1/2);  %vd mag
%         DATA{i}{j}(:,12) = ((DATA{i}{j}(:,9)).^2 +((DATA{i}{j}(:,10)).^2)).^(1/2);  %vd ma
    end
end
clear i j
save('DATA_NEW_FEAT');