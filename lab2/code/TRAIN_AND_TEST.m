close all; clear all; clc;
pause(0.1);

%======================== CHOOSE PARAMETERS ===============================
NOS = 5;                               %Number of States
NOG = 2;                               %Number of Gaussians per State
Niter = 15;                            %Number of repetitions for EM
Number_of_experiment_repetitions = 1;  %How many times to repeat the experiment
k1 = 4;                                %chosen digit for display of statistics
%==========================================================================



%==========================================================================
%==== The DATA.mat is a 1x9 cell that contains more cells with ============
%===the MFCCs we extracted form lab1 for every speaker and every digit=====
load('DATA.mat');
%==========================================================================



%==========================================================================
%=== In this section we repeat the experiment, each time by chosing =======
%=== randomly the speakers for the training(70%) and testing part(30%)=====

CM = zeros(9,9);                        %initialization of Comfusion Matrix
w = waitbar(0,'Training Models ...');

for repeat_with_random_data_split = 1:Number_of_experiment_repetitions
    
    MAKE_ALL_MODELS; %in this script we divide the Data into training and
                     %testing data randomly, then we create the models with
                     %the training data, one model for every digit

    if repeat_with_random_data_split == 1
        figure(1); plot(LLL{k1}); 
        title('log likelihood as a function of repetitions for k1 digit during training')
        xlim([1 15]);
        pause(0.5);
    end
                     
    for testing_digit = 1:9                 %for all the digits we will test
        
        
        digit_speech = TEST{testing_digit}; %TEST is a 1x9 cell were each
                                            %cell contains a 1x4 cell were
                                            %each one contains one speech
                                            %of the testing digit, so now 
                                            %digit_speech is a 1x4 cell
                                            
        for j=1:length(digit_speech)        %for all speeches of the digit
            
           
            
            data = digit_speech{j};         %now data contains the jth 
                                            %speech data of the ith digit
                                               
            loglik = zeros(1,9);            %just initialization
            
            for k = 1:9                     %for every model we calculate
                                            %the loglikelihood
            loglik(k) = ...
            mhmm_logprob(data, PRIOR{k}, TRANSMAT{k}, MU{k}, SIGMA{k}, MIXMAT{k});
 
            end
            
            if (testing_digit==k1)&&(repeat_with_random_data_split == 1)
                if j==1; close(w); end
                figure(2);
                subplot(length(digit_speech),1,j); plot(loglik);
                title(['loglikelihood of the #',num2str(j),' speech of digit " ',num2str(k1),'"'])
                if j==length(digit_speech)
                      w = waitbar(0,'Training and Testing Models for Multiple Experiments...');
                end
            end
            
            
            
            decision = find(loglik == max(loglik)); %we decide to classify
                                            %the testing set to the model
                                            %which returned the greatest
                                            %loglikelihood
            decision = decision(1);         %just in case we have more than
                                            %one we choose the first one
             
            if (testing_digit == k1)&&(repeat_with_random_data_split == 1) 
                B = mixgauss_prob(data, MU{decision}, SIGMA{decision}, MIXMAT{decision});
                path{j} = viterbi_path(PRIOR{decision}, TRANSMAT{decision}, B);
            end
                                            
                                            
            CM(testing_digit,decision) = CM(testing_digit,decision)+1;
                                            %we add 1 at the row of the 
                                            %digit which was spoken and the
                                            %column of the digit were we 
                                            %classified it
        end
    end

    waitbar(repeat_with_random_data_split/Number_of_experiment_repetitions);
end
close(w)
%==========================================================================



%=== In this section we calculate accuracy precision and recall ===========
precision = zeros(1,9);                     %initializations
recall = zeros(1,9);

accuracy = sum(diag(CM))/sum(sum(CM));      %number of correct classified 
                                            %divided by the number af all
                                            %the classification we made
for i = 1:9
    
    precision(i) = CM(i,i)/sum(CM(:,i));    %number of correct classified
                                            %as the ith digit divided by
                                            %the sum of the samples that
                                            %was classified as this digit
                                            
    recall(i) = CM(i,i)/sum(CM(i,:));       %number of correct classified
                                            %as the ith digit divided by
                                            %the number of the speeches of
                                            %the ith digit that we tested
end
%==========================================================================



%======= In this section we present the optically results =================

A = CM/max(CM(:));      %make values from zero to one
A = 1-A;                %take the complement for better view
figure;
imshow(imresize(A, 50,'nearest'));
title('CONFUSION MATRIX');
xlabel('Category Classified')
ylabel('Digits Spoken');
pause(0.5);
figure;
subplot(2,6,[1 7]); bar(accuracy); ylim([0 1]); 
title(['accuracy = ',num2str(round(1000*accuracy)/10),'%']);
subplot(2,6,[3 6]); bar(precision); title('precision');
subplot(2,6,[9 12]); bar(recall); title('recall');
pause(0.5);
figure;
subplot(4,1,1); plot(path{1}); title(['best path for 1st speech of digit " ',num2str(k1),'"']); ylim([0 NOS+1]);
subplot(4,1,2); plot(path{2}); title(['best path for 2nd speech of digit " ',num2str(k1),'"']); ylim([0 NOS+1]);
subplot(4,1,3); plot(path{3}); title(['best path for 3rd speech of digit " ',num2str(k1),'"']); ylim([0 NOS+1]);
subplot(4,1,4); plot(path{4}); title(['best path for 4th speech of digit " ',num2str(k1),'"']); ylim([0 NOS+1]);
%==========================================================================

load('MGV.mat');
CM_mine(9,9)=0;

for i = 1:9

for k = 1:9                     %for every model we calculate
                                %the loglikelihood
    loglik(k) = ...
    mhmm_logprob(MGV{i}, PRIOR{k}, TRANSMAT{k}, MU{k}, SIGMA{k}, MIXMAT{k});

end

decision = find(loglik == max(loglik)); 
decision = decision(1); 

CM_mine(i,decision)=1;
end

B = CM_mine/max(CM_mine(:));      %make values from zero to one
B = 1-B;                          %take the complement for better view
figure;
imshow(imresize(B, 50,'nearest'));
title('CONFUSION MATRIX of my recorded digits');
xlabel('Category Classified');
ylabel('Digits Spoken');





