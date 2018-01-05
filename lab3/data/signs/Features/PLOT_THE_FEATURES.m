clear all; %close all; clc;
load('DATA_2nd_signer_G');

for i =1:16
figure(i+14);hold on;box on;

for j = 1:5
A = DATA{i}{j};
h1 = plot(A(:,3),A(:,4),'r');
h2 = plot(A(:,1),A(:,2),'r');

xlim([-1000 1000]);
ylim([-1000 1000])

rotate(h1,[0 0 1],180);
rotate(h2,[0 0 1],180);

rotate(h1,[0 1 0],180);
rotate(h2,[0 1 0],180);

clear A h1 h2 h3
end
end