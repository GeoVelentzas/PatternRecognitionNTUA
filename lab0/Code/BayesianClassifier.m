function [out confidences] = BayesianClassifier(testset, trainset, traingroup )

%calculate covariance matrices
h = waitbar(0,'Bayesian Classifier Training Phase');
for i = 1:10
    indexes = find(traingroup == i-1);
    T = trainset(indexes,:);
    S{i} = cov(T) + eye(size(T,2))*0.13;
    MU{i} = mean(T,1);
    a_priori(i) = length(indexes)/length(traingroup);
    waitbar(i/10);
end
close(h)

d = length(MU{1});
h = waitbar(0,'Bayesian Classifier Testing Phase');
for k = 1:size(testset,1)
    for i = 1:10
        P(k,i) = -256*log(200)+ log(a_priori(i)) -(d/2)*log(2*pi) -(1/2)*log(det(S{i})) -1/2*((testset(k,:)-MU{i})*(S{i}\(testset(k,:)-MU{i})'));
    end
    confidences(k,:) = P(k,:);
    [~, out(k,1)] = max(P(k,:));
    out(k,1)=out(k,1)-1;
    waitbar(k/size(testset,1));
end
close(h);


end