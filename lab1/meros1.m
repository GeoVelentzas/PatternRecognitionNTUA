%******************* clear all and get scren size for plots  ********************************************************
close all; clear all; clc;
scrsz = get(0,'ScreenSize');
%********************************************************************************************************************



%*********************** preprocessing of basic parameters **********************************************************
[x,Fs] = wavread('eight1.wav'); 
x1 = filter([1  +0.97],[1 0],x);        %proemphasis
Ts = 1/Fs;                              %sampling period
l = length(x1);                         %length of array
time = (l-1)*Ts;                        %total time of speech
tt= (0:l-1)*Ts;                         %time vector
t = 0.025;                              %interval of every window (sec)
t_over = 0.010;                         %intersection of windows (sec)
t_step = t-t_over;                      %step between windows
w = round(t/Ts)+1;                      %size of each window in samples
step = round(t_step/Ts);                %step size in samples
h = hamming(w);                         %hamming window
%********************************************************************************************************************



% ********************************* windowing ***********************************************************************
k=0;                                    %in this section we create a 
for i=1:step:l-w                        %matrix xs1, whose rows
    k=k+1;                              %contain a time window
    xs1(k,:)= h.*x1(i:i+w-1);           %weighted with hamming
end                                     %the number of windows is stored
now = k;                                %in variable now  (number of windows)
%********************************************************************************************************************



%************************* sequence of mel filters  *****************************************************************
max = 2595*(log10(1+Fs/1400));          %computation of maximum frequency in mel space
m = linspace(0,max,26);                 %central mel frequencies (0 and Fs/2 will be deleted afterwards...)
f = 700*(10.^(m/2595)-1);               %central frequencies in linear frequency space
f_lin = f(2:25);                        %keep only 24 of those... (not 0 or Fs/2)
spec = 2^nextpow2(w);                   %compute n number of points for fft
f_spec = round(((spec/2)*f_lin)/(Fs/2));%compute vector of frequencies in fft space

H = melfilt(f_spec,spec);               %melfilt function creates mel filters 
                                        %correctly in linear frequency space where frequency Fs/2
                                        %corresponts to point n/2. Each line of the matrix is
                                        %one of the 24 filters
%********************************************************************************************************************



%*************** visualization of basic output signals **************************************************************
figure;
subplot(3,1,1); plot(tt,x);             %initial signal
title('original signal');
xlabel('time (sec)');
subplot(3,1,2); plot(tt,x1);            %signal after proemphasis
title('signal after being emphasized');
xlabel('time (sec)');                     
subplot(3,1,3);                                
hold on; box on;
ff = linspace(0,Fs/2,spec/2);           %sequence of filters
for i=1:length(f_spec);                 
    plot(ff,H(i,1:spec/2));             
end
title('mel filters')
xlabel('Frequency (Hz)');
%********************************************************************************************************************                                



% ********** computation of E,G,C and fft of windows ****************************************************************

[E XS1] = energy(xs1,H,spec,now);       %see energy

G = log10(E(:,:));                      
C = (dct(G(:,:)'))';                    %DCT transform for every row of G
C = C(:,1:13);                          %keep only the first 13 coefficients (dimensionality reduction...)
                                        
                                        %dct_reconstruct will estimate
E_hat = dct_reconstruct(C,24,now);      %energy coefficients
                                        %see dct_reconstruct
%********************************************************************************************************************                                        


                                        
%************ visualization of energy coefficients (randomly chosen windows) ****************************************
figure('Position',[350 100 scrsz(3)-700 scrsz(4)-200]); 
subplot(3,2,1); box on;
plot((E(20,:)));                        %coefficients of 20th window
title('Energy coefficients - E_i_j')
legend('20th window')
subplot(3,2,2); box on;
plot((E(27,:)),'r');                    %coefficients of 27th window
title('Energy coefficients - E_i_j')
legend('27th window')

subplot(3,2,3); box on
plot(log10(E(20,:)));                   %for a better visualization with log
title('Energy coefficients - log_1_0(E_i_j)')
legend('20th window')
subplot(3,2,4); box on
plot(log10(E(27,:)),'r');
title('Energy coefficients - log_1_0(E_i_j)')
legend('27th window')

subplot(3,2,5); box on
plot(log10(E_hat(20,:)));               %visualization of reconstructed E_hat
title('Reconstructed Energy coefficients - log_1_0 (E_i_j)')
legend('20th window')
subplot(3,2,6); box on
plot(log10(E_hat(27,:)),'r');
title('Reconstructed Energy coefficients - log_1_0 (E_i_j)')
legend('27th window','30th window')
%********************************************************************************************************************


%% Computation and visualization of spectrum, with some normalization for better
%  visualization of the energy as envelope
figure;
subplot(2,1,1); hold on; box on;
plot(linspace(0,8000,spec/2),1.5*log10(abs(XS1(20,1:spec/2)))+0.5,'g');
plot(f_lin,log10(E_hat(20,:)));
title('20th window');
legend('Energy reconstruction','Power spectrum')
xlabel('Frequency (Hz)');
subplot(2,1,2); hold on; box on;
plot(linspace(0,8000,spec/2),1.5*log10(abs(XS1(27,1:spec/2))),'g');
plot(f_lin,log10(E_hat(27,:)));
title('27th window');
legend('Energy reconstruction','Power spectrum')
xlabel('Frequency (Hz)');

%% Computation of energies and spectrum of every window as surfaces for a better perspective
figure('Position',[100 100 scrsz(3)-200 scrsz(4)-200]); 
subplot(1,2,1);
surf(1:now , linspace(0,8000,spec/2), log10(abs(XS1(:,1:spec/2)')));
axis square
view(60,15);
shading interp;
camlight; 
lighting gouraud;
xlabel('No of window')
ylabel('Frequency (Hz)');
zlabel('log_1_0 (abs(FFT))');
title('Συνολικο φασμα ανα χρονικο παραθυρο')

subplot(1,2,2);
surf(1:now ,f_lin ,(log10(E_hat(:,:)))');
axis square
view(60,15);
shading interp;
camlight; 
lighting gouraud;
xlabel('No of window')
ylabel('Frequency (Hz)');
zlabel('log_1_0 (Ε hat))');
title('Συντελεστες Ενέργειας')


%% Computation of cepstrum in every window from matrix of ffts
CE = real(ifft(log(abs(XS1(:,:)'))))';      %each line is the cesptrum each window
l_c = size(CE,2);                           %lenght of cepstrum
P = zeros(now,l_c/2);                       %initialization of matrix
P(:,1:13)=CE(:,1:13);                       %keep only the first 13 coefficients
DP = fft(P(:,:)',512)';                     %fft for every cepstrum
DP2 = DP(:,1:256);                          %keep the first half for visualization

%% visualization of cepstrum, mfcc energy and spectrum
figure;
subplot(2,1,1); hold on
plot(linspace(0,8000,spec/2),1.5*log10(abs(XS1(20,1:spec/2)))+0.5,'g');
plot(f_lin,log10(E_hat(20,:)));
plot(linspace(0,8000,256),4*log10(exp(real(DP2(20,:))))+3.5,'r');
legend('Spectrum','MFCC based','Cepstrum based')
subplot(2,1,2); hold on
plot(linspace(0,8000,spec/2),1.5*log10(abs(XS1(27,1:spec/2))),'g');
plot(f_lin,log10(E_hat(27,:)));
plot(linspace(0,8000,256),4*log10(exp(real(DP2(27,:))))+3.5,'r');
legend('Spectrum','MFCC based','Cepstrum based')

