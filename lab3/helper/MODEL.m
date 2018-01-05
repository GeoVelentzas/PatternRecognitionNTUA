% In this script we make a model for the sign


%==========================================================================
NUMBER = DATA{sign};                                        %������ ��� ���������� ��� ������ sign
no_of_signs = size(NUMBER,2);                               %�� ������ ��� ����������� ��� ���� �����
permutation = randperm(no_of_signs);                        %����������� ������� ��� �� 1 ��� ��� ������ ��� �����������
percent_for_train=0.8;                                      %�� ���������� �� 80% ��� training
keep_for_train=ceil(percent_for_train * no_of_signs);       %������ �������� ��� training

concat_data = [];                                           %������������ ��� ��������� ��� mixgauss_init
for i=1:keep_for_train                                      %��� �� ������ ��� �������� ��� �� ����������
    concat_data = [concat_data [NUMBER{permutation(i)}]'];  %concatenated �������� ��� �� mixgauss_init
    TRAIN_DATA{i} = [NUMBER{permutation(i)}]';              %����� ���� ������� �������� ��� cells ��� TRAIN_DATA
end                                                         %�����

for i = 1:no_of_signs-keep_for_train
    TEST_DATA{i} = [NUMBER{permutation(keep_for_train+i)}]'; %�� �������� ��� ����
end
%==========================================================================




%============================== case 1 ====================================
[mu0, Sigma0, weights0] = mixgauss_init(NOS*NOG, concat_data, 'diag','kmeans');

Sigma0 = reshape(Sigma0, [size(Sigma0,1) size(Sigma0,2) NOS NOG]);
mu0 = reshape(mu0, [size(mu0,1) NOS NOG]);
mixmat0 = reshape(weights0, [NOS NOG]);
mixmat0 = normalise(mixmat0,2);

% T = diag(ones(NOS,1)/2,0)+diag(ones(NOS-1,1)/2,1);
% P=zeros(1,NOS); P(1)=1; 
% %T(end,1)=0.5;  %����������� �� ������ �� ���������� ���� 1� ���������

T = ones(NOS,NOS)/NOS;
P = zeros(1,NOS); P(1) = 1;
%==========================================================================



%==========================================================================
[LL, prior, transmat, mu, Sigma, mixmat] = ...
     mhmm_em(TRAIN_DATA, P, T, mu0, Sigma0, mixmat0,'max_iter',Niter);

 if LL(end)==-Inf %��� �� ������� �� �������� ��� assert
     MODEL;
 end
 
 LLL{sign} = LL;
 PRIOR{sign} = prior;
 TRANSMAT{sign} = transmat;
 MU{sign} = mu;
 SIGMA{sign} = Sigma;
 MIXMAT{sign} = mixmat;
 TEST{sign} = TEST_DATA;
 %=========================================================================

  