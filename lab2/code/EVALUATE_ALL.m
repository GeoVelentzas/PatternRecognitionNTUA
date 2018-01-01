close all; clear all; clc;
pause(0.1);
load('DATA.mat');
load('MGV.mat');

for NOS = 5:9
for NOG = 1:3

%======================== CHOOSE PARAMETERS ===============================
Niter = 15;                            %Number of repetitions for EM
Number_of_experiment_repetitions = 10;  %How many times to repeat the experiment
k1 = 4;                                %chosen digit for display of statistics
%==========================================================================



%==========================================================================
%=== In this section we repeat the experiment, each time by chosing =======
%=== randomly the speakers for the training(70%) and testing part(30%)=====

CM = zeros(9,9);                        %initialization of Comfusion Matrix
CMine = CM;

for repeat_with_random_data_split = 1:Number_of_experiment_repetitions
    
    MAKE_ALL_MODELS; %in this script we divide the Data into training and
                     %testing data randomly, then we create the models with
                     %the training data, one model for every digit

                     
    for testing_digit = 1:9                 %for all the digit we will test
        
        
        digit_speech = TEST{testing_digit}; %TEST is a 1x9 cell were each
                                            %cell contains a 1x4 cell were
                                            %each one contains one speech
                                            %of the testing digit, so now 
                                            %digit_speech is a 1x4 cell
                                            
        for j=1:length(digit_speech)        %for all speeches of the digit
            
           
            
            data = digit_speech{j};         %now data contains the jth 
                                            %speech of the ith digit
                                               
            loglik = zeros(1,9);            %just initialization
            
            for k = 1:9                     %for every model we calculate
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
             
                                            
                                            
            CM(testing_digit,decision) = CM(testing_digit,decision)+1;
                                            %we add 1 at the row of the 
                                            %digit which was spoken and the
                                            %column of the digit were we 
                                            %classified it
            
   
                                            
        end
        
        p = testing_digit;
        mine = MGV{p};
        for m=1:9
                    llik(m)= ...
                      mhmm_logprob(mine, PRIOR{m}, TRANSMAT{m}, MU{m}, SIGMA{m}, MIXMAT{m});
        end
        dec = find(llik == max(llik));
        dec = dec(1);
        CMine(p,dec) = CMine(p,dec)+1;
        
    end

   
end
%==========================================================================


accmine(NOS,NOG) =  sum(diag(CMine))/sum(sum(CMine));
accuracy(NOS,NOG) = sum(diag(CM))/sum(sum(CM));      %number of correct classified 
                                                     %divided by the number af all
end
end
