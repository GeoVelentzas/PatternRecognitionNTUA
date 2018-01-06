function [ out confidence ] = MahalanobisClassifier( testset, trainset, traingroup )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

%calculate covariance matrices
h = waitbar(0,'Mahalanobis Classifier Training Phase');
for i = 1:10
    indexes = find(traingroup == i-1);
    T = trainset(indexes,:);
    S{i} = cov(T) + eye(size(T,2))*0.13;
    MU{i} = mean(T,1);
    a_priori(i) = length(indexes)/length(traingroup);
    waitbar(i/10);
end
close(h)

h = waitbar(0,'Mahalanobis Classifier Testing Phase')
for i = 1:size(testset,1);
    for j = 1:10
        dist(i,j) = (testset(i,:)-MU{j})*(S{j}\(testset(i,:)-MU{j})');
    end
    [~, out(i,1)] = min(dist(i,:));
    out(i,1) =out(i,1)-1;
    waitbar(i/size(testset,1));
end
close(h);
confidence = dist;

end

