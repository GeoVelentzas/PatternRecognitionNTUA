clear all; close all; clc;
load('DATA_ALL')
DATA1 = DATA;
clear DATA

xsize = 0.72;
ysize = 0.54;

for i = 1: 30
    for j = 1:size(DATA1{i},2)
        A = DATA1{i}{j};
        B(:,1) = (A(:,3)-A(:,1))/xsize;
        B(:,2) = (A(:,4)-A(:,2))/ysize;
        B(:,3) = (A(:,5)-A(:,1))/xsize;
        B(:,4) = (A(:,6)-A(:,2))/ysize;
        DATA{i}{j} = B;
        clear A B
    end
end
clear DATA1 i j xsize ysize
save('DATA_ALL_G')
        