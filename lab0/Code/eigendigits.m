clear all; close all; clc;
Train = load('train.txt');
Test = load('test.txt');

C = cov(Train(:,2:end)); %find covariance matric
MU = mean(Train(:,2:end))';
[V,D] = eig(C);

%Take the principal eigenvectors
pcs = 32;
E = V(:,end-pcs+1:end);

% from each observation - image, subtract the mean values and project
% them to the principal eigenvector space

Train(:,2:pcs+1) = (Train(:,2:end)-(ones(size(Train,1),1)*MU'))*E;
Train(:,pcs+2:end) = [];
Test(:,2:pcs+1) = (Test(:,2:end)-(ones(size(Test,1),1)*MU'))*E;
Test(:,pcs+2:end) = [];

% plot four most basic eigendigits
figure(1);
k=1;
for i = pcs:-1:pcs-3
    subplot(2,2,k);
    imagesc(reshape(E(:,i),[16 16])');
    colormap(gray);
    title(['eigendigit ', num2str(k)]);
    axis square;
    k = k+1;
end