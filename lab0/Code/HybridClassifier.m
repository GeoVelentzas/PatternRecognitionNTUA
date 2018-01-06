clear all; close all; clc;
Train = load('train.txt');
Test = load('test.txt');
d = length(Train(1,2:end));

% Test = Train(1:1450,:); %for validation set
% Train (1:1450,:) = [];   %for training 

%%

% organize samples in one matrix for every class, in a training cell
training_cell = cell(10,1);
for i = 1:size(Train,1)
    training_digit = Train(i,1);
    digit_vector = Train(i,2:end);
    training_cell{training_digit+1} = [training_cell{training_digit+1} ; digit_vector];
end

% calculate means and variances for every digit
Digit_means = zeros(10,size(Train,2)-1);
for i = 1:10
    Digit_means(i,:) = mean(training_cell{i});
end

%find covariance matrixes for all digits in ascending order
eps = 0.1; %use this constant to avoid singular covariance matrix
for i = 1:10
    S{i} = cov(training_cell{i})+diag(ones(d,1)*eps);
end

%find covariance matrix for all samples and all digits S
S_all = cov(Train(:,2:end)) + diag(ones(size(Digit_means(i,:),2),1)*eps);


% Compute a priori probabilities
a_priori = zeros(10,1);
for i = 1:10
    a_priori(i) = size(training_cell{i},1)/size(Train,1);
end


%% ***************** BASIC VARIABLES FOR CLASSIFIERS USAGE **************

G = Train(:,1);
T = Train(:,2:end);
SG = Test(:,1);
ST = Test(:,2:end);
M = Digit_means;
%S{i} covariance matrix for digit i
%%
%load('SvmP3'); %full trained (run SuportVectorMachine.m FIRST!!!!)
%load('SvmP3Valid'); %trained for validation

correct = 0;
h = waitbar(0,'Please Wait for outputs of classifiers');

conf = cell(3);
out = zeros(3,length(SG));
for i = 1:length(SG)
    sample = ST(i,:);
    [out(1,i)  conf{1}(:,i)] = NNRk(7,T,G,sample,a_priori);
    [out(2,i)  conf{2}(:,i)] = Bayes(sample,S,M,a_priori);
    [out(3,i)  conf{3}(:,i)] = SVMout( sample,Svm );
    waitbar(i/length(SG));
    
end
close(h);

%%
% NEWTRAIN = zeros(length(SG),30);
% for i = 1:length(SG)
%     NEWTRAIN(i,:) = [conf{1}(:,i)' conf{2}(:,i)' conf{3}(:,i)'];
%     NEWTRAINGROUP = SG;
% end
% save('NEWTRAIN','NEWTRAIN');
% save('NEWTRAINGROUP','NEWTRAINGROUP');


%%
% %make confusion matrix and f1_scores
% confusion_NNR7 = zeros(10,10);
% confusion_Bayes = zeros(10,10);
% confusion_SVM = zeros(10,10);
% for i = 1:length(SG)
%     confusion_NNR7(SG(i)+1,out(1,i)+1)= confusion_NNR7(SG(i)+1,out(1,i)+1)+1;
%     confusion_Bayes(SG(i)+1,out(2,i)+1)= confusion_Bayes(SG(i)+1,out(2,i)+1)+1;
%     confusion_SVM(SG(i)+1,out(3,i)+1)= confusion_SVM(SG(i)+1,out(3,i)+1)+1;
% end

%% Voting method
confus = zeros(10,10);
for i = 1:length(SG)
    %if all have different decision take the one with the best a_priori
    if (out(1,i)~=out(2,i))&&(out(3,i)~=out(2,i))&&(out(1,i)~=out(3,i))
%         rely = [a_priori(out(1,i)+1) a_priori(out(2,i)+1) a_priori(out(3,i)+1)];
%         [crap, index] = min(rely);
%         vote = out(index,i);
        vote = out(1,i);
    else
        vote = mode(out(:,i));
    end
    confus(SG(i)+1,vote+1)=confus(SG(i)+1,vote+1)+1;
end

for i = 1:10
    precision(i) = confus(i,i)/sum(confus(:,i))*100;
    recall(i) = confus(i,i)/sum(confus(i,:))*100;
end
F1_score = 2*precision.*recall./(precision+recall);
sums1 = sum(confus,2)*ones(1,10);
Confusion_normalized = confus./sums1;    
ratio = sum(diag(confus))/sum(confus(:));

figure(1);
bar(0:9 ,precision);
xlim([-0.5 9.5]);
ylim([90 100])
title('precision for Voting Hybrid')

figure(2)
bar(0:9, recall);
xlim([-0.5 9.5]);
ylim([90 100])
title('recall for Voting Hybrid');

figure(3)
bar(0:9, F1_score);
xlim([-0.5 9.5]);
ylim([90 100])
title('F1 score for Voting Hybrid');

disp(ratio);

%% If you want to take confidences from validation outcomes
% clear conf
% load('confusion_NNR7');
% load('confusion_Bayes');
% load('confusion_SVM');
% 
% sums1 = ones(10,1)*sum(confusion_NNR7,1);
% sums2 = ones(10,1)*sum(confusion_Bayes,1);
% sums3 = ones(10,1)*sum(confusion_SVM,1);
% conf_nnr = confusion_NNR7./sums1;
% conf_bayes = confusion_Bayes./sums2;
% conf_svm = confusion_SVM./sums3;
% conf = cell(3);
% for i = 1:length(SG)
%     conf{1}(:,i) = conf_nnr(:,out(1,i)+1);
%     conf{2}(:,i) = conf_bayes(:,out(2,i)+1);
%     conf{3}(:,i) = conf_svm(:,out(3,i)+1);
% end


%% Different Functions as max, min , mean , product

%first I will calculate them
for i = 1:length(SG)
    [crap ,max1] = max(conf{1}(:,i));
    [crap, max2] = max(conf{2}(:,i));
    [crap, max3] = max(conf{3}(:,i));
    call_max(i) = max(max(max1,max2),max3)-1;
    call_min(i) = min(min(max1,max2),max3)-1;
    
    [crap, call_mean(i)] = max(mean([conf{1}(:,i) conf{2}(:,i) conf{3}(:,i)],2));
    call_mean(i) = call_mean(i)-1;
    
    [crap, call_prod(i)] = max([conf{1}(:,i)].*[conf{2}(:,i)].*[conf{3}(:,i)]);
    call_prod(i) = call_prod(i)-1;
end

% and find ratios
disp('max')
ratio_max = length(find(call_max == SG'))/length(SG)
disp('min')
ratio_min = length(find(call_min == SG'))/length(SG)
disp('mean')
ratio_mean = length(find(call_mean == SG'))/length(SG)
disp('product')
ratio_prod = length(find(call_prod == SG'))/length(SG)

%% Depending on the difference between first and second best confidence

for i =1:length(SG)
    s = sort(conf{1}(:,i));
    c1 = s(end)- s(end-1);
    s = sort(conf{2}(:,i));
    c2 = s(end)- s(end-1);
    s = sort(conf{1}(:,i));
    c3 = s(end)- s(end-1);
    [crap, best] = max([c1 c2 c3]);
    call_best(i) = out(best,i);
end
disp('based on difference')
ratio_best = length(find(call_best == SG'))/length(SG)

%%
% for i = 1:length(SG)
%     NEWTEST(i,:) = [conf{1}(:,i)' conf{2}(:,i)' conf{3}(:,i)'];
%     NEWTESTGROUP = SG;
% end
% 
% save('NEWTEST', 'NEWTEST');
% save('NEWTESTGROUP','NEWTESTGROUP');
%%


























