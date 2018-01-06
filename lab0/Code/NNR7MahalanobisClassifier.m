function [ out confidence ] = NNR7MahalanobisClassifier( testset, trainset, traingroup )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

%calculate covariance matrices
h = waitbar(0,'NNR7 Mahalanobis Training Phase');
for i = 1:10
    indexes = find(traingroup == i-1);
    T{i} = trainset(indexes,:);
    S{i} = cov(T{i}) + eye(size(T{i},2))*0.13;
    MU{i} = mean(T{i},1);
    a_priori(i) = length(indexes)/length(traingroup);
    waitbar(i/10);
end
close(h)

h = waitbar(0,'Please Wait for NNR7 Mahalanobis Testing Phase');
for i = 1:size(testset, 1)
    for j = 1:length(traingroup)
        D(j) = (trainset(j,:) - testset(i,:))*(S{traingroup(j)+1}\(trainset(j,:) - testset(i,:))');
    end
    DD = traingroup;
    
    for k = 1:7
        [~, index] = min(D);
        k_nearest(k) = DD(index)+1;
        D(index) = [];
        DD(index) = [];
    end
    
    counters = zeros(1,10);
    for m = 1:7
        counters(k_nearest(m)) = counters(k_nearest(m))+1;
    end

    
    score = counters./a_priori;
    [~, out(i,1)] = max(score);
    out(i,1) = out(i,1)-1;
    
    confidence(i,:) = ones(1,10)*0.05;
    for j = 1:7
        confidence(i,k_nearest(j)) = confidence(i,k_nearest(j))+0.95/7;
    end

    waitbar(i/size(testset,1));
end 

close(h);
end

