function digit = NNR1(T,G,sample)
%NNR with mechalanobis and priors

sizeT = size(T,1);


D = sum((T-ones(sizeT,1)*sample).^2,2);

[crap, index] = min(D);

digit = G(index);

end

