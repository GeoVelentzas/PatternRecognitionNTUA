clear all; close all; clc;

Train=load('train.txt');
Test = load('test.txt');

C = cov(Train(:,2:end)); %find covariance matric
MU = mean(Train(:,2:end))';
[V,D] = eig(C);

%Take the principal eigenvectors
pcs = 32; %choose number of dimensions to project
E = V(:,end-pcs+1:end);

% from each observation - image, subtract the mean values and project
% them to the principal eigenvector space
Train(:,2:pcs+1) = (Train(:,2:end)-(ones(size(Train,1),1)*MU'))*E;
Train(:,pcs+2:end) = [];
Test(:,2:pcs+1) = (Test(:,2:end)-(ones(size(Test,1),1)*MU'))*E;
Test(:,pcs+2:end) = [];

train = Train;
test = Test;

%%
train_v = train(1451:end,:);
test_v = train(1:1451,:);

[o1 c1] = LogisticRegressionClassifier(test_v(:,2:end), train_v(:,2:end), train_v(:,1));
[o2 c2] = BayesianClassifier(test_v(:,2:end), train_v(:,2:end), train_v(:,1));
[o3, ~, c3] = classify(test_v(:,2:end), train_v(:,2:end), train_v(:,1));
[o4 c4] = SupportVectorMachinesClassifier(test_v(:,2:end), train_v(:,2:end), train_v(:,1));
[o5 c5] = NearestNeighbor7Classifier(test_v(:,2:end), train_v(:,2:end), train_v(:,1));


train_new = [c1 c2 c3 c4 c5];
train_new_group = test_v(:,1);
%%

[oo1 c1] = LogisticRegressionClassifier(test(:,2:end), train(:,2:end), train(:,1));
[oo2 c2] = BayesianClassifier(test(:,2:end), train(:,2:end), train(:,1));
[oo3, ~, c3] = classify(test(:,2:end), train(:,2:end), train(:,1));
[oo4 c4] = SupportVectorMachinesClassifier(test(:,2:end), train(:,2:end), train(:,1));
[oo5 c5] = NearestNeighbor7Classifier(test(:,2:end), train(:,2:end), train(:,1));


test_new = [c1 c2 c3 c4 c5];
test_new_group = test(:,1); %the same as old

%%

[o,error, c] = classify(test_new, train_new, train_new_group,'diaglinear');
sum(o==test(:,1))/2007