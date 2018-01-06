clear all; close all; clc;
Test = load('test.txt');
S = Test(:,1);
Testing = Test(:,2:end);

h = waitbar(0,'Please wait');
for p = 1:7
    load(['SvmP',num2str(p)])

    for i = 1:10
        [out(:,i), s(:,i)] = svmclassifyandscore(Svm{i},Testing);
    end
    
    Confusion = zeros(10,10);
    for i = 1:size(Test,1)
        [crap, categorized] = min(s(i,:));
        Confusion(S(i)+1,categorized) = Confusion(S(i)+1,categorized)+1;
    end

    ratio(p) = sum(diag(Confusion))/sum(Confusion(:));
    
    precision = zeros(10,1);
    recall = zeros(10,1);
    
    for i = 1:10
        precision(i) = Confusion(i,i)/sum(Confusion(:,i))*100;
        recall(i) = Confusion(i,i)/sum(Confusion(i,:))*100;
    end
    F1_score(p,:) = 2*precision.*recall./(precision+recall);
    
    sums1 = sum(Confusion,2)*ones(1,10);
    Confusion_normalized = Confusion./sums1;
    clear Svm
    waitbar(p/7);
end
close(h);

%%
bar3(F1_score)
title('F1 score for every polyonymic kernel and every digit')

best = zeros(7,10);
for i = 1:10
    [m,k] = max(F1_score(:,i));
    best(k,i) = 1;
end
figure;
imagesc(best);
colormap(gray);
xlabel('Digits')
ylabel('Best polynomial order kernel');


























