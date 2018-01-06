clear all; close all; clc;

load('NEWTRAIN');       %confidences from validation
load('NEWTRAINGROUP')  %class for each confidence set from validation group
load('NEWTEST')        %confidences form test set
load('NEWTESTGROUP')   %class for each test sample

%%
% for i = 1:length(NEWTESTGROUP)
%     sample = NEWTEST(i,:);
%     digit(i) = NNR1(NEWTRAIN,NEWTRAINGROUP,sample);
% end
% disp('with nnr1')
% sum(digit'==NEWTESTGROUP)/length(NEWTESTGROUP)
% 
% class = classify(NEWTEST,NEWTRAIN,NEWTRAINGROUP,'diaglinear');
% disp('with lda')
% sum(class==NEWTESTGROUP)/length(NEWTESTGROUP)
% 
% T = NEWTRAINGROUP;                 %Digits of training set
% Training = NEWTRAIN;              %Training examples
% h = waitbar(0,'SVM training');
% for i = 1:10                    %for every digit construct the proper
%     S{i} = (T == i-1);          %Group vector with ones and zeros
%     Svm{i} = svmtrain(Training,S{i},'method','LS');
%     waitbar(i/10);
% end                             
% close(h);
% 
% S = NEWTESTGROUP;
% Testing = NEWTEST;
% for i = 1:10
%     [out(:,i), s(:,i)] = svmclassifyandscore(Svm{i},Testing);
% end
% 
% Confusion = zeros(10,10);
% for i = 1:length(S)
%     [crap, categorized(i)] = min(s(i,:));
%     categorized(i) = categorized(i)-1;
% end
% disp('with svm')
% sum(categorized==NEWTESTGROUP')/length(NEWTESTGROUP)

%% linear regression

A = [ones(size(NEWTRAIN,1),1)   NEWTRAIN];
b = NEWTRAINGROUP;
w = pinv(A)*b;

GUESS = [ones(size(NEWTEST,1),1) NEWTEST]*w;

for i = 1:length(GUESS)
    if GUESS(i)<0
        GUESS(i)=0;
    end
    if GUESS(i)>9;
        GUESS(i)=9;
    end
end

GUESS = round(GUESS);
disp('with linear regression')
sum(GUESS==NEWTESTGROUP)/length(NEWTESTGROUP)











