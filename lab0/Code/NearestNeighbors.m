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
% pcs = 64;
% E = V(:,end-pcs+1:end);
% 
% % from each observation - image, subtract the mean values and project
% % them to the principal eigenvector space
% Train(:,2:pcs+1) = (Train(:,2:end)-(ones(size(Train,1),1)*MU'))*E;
% Train(:,pcs+2:end) = [];
% Test(:,2:pcs+1) = (Test(:,2:end)-(ones(size(Test,1),1)*MU'))*E;
% Test(:,pcs+2:end) = [];


%% *********** NNR-1  ********************
number_of_train = 1000; 
number_of_test = 100; %comment next to lines if you want these data sets

number_of_train = size(Train,1);
number_of_test = size(Test,1);

KNN_Train = Train(1:number_of_train,:);
correct1 = 0;
confusion1 = zeros(10,10);

%for every test sample if it was correctly categorized, increase variable
%correct by one
h = waitbar(0,'Please wait for NNR-1');
for i = 1:number_of_test
    digit = Test(i,1);
    digit_vector = Test(i,2:end);
    %calculate the distances (squares root not needed) with matrix
    %multiplications
    D1 = sum((KNN_Train(:,2:end)-ones(number_of_train,1)*digit_vector).^2,2);
    index = find(D1==min(D1));
    categorized1 = KNN_Train(index,1); 
    if categorized1 == digit
        correct1 = correct1+1;
    end
    %add one to the element of the confusion matrix
    confusion1(digit+1,categorized1+1) = confusion1(digit+1,categorized1+1)+1;
    waitbar(i/number_of_test);
end
close(h);
%the ratio of correct classification
ratio1 = correct1/number_of_test;

%calculate precision and recall for every digit
for i = 1:10
    precision1(i) = confusion1(i,i)/sum(confusion1(:,i))*100;
    recall1(i) = confusion1(i,i)/sum(confusion1(i,:))*100;
end 

%calculate F1 score and normalize confusion matrix
F1_score1 = 2*precision1.*recall1./(precision1+recall1);
sums1 = sum(confusion1,2)*ones(1,10);
confusion1 = confusion1./sums1;

%just visualization of confusion matrix
figure(1);
imagesc([0 9], [0 9], confusion1);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for NNR-1')
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

%visualizations of precision recall and total score
figure(2);
subplot(3,5,[1,2,3])
bar(0:9 ,precision1);
xlim([-0.5 9.5]);
title('precision for NRR-1')
subplot(3,5,[6,7,8])
bar(0:9, recall1);
xlim([-0.5 9.5]);
title('recall for NRR-1');
subplot(3,5,[11,12,13])
bar(0:9, F1_score1);
xlim([-0.5 9.5]);
title('F1 score for NRR-1');
subplot(3,5,[5,10,15]);
bar(ratio1);
ylim([0 1]);
title([num2str(round(ratio1*10000)/100),'%']);
ylabel('Total NRR-1 Classification Score');

h = waitbar(0,'Press Enter for next part');
pause;
close(h);


%% ******************   NNR with euclidean distance ********************** 
KNN_Train = Train;
max_k = 1; %choose number of neighbors here
correct = 0;
Confusion = zeros(10,10);

%the same as above, with minor differences
h = waitbar(0,'Please wait for NNR');
for i = 1:size(Test,1)
    digit = Test(i,1);
    digit_vector = Test(i,2:end);
    D = sum((KNN_Train(:,2:end)-ones(size(KNN_Train,1),1)*digit_vector).^2,2);
    DD = Train(:,1);
    for k = 1:max_k
        [crap, index] = min(D);
        k_nearest(k) = DD(index);
        D(index) = [];
        DD(index) = [];
    end
    categorized = mode(k_nearest);
    if categorized == Test(i,1)
        correct = correct+1;
    end
    Confusion(digit+1,categorized+1) = Confusion(digit+1,categorized+1) +1;
    waitbar(i/size(Test,1));
end
close(h);
ratio = correct/size(Test,1);
precision = zeros(10,1);
recall = zeros(10,1);

for i = 1:10
    precision(i) = Confusion(i,i)/sum(Confusion(:,i))*100;
    recall(i) = Confusion(i,i)/sum(Confusion(i,:))*100;
end
F1_score = 2*precision.*recall./(precision+recall);
sums1 = sum(Confusion,2)*ones(1,10);
Confusion_normalized = Confusion./sums1;

figure(3);
imagesc([0 9], [0 9], Confusion_normalized);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for NNR-3')
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(4);
subplot(3,5,[1,2,3])
bar(0:9 ,precision);
xlim([-0.5 9.5]);
title('precision for NNR-3')
subplot(3,5,[6,7,8])
bar(0:9, recall);
xlim([-0.5 9.5]);
title('recall for NNR-3');
subplot(3,5,[11,12,13])
bar(0:9, F1_score);
xlim([-0.5 9.5]);
title('F1 score for NNR-3');
subplot(3,5,[5,10,15]);
bar(ratio);
ylim([0 1]);
title([num2str(round(ratio*10000)/100),'%']);
ylabel('Total NNR-3 Classification Score');

h = waitbar(0,'Press Enter for next part');
pause;
close(h);

%%  ****************  NNR with Mehalanobis *******************************

max_k = 3; %choose number of neighbors here
d = size(Train,2)-1;
eps = 0.3;
correct = 0;
Confusion = zeros(10,10);

%in the above few lines I calculate the covariance matrices for every class
training_cell = cell(10,1);
for i = 1:size(Train,1)
    training_digit = Train(i,1);
    digit_vector = Train(i,2:end);
    training_cell{training_digit+1} = [training_cell{training_digit+1} ; digit_vector];
end
S = cell(10,1);
for i = 1:10
    S{i} = cov(training_cell{i})+diag(ones(d,1)*eps);
end

%the next part is the same as above except that I take mehalanobis distance
%in mind instead of euclidean
h = waitbar(0,'Please wait for NNR-k with Mehalanobis');
for i = 1:size(Test,1)
    digit = Test(i,1);
    digit_vector = Test(i,2:end);
    
    D = sum((Train(:,2:end) - ones(size(Train,1),1)*digit_vector).*(S{digit+1}\(Train(:,2:end) - ones(size(Train,1),1)*digit_vector)')',2);
    DD = Train(:,1);
    for k = 1:max_k
       [crap, index] = min(D);
        k_nearest(k) = DD(index);
        D(index) = [];
        DD(index) = [];
    end
    categorized = mode(k_nearest);
    if categorized == digit
        correct = correct+1;
    end
    Confusion(digit+1,categorized+1) = Confusion(digit+1,categorized+1) +1;
    waitbar(i/size(Test,1))
end
close(h)
ratio = correct/size(Test,1);
precision = zeros(10,1);
recall = zeros(10,1);

for i = 1:10
    precision(i) = Confusion(i,i)/sum(Confusion(:,i))*100;
    recall(i) = Confusion(i,i)/sum(Confusion(i,:))*100;
end
F1_score = 2*precision.*recall./(precision+recall);

sums1 = sum(Confusion,2)*ones(1,10);
Confusion_normalized = Confusion./sums1;

figure(5);
imagesc([0 9], [0 9], Confusion_normalized);
axis square
colormap(gray)
colorbar;
title('Confusion matrix for NNR-3')
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(6);
subplot(3,5,[1,2,3])
bar(0:9 ,precision);
xlim([-0.5 9.5]);
title('precision for NNR-3')
subplot(3,5,[6,7,8])
bar(0:9, recall);
xlim([-0.5 9.5]);
title('recall for NNR-3');
subplot(3,5,[11,12,13])
bar(0:9, F1_score);
xlim([-0.5 9.5]);
title('F1 score for NNR-3');
subplot(3,5,[5,10,15]);
bar(ratio);
ylim([0 1]);
title([num2str(round(ratio*10000)/100),'%']);
ylabel('Total NNR-3 Classification Score');

