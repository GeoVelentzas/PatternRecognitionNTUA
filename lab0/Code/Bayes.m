function [out confidences]= Bayes( sample,S,M,a_priori )
%Bayes classifier

%sample is the test array
%S is a cell with the covariances for every class
%M is the means for every class
%a_priori is the a_priori probabilities

S_real = S;
d = size(sample,2);

P = zeros(10,1);
 for i = 1:10
     mu = M(i,:);
     P(i) = log(1/((2*pi)^(d/2)*det(S_real{i})^(1/2)))-1/2*(sample-mu)*(S_real{i}\(sample-mu)')+log(a_priori(i));
 end
 
 out = find(P == max(P))-1;
 confidences = (P-min(P))/(max(P)-min(P))*0.75+0.05;
end

