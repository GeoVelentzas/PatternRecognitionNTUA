
clear all; close all; clc;
Train = load('train.txt');
Test = load('test.txt');


pcs = 64; %choose number of principal components
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


line = 4;
D1 = Train(line,2:end)*E' + MU';
figure;
colormap(gray)
imagesc(reshape(D1,[16 16])');
axis square

title('reconstructed from PCs')