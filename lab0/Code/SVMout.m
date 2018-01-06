function [out confidences]= SVMout( sample,Svm )
%Svm function that decides the digit of the sample
%sample is the digit to find as an array
%Svm{i} is the trained Svm struct for digit i

s = zeros(10,1);
for i = 1:10
    [trash(i), s(i)] = svmclassifyandscore(Svm{i},sample);
end

[garbage, out] = min(s);
out = out-1;

confidences = zeros(10,1);
for i = 1:10
    confidences(i) = -1/(1+exp(-4*s(i)))+1;
end

end

