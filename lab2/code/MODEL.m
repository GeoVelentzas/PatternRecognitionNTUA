% In this script we make a model for the digit


%==========================================================================
NUMBER = DATA{digit};                                       %κραταω τις εκφωνησεις του ψηφιου digit
no_of_speakers = size(NUMBER,2);                            %το συνολο των εκφωνητων
permutation = randperm(no_of_speakers);                     %μπερδεμενοι αριθμοι απο το 1 εως τον αριθμο των εκφωνησεων
percent_for_train=0.7;                                      %θα κρατησουμε το 70% για training
keep_for_train=ceil(percent_for_train * no_of_speakers);    %πλήθος ομιλητών για training

concat_data = [];                                           %αρχικοποίηση των δεδομέμων για mixgauss_init
for i=1:keep_for_train                                      %για το πλήθος των ομιλητών που θα κρατήσουμε
    concat_data = [concat_data [NUMBER{permutation(i)}]'];  %concatenated δεδομενα για τη mixgauss_init
    TRAIN_DATA{i} = [NUMBER{permutation(i)}]';              %πλεον δεκα τυχαιοι ομιλητες στα cells του TRAIN_DATA
end                                                         %τέλος

for i = 1:no_of_speakers-keep_for_train
    TEST_DATA{i} = [NUMBER{permutation(keep_for_train+i)}]'; %τα υπολοιπα για τεστ
end
%==========================================================================



%Choose between case 1 and case 2
%============================== case 1 ====================================
[mu0, Sigma0, weights0] = mixgauss_init(NOS*NOG, concat_data, 'diag','kmeans');

Sigma0 = reshape(Sigma0, [size(Sigma0,1) size(Sigma0,2) NOS NOG]);
mu0 = reshape(mu0, [size(mu0,1) NOS NOG]);
mixmat0 = reshape(weights0, [NOS NOG]);
mixmat0 = normalise(mixmat0,2);

T = diag(ones(NOS,1)/2,0)+diag(ones(NOS-1,1)/2,1);
P=zeros(1,NOS); P(1)=1; 
%T(end,1)=0.5;  %εναλλακτικα να μπορει να επιστρεφει στην 1η κατασταση
%==========================================================================


%=========================== case 2  ======================================
% [mu0, Sigma0, weights0] = mixgauss_init(NOS, concat_data, 'diag','kmeans');
% for f=1:NOG
%     mu00(:,:,f) = mu0(:,:)+(f-1)*0.1;
%     Sigma00(:,:,:,f) = Sigma0(:,:,:);
% end
% mixmat00 = ones(NOS,NOG)/NOG; 
% clear mu0 sigma0 mixmat0
% mu0 =mu00; Sigma0=Sigma00; mixmat0 = mixmat00;
% clear mu00 sigma00 mixmat00
% 
% T = diag(ones(NOS,1)/2,0)+diag(ones(NOS-1,1)/2,1);
% P=zeros(1,NOS); P(1)=1; %priors
% 
% % P = normalise(rand(NOS,1));        %για τυχαιες τοπολογιες
% % T = mk_stochastic(rand(NOS,NOS));  %uncomment this 
%==========================================================================



%==========================================================================
[LL, prior, transmat, mu, Sigma, mixmat] = ...
     mhmm_em(TRAIN_DATA, P, T, mu0, Sigma0, mixmat0,'max_iter',Niter);

 if LL(end)==-Inf %Για να αποφυγω το προβλημα της assert
     MODEL;
 end
 
 LLL{digit} = LL;
 PRIOR{digit} = prior;
 TRANSMAT{digit} = transmat;
 MU{digit} = mu;
 SIGMA{digit} = Sigma;
 MIXMAT{digit} = mixmat;
 TEST{digit} = TEST_DATA;
 %=========================================================================

  