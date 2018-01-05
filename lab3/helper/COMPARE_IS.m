clear all; close all;
addpath(genpath('../'));
load('IS_given');
ISg = IS;
clear IS;
load('IS_computed');
ISc = IS;

for i = 30 :-1 :1
    g = zeros(ISg{i}{2}(end)+10,1);
    c = zeros(ISg{i}{2}(end)+10,1);
    for j = 1:length(ISg{i}{1})
        g(ISg{i}{1}(j):ISg{i}{2}(j)) = 1;
    end
    
    figure(i); hold on; box on;
    plot(g)
    
    for j = 1:min(length(ISc{i}{1}),length(ISc{i}{2}))
        c(ISc{i}{1}(j):ISc{i}{2}(j)) = 1;
    end
    figure(i);
    plot(c,'r')
    %legend('given','computed');
    ylim([-0.1 1.1]);
    
end