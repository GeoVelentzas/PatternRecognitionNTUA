close all; clear all; clc;
pause(0.1);


%======================== CHOOSE PARAMETERS ===============================
NOS = 5;                               %Number of States
NOG = 1;                               %Number of Gaussians per State
Niter = 15;                            %Number of repetitions for EM
Number_of_experiment_repetitions = 1;  %How many times to repeat the experiment
k1 = 4;                                %chosen sign for display of statistics
%==========================================================================



%==========================================================================
%=== In this section we repeat the experiment, each time by chosing =======
%===      randomly the speakers for the trainingand testing part      =====

CM = zeros(30,30);                        %initialization of Comfusion Matrix
w = waitbar(0,'Training Models ...');

for repeat_with_random_data_split = 1:Number_of_experiment_repetitions

    load('DATA_NEW_FEAT')
    
    MAKE_ALL_MODELS; %in this script we divide the Data into training and
                     %testing data randomly, then we create the models with
                     %the training data, one model for every sign
           
    for testing_sign = 1:30                 %for all the signs we will test
        
        
        sign_speech = TEST{testing_sign}; %TEST is a 1x9 cell were each
                                            %cell contains a 1x4 cell were
                                            %each one contains one speech
                                            %of the testing sign, so now 
                                            %sign_speech is a 1x4 cell
                                            
        for j=1:length(sign_speech)        %for all speeches of the sign
            
           
            
            data = sign_speech{j};         %now data contains the jth 
                                            %speech data of the ith sign
                                               
            loglik = zeros(1,30);            %just initialization
            
            for k = 1:30                     %for every model we calculate
                                            %the loglikelihood
            loglik(k) = ...
            mhmm_logprob(data, PRIOR{k}, TRANSMAT{k}, MU{k}, SIGMA{k}, MIXMAT{k});
 
            end

            
            
            decision = find(loglik == max(loglik)); %we decide to classify
                                            %the testing set to the model
                                            %which returned the greatest
                                            %loglikelihood
            decision = decision(1);         %just in case we have more than
                                            %one we choose the first one
             
                            
            CM(testing_sign,decision) = CM(testing_sign,decision)+1;
                                            %we add 1 at the row of the 
                                            %sign which was spoken and the
                                            %column of the sign were we 
                                            %classified it
        end
    end

    waitbar(repeat_with_random_data_split/Number_of_experiment_repetitions);
    clear DATA LL LLL MIXMAT MU NUMBER P PRIOR SIGMA Sigma Sigma0 T ...
        TEST TEST_DATA TRAIN_DATA TRANSMAT concat_data data sign_speech ...
        mixmat mixmat0 mu mu0 permutation prior transmat weights0
end
close(w)
%==========================================================================



%=== In this section we calculate accuracy precision and recall ===========
precision = zeros(1,30);                     %initializations
recall = zeros(1,30);

accuracy = sum(diag(CM))/sum(sum(CM));      %number of correct classified 
                                            %divided by the number af all
                                            %the classification we made
for i = 1:30
    
    precision(i) = CM(i,i)/sum(CM(:,i));    %number of correct classified
                                            %as the ith sign divided by
                                            %the sum of the samples that
                                            %was classified as this sign
                                            
    recall(i) = CM(i,i)/sum(CM(i,:));       %number of correct classified
                                            %as the ith sign divided by
                                            %the number of the speeches of
                                            %the ith sign that we tested
end
%==========================================================================



%======= In this section we present the optically results =================

s = sum(CM');
for i = 1: size(CM,1);
    A(i,:) = CM(i,:)/s(i);      %make values from zero to one to every row
    A(i,:) = 1-A(i,:);                %take the complement for better view
end
figure;
imshow(imresize(A, 50,'nearest'));
title('CONFUSION MATRIX');
xlabel('Category Classified')
ylabel('Sign');
pause(0.5);
figure;
subplot(2,6,[1 7]); bar(accuracy); ylim([0 1]); 
title(['accuracy = ',num2str(round(1000*accuracy)/10),'%']);
subplot(2,6,[3 6]); bar(precision); xlim([0 length(precision)]); title('precision');
subplot(2,6,[9 12]); bar(recall); xlim([0 length(recall)]); title('recall');



