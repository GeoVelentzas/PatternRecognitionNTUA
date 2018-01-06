clear all; close all; clc;
Train = load('train.txt');
Test = load('test.txt');

% Test = Train(1:1450,:); %for validation set
% Train (1:1450,:) = [];   %for validation 
%% **** UNCOMENT THIS PART FOR USING PRINCIPAL COMPONENTS OF DATA *********
% 
% C = cov(Train(:,2:end)); %find covariance matric
% MU = mean(Train(:,2:end))';
% [V,D] = eig(C);
% 
% %Take the principal eigenvectors
% pcs = 150; %choose number of dimensions to project
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

% calculate means and variances for every digit
Digit_means = zeros(10,size(Train,2)-1);
Digit_variances = zeros(10,size(Train,2)-1);
for i = 1:10
    Digit_means(i,:) = mean(training_cell{i});
    Digit_variances(i,:) = var(training_cell{i});
end

%find covariance matrixes for all digits in ascending order
eps = 0.1; %use this constant to avoid singular covariance matrix
S_real = cell(10,1);
S_diag = cell(10,1);

%calculate different covariance matrices for every case I discuss in lab
%report
for i = 1:10
    S_real{i} = cov(training_cell{i})+diag(ones(size(Digit_means(i,:),2),1)*eps);
    S_diag{i} = diag(Digit_variances(i,:))+diag(ones(size(Digit_means(i,:),2),1)*eps);
end

%find covariance matrix for all samples and all digits S
S_all = cov(Train(:,2:end)) + diag(ones(size(Digit_means(i,:),2),1)*eps);


% Compute a priori probabilities
a_priori = zeros(10,1);
for i = 1:10
    a_priori(i) = size(training_cell{i},1)/size(Train,1);
end
figure(1);
bar(0:9,a_priori);
xlim([-1 10])
title('a priori probabilities')
xlabel('Digit')
ylabel('a priori probability')
xlim([-1 10])


%%  As in euclidean classifier but I calculate all the cases at once

d = length(Train(1,2:end)); %just the dimensions
correct_guesses1 = 0;
correct_guesses2 = 0;
correct_guesses3 = 0;
Confusion_matrix1 = zeros(10,10);
Confusion_matrix2 = zeros(10,10);
Confusion_matrix3 = zeros(10,10);
h = waitbar(0,'Please wait for Bayesian Classifiers Training and Testing');
for k = 1: size(Test,1)
    digit_to_find = Test(k,2:end);
    for i = 1:10
        mu = Digit_means(i,:);
        sigma_square = S_diag{i};
        %probabilities calculation as discussed in report
        for j = 1:size(Train,2)-1
            prob1(j) = log(1/(2*pi*sigma_square(j,j))^(1/2))  -1/2*(digit_to_find(j) - mu(j))^2/sigma_square(j,j);
            prob2(j) = -1/2*(digit_to_find(j) - mu(j))^2  +log(1/(2*pi)^(1/2)) ;
        end
        P1(i) = sum(prob1)+log(a_priori(i));
        P2(i) = sum(prob2)+log(a_priori(i));
        P3(i) = log(1/((2*pi)^(d/2)*det(S_real{i})^(1/2)))-1/2*(digit_to_find-mu)*(S_real{i}\(digit_to_find-mu)')+log(a_priori(i));
    end
    
    categorized1 = find(P1 == max(P1))-1;
    categorized2 = find(P2 == max(P2))-1;
    categorized3 = find(P3 == max(P3))-1;
    
    if categorized1 == Test(k,1)
        correct_guesses1 = correct_guesses1+1;
    end
    if categorized2 == Test(k,1)
        correct_guesses2 = correct_guesses2+1;
        
    end
    
    if categorized3 == Test(k,1)
        correct_guesses3 = correct_guesses3+1;
    end
    
    %confusion marices for every case
    Confusion_matrix1(Test(k,1)+1,categorized1+1) = Confusion_matrix1(Test(k,1)+1,categorized1+1)+1;
    Confusion_matrix2(Test(k,1)+1,categorized2+1) = Confusion_matrix2(Test(k,1)+1,categorized2+1)+1;
    Confusion_matrix3(Test(k,1)+1,categorized3+1) = Confusion_matrix3(Test(k,1)+1,categorized3+1)+1;
    waitbar(k/size(Test,1));
end
close(h)

%ratios of correct classification for every case
ratio1 = correct_guesses1/size(Test,1);
ratio2 = correct_guesses2/size(Test,1);
ratio3 = correct_guesses3/size(Test,1);

%precision for every digit classification is the number of true positive
%over the number of all guesses we made
precision1 = zeros(1,10);
precision2 = zeros(1,10);
precision3 = zeros(1,10);


%recall for every digit classification is the number of true positives over
%true positives plus false negatives
recall1 = zeros(1,10);
recall2 = zeros(1,10);
recall3 = zeros(1,10);


for i = 1:10
    precision1(i) = Confusion_matrix1(i,i)/sum(Confusion_matrix1(:,i))*100;
    precision2(i) = Confusion_matrix2(i,i)/sum(Confusion_matrix2(:,i))*100;
    precision3(i) = Confusion_matrix3(i,i)/sum(Confusion_matrix3(:,i))*100;

    recall1(i) = Confusion_matrix1(i,i)/sum(Confusion_matrix1(i,:))*100;
    recall2(i) = Confusion_matrix2(i,i)/sum(Confusion_matrix2(i,:))*100;
    recall3(i) = Confusion_matrix3(i,i)/sum(Confusion_matrix3(i,:))*100;
end

%F1 score is a measure of classification eficiency
F1_score1 = 2*precision1.*recall1./(precision1+recall1);
F1_score2 = 2*precision2.*recall2./(precision2+recall2);
F1_score3 = 2*precision3.*recall3./(precision3+recall3);

%normalize confusion matrix
sums1 = sum(Confusion_matrix1,2)*ones(1,10);
Confusion_matrix_normalized1 = Confusion_matrix1./sums1;
sums2 = sum(Confusion_matrix2,2)*ones(1,10);
Confusion_matrix_normalized2 = Confusion_matrix2./sums2;
sums3 = sum(Confusion_matrix3,2)*ones(1,10);
Confusion_matrix_normalized3 = Confusion_matrix3./sums3;

%%  Visualization for Bayesian 1

figure(2);
imagesc([0 9], [0 9], Confusion_matrix_normalized1);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for Bayesian 1')
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(3);
subplot(3,5,[1,2,3])
bar(0:9 ,precision1);
xlim([-0.5 9.5]);
title('precision for Bayesian 1')
subplot(3,5,[6,7,8])
bar(0:9, recall1);
xlim([-0.5 9.5]);
title('recall for Bayesian 1');
subplot(3,5,[11,12,13])
bar(0:9, F1_score1);
xlim([-0.5 9.5]);
title('F1 score for Bayesian 1');
subplot(3,5,[5,10,15]);
bar(ratio1);
ylim([0 1]);
title([num2str(round(ratio1*10000)/100),'%']);
ylabel('Total Bayesian 1 Classification Score');

h = waitbar(0,'Press Enter for Bayesian with unitary covariance results');
pause;
close(h)

%%  Visualization for Bayesian 2

figure(4);
imagesc([0 9], [0 9], Confusion_matrix_normalized2);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for Bayesian 2')
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(5);
subplot(3,5,[1,2,3])
bar(0:9 ,precision2);
xlim([-0.5 9.5]);
title('precision for Bayesian 2')
subplot(3,5,[6,7,8])
bar(0:9, recall2);
xlim([-0.5 9.5]);
title('recall for Bayesian 2');
subplot(3,5,[11,12,13])
bar(0:9, F1_score2);
xlim([-0.5 9.5]);
title('F1 score for Bayesian 2');
subplot(3,5,[5,10,15]);
bar(ratio2);
ylim([0 1]);
title([num2str(round(ratio2*10000)/100),'%']);
ylabel('Total Bayesian 2 Classification Score');

h = waitbar(0,'Press Enter for Bayesian full covariance matrix');
pause;
close(h)

%%  Visualization for second method

figure(6);
imagesc([0 9], [0 9], Confusion_matrix_normalized3);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for Bayesian 3')
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(7);
subplot(3,5,[1,2,3])
bar(0:9 ,precision3);
xlim([-0.5 9.5]);
title('precision for Bayesian 3')
subplot(3,5,[6,7,8])
bar(0:9, recall3);
xlim([-0.5 9.5]);
title('recall for Bayesian 3');
subplot(3,5,[11,12,13])
bar(0:9, F1_score3);
xlim([-0.5 9.5]);
title('F1 score for Bayesian 3');
subplot(3,5,[5,10,15]);
bar(ratio3);
ylim([0 1]);
title([num2str(round(ratio3*10000)/100),'%']);
ylabel('Total Bayesian 3 Classification Score');




















