function [out confidence] = LogisticRegressionClassifier( testset, trainset, traingroup )
%for 10 classes, for 0 to 9 does linear regression for every group,
%decides the class depending on confidence of every regression outcome.

h = waitbar(0,'Logistic Regression Training Phase');
for k = 1:10
    b = (traingroup==ones(length(traingroup),1)*(k-1))*2-1;
    X = [ones(length(b),1) trainset];
    D = [ones(size(testset,1),1) testset];
    w(:,k) = pinv(X)*b;
    waitbar(k/10)
end
close(h);

predictions = D*w;
h = waitbar(0,'Logistic Regression Testing Phase');
for i =1 :size(testset,1)
    confidence(i,:) = 1./(1+exp(-1*predictions(i,:)));
    [~, out(i,1)] = max(predictions(i,:));
    out(i) = out(i)-1;
    waitbar(i/size(testset,1));
end
close(h);


end

