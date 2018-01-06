clear all; close all; clc;
Train = load('train.txt');
Test = load('test.txt');

%% **** UNCOMENT THIS PART FOR USING PRINCIPAL COMPONENTS OF DATA *********

% C = cov(Train(:,2:end)); %find covariance matric
% MU = mean(Train(:,2:end))';
% [V,D] = eig(C);
% 
% %Take the principal eigenvectors
% pcs = 64; %choose number of dimensions to project
% E = V(:,end-pcs+1:end);
% 
% % from each observation - image, subtract the mean values and project
% % them to the principal eigenvector space
% Train(:,2:pcs+1) = (Train(:,2:end)-(ones(size(Train,1),1)*MU'))*E;
% Train(:,pcs+2:end) = [];
% Test(:,2:pcs+1) = (Test(:,2:end)-(ones(size(Test,1),1)*MU'))*E;
% Test(:,pcs+2:end) = [];

%%

% organize samples in one matrix for every class, in a training cell
training_cell = cell(10,1);
for i = 1:size(Train,1)
    training_digit = Train(i,1);
    digit_vector = Train(i,2:end);
    training_cell{training_digit+1} = [training_cell{training_digit+1} ; digit_vector];
end
Digit_means = zeros(10,size(Train,2)-1);
Digit_variances = zeros(10,size(Train,2)-1);
for i = 1:10
    Digit_means(i,:) = mean(training_cell{i});
    Digit_variances(i,:) = var(training_cell{i});
end

%%
%find covariance matrixes for all digits in ascending order
eps = 0.01;

S = cell(10,1);
for i = 1:10
    S{i} = cov(training_cell{i})+diag(ones(size(Digit_means(i,:),2),1)*eps);
end

%find covariance matrix for all samples and all digits S
S_all = cov(Train(:,2:end)) + diag(ones(size(Digit_means(i,:),2),1)*eps);

%% ************* EUCLIDEAN and MEHALANOBIS CLASSIFIERS  *******************

correct_guesses = 0;
correct_guesses_meh1 = 0;
correct_guesses_meh2 = 0;
Confusion_matrix = zeros(10,10);
Confusion_matrix_meh1 = zeros(10,10);
Confusion_matrix_meh2 = zeros(10,10);

%for each row of test set, take the numerical value of the digit, take the
%vector of the digit, classificate it to the closest digit due to euclidean
%distance from the means, check if the classification was correct, if it
%was correct add one to the correct guesses, also add one to the
%appropriate position of the confusion matrix
h = waitbar(0,'Please wait for testing stage of 3 different classifiers');
for i = 1 : size(Test,1);
    digit = Test(i,1);
    digit_vector = Test(i,2:end);
    distances = zeros(1,10);
    distances_meh1 = zeros(1,10);
    distances_meh2 = zeros(1,10);
    for j = 1:10
        distances(j)=sqrt(sum((digit_vector-Digit_means(j,:)).^2));
        distances_meh1(j) = sqrt((digit_vector-Digit_means(j,:))*(S{j}\(digit_vector-Digit_means(j,:))'));
        distances_meh2(j) = sqrt((digit_vector-Digit_means(j,:))*(S_all\(digit_vector-Digit_means(j,:))'));
    end
    index = find(distances == min(distances));
    index_meh1 = find(distances_meh1 == min(distances_meh1));
    index_meh2 = find(distances_meh2 == min(distances_meh2));
    digit_guessed = index-1;
    digit_guessed_meh1 = index_meh1 -1;
    digit_guessed_meh2 = index_meh2 -1;
    if digit == digit_guessed
        correct_guesses = correct_guesses+1;
    end
    if digit == digit_guessed_meh1
        correct_guesses_meh1 = correct_guesses_meh1+1;
    end    
    if digit == digit_guessed_meh2
        correct_guesses_meh2 = correct_guesses_meh2+1;
    end    
    Confusion_matrix(digit+1,digit_guessed+1) = Confusion_matrix(digit+1,digit_guessed+1)+1;
    Confusion_matrix_meh1(digit+1,digit_guessed_meh1+1) = Confusion_matrix_meh1(digit+1,digit_guessed_meh1+1)+1;
    Confusion_matrix_meh2(digit+1,digit_guessed_meh2+1) = Confusion_matrix_meh2(digit+1,digit_guessed_meh2+1)+1;
    waitbar(i/size(Test,1))
end
close(h);


%% Calculation of scores

%find the ratio of correct_guesses under total guessed
ratio = correct_guesses/size(Test,1);
ratio_meh1 = correct_guesses_meh1/size(Test,1);
ratio_meh2 = correct_guesses_meh2/size(Test,1);

%precision for every digit classification is the number of true positive
%over the number of all guesses we made
precision = zeros(1,10);
precision_meh1 = zeros(1,10);
precision_meh2 = zeros(1,10);

%recall for every digit classification is the number of true positives over
%true positives plus false negatives
recall = zeros(1,10);
recall_meh1 = zeros(1,10);
recall_meh2 = zeros(1,10);


for i = 1:10
    precision(i) = Confusion_matrix(i,i)/sum(Confusion_matrix(:,i))*100;
    precision_meh1(i) = Confusion_matrix_meh1(i,i)/sum(Confusion_matrix_meh1(:,i))*100;
    precision_meh2(i) = Confusion_matrix_meh2(i,i)/sum(Confusion_matrix_meh2(:,i))*100;
    recall(i) = Confusion_matrix(i,i)/sum(Confusion_matrix(i,:))*100;
    recall_meh1(i) = Confusion_matrix_meh1(i,i)/sum(Confusion_matrix_meh1(i,:))*100;
    recall_meh2(i) = Confusion_matrix_meh2(i,i)/sum(Confusion_matrix_meh2(i,:))*100;
end

%F1 score is a measure of classification eficiency
F1_score = 2*precision.*recall./(precision+recall);
F1_score_meh1 = 2*precision_meh1.*recall_meh1./(precision_meh1+recall_meh1);
F1_score_meh2 = 2*precision_meh2.*recall_meh2./(precision_meh2+recall_meh2);

%normalize confusion matrix
sums = sum(Confusion_matrix,2)*ones(1,10);
Confusion_matrix_normalized = Confusion_matrix./sums;

sums_meh1 = sum(Confusion_matrix_meh1,2)*ones(1,10);
Confusion_matrix_meh1_normalized = Confusion_matrix_meh1./sums_meh1;

sums_meh2 = sum(Confusion_matrix_meh2,2)*ones(1,10);
Confusion_matrix_meh2_normalized = Confusion_matrix_meh2./sums_meh2;

%% Visualization for Euclidean

figure(6);
imagesc([0 9], [0 9], Confusion_matrix_normalized);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for Euclidean Classifier')
colormap(gray)
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(7);
subplot(3,5,[1,2,3])
bar(0:9 ,precision);
xlim([-0.5 9.5]);
title('precision for Euclidean')
subplot(3,5,[6,7,8])
bar(0:9, recall);
xlim([-0.5 9.5]);
title('recall for Euclidean');
subplot(3,5,[11,12,13])
bar(0:9, F1_score);
xlim([-0.5 9.5]);
title('F1 score for Euclidean');
subplot(3,5,[5,10,15]);
bar(ratio);
ylim([0 1]);
title([num2str(round(ratio*10000)/100),'%']);
ylabel('Total Euclidean Classification Score');

h=waitbar(0,'Press Enter for Mehalanobis-1 results');
pause;
close(h);

%% Visualization for mehalanobis with different covariance for every class (Mehalanobis 1)

figure(8);
imagesc([0 9], [0 9], Confusion_matrix_meh1_normalized);
axis square
colorbar;
title('Confusion matrix for Mehalanobis 1 Classifier')
colormap(gray)
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(9);
subplot(3,5,[1,2,3])
bar(0:9 ,precision_meh1);
xlim([-0.5 9.5]);
title('precision for Mehalanobis 1')
subplot(3,5,[6,7,8])
bar(0:9, recall_meh1);
xlim([-0.5 9.5]);
title('recall for Mehalanobis 1');
subplot(3,5,[11,12,13])
bar(0:9, F1_score_meh1);
xlim([-0.5 9.5]);
title('F1 score for Mehalanobis 1');
subplot(3,5,[5,10,15]);
bar(ratio_meh1);
ylim([0 1]);
title([num2str(round(ratio_meh1*10000)/100),'%']);
ylabel('Total Mehalanobis 1 Classification Score')

h=waitbar(0,'Press Enter for Mehalanobis-2 results');
pause;
close(h);

%% Visualization for mehalanobis full covariance matrix

figure(10);
imagesc([0 9], [0 9], Confusion_matrix_meh2_normalized);
axis square
colorbar;
title('Confusion matrix for Mehalanobis 2 Classifier')
colormap(gray)
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(11);
subplot(3,5,[1,2,3])
bar(0:9 ,precision_meh2);
xlim([-0.5 9.5]);
title('precision for Mehalanobis 2')
subplot(3,5,[6,7,8])
bar(0:9, recall_meh2);
xlim([-0.5 9.5]);
title('recall for Mehalanobis 2');
subplot(3,5,[11,12,13])
bar(0:9, F1_score_meh2);
xlim([-0.5 9.5]);
title('F1 score for Mehalanobis 2');
subplot(3,5,[5,10,15]);
bar(ratio_meh2);
ylim([0 1]);
title([num2str(round(ratio_meh2*10000)/100),'%']);
ylabel('Total Mehalanobis 2 Classification Score')







