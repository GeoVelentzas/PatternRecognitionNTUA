function [ out confidence ] = SupportVectorMachinesClassifier( testset, trainset, traingroup )


h = waitbar(0,'Support Vector Machines Training Phase');
for i = 1:10                    
    group = (traingroup == i-1);          
    Svm{i} = svmtrain(trainset, group,'method','LS','Kernel_function','polynomial','polyorder',3);
    waitbar(i/10);
end                             
close(h);


h = waitbar(0,'Support Vector Machines Testing Phase');
for i = 1:size(testset,1)
    for j = 1:10
        [~, confidence(i,j)]=svmclassifyandscore(Svm{j},testset(i,:));
    end
    [~, out(i,1)] = min(confidence(i,:));
    out(i,1) = out(i,1)-1;
    waitbar(i/size(testset,1));
end
close(h);


end

