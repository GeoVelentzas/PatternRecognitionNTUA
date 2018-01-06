%% linear discriminant classifier
clear all; close all; clc;

Train = load('train.txt');
Test = load('test.txt');

%% **** UNCOMENT THIS PART FOR USING PRINCIPAL COMPONENTS OF DATA *********
% BUT IF YOU DO YOU WILL HAVE TO RE-TRAIN SVM UNCOMMENTING THE NEXT PART!!!

%choose number of principal components
pcs = 22;
 
C = cov(Train(:,2:end)); %find covariance matric
MU = mean(Train(:,2:end))';
[V,D] = eig(C);

%Take the principal eigenvectors

E = V(:,end-pcs+1:end);

% from each observation - image, subtract the mean values and project
% them to the principal eigenvector space
Train(:,2:pcs+1) = (Train(:,2:end)-(ones(size(Train,1),1)*MU'))*E;
Train(:,pcs+2:end) = [];
Test(:,2:pcs+1) = (Test(:,2:end)-(ones(size(Test,1),1)*MU'))*E;
Test(:,pcs+2:end) = [];

%%
sample = Test(:,2:end);
training = Train(:,2:end);
group = Train(:,1);
class = classify(sample,training,group,'mahalanobis');

Confusion = zeros(10,10);
for i = 1:size(Test,1)
    Confusion(Test(i,1)+1,class(i)+1)= Confusion(Test(i,1)+1,class(i)+1)+1;
end

%% *** COMPUTE THE SCORES ****
ratio = sum(diag(Confusion))/sum(Confusion(:));


precision = zeros(10,1);
recall = zeros(10,1);

for i = 1:10
    precision(i) = Confusion(i,i)/sum(Confusion(:,i))*100;
    recall(i) = Confusion(i,i)/sum(Confusion(i,:))*100;
end
F1_score = 2*precision.*recall./(precision+recall);

sums1 = sum(Confusion,2)*ones(1,10);
Confusion_normalized = Confusion./sums1;

%% **** VISUALIZATION OF RESULTS ******

figure(1);
imagesc([0 9], [0 9], Confusion_normalized);
axis square
colorbar;
title('Confusion matrix for LDA after PCA')
colormap(gray)
ylabel('Digits to guess')
xlabel('Digits guessed');
pause(1);

figure(2);
subplot(3,5,[1,2,3])
bar(0:9 ,precision);
xlim([-0.5 9.5]);
title('precision for LDA')
subplot(3,5,[6,7,8])
bar(0:9, recall);
xlim([-0.5 9.5]);
title('recall for LDA');
subplot(3,5,[11,12,13])
bar(0:9, F1_score);
xlim([-0.5 9.5]);
title('F1 score for LDA');
subplot(3,5,[5,10,15]);
bar(ratio);
ylim([0 1]);
title([num2str(round(ratio*10000)/100),'%']);
ylabel('Total SVM Classification Score');

