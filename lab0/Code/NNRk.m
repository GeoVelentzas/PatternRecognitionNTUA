function [out confidences]= NNRk(neighbors,T,G,sample,apriori)
%NNR with mechalanobis and priors

%neighbors is the number of neighbors
%Train is training samples
%group is the class of each training sample
%sample is the test sample
%apriori is the apriori probabilities of the training samples
%S is the covariance matrix for every class


for i = 1:length(G)
    D(i) = sum((T(i,:) - sample)*(T(i,:) - sample)');
end

DD = G;

for k = 1:neighbors
    [crap, index] = min(D);
    k_nearest(k) = DD(index)+1;
    D(index) = [];
    DD(index) = [];
end

counters = zeros(10,1);
for i = 1:neighbors
    counters(k_nearest(i)) = counters(k_nearest(i))+1;
end

score = counters./apriori;
[crap, out] = max(score);
out = out-1;

confidences = ones(10,1)*0.05;
for i = 1:neighbors
    confidences(k_nearest(i))=confidences(k_nearest(i))+0.95/neighbors;
end
    

end

