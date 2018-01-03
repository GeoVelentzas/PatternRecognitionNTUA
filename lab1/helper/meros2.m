%************ clear all and get screen size ******* ***********************
clear all; close all;
scrsz = get(0,'ScreenSize');
%**************************************************************************

%***** call read_all_speakers for making matrices with mfccs **************
C4 = read_all_speakers(4);          %see read_all_speakers
C6 = read_all_speakers(6);
%**************************************************************************


%************** visualize some coefficients *******************************
C4_1 = MFCC('four1.wav');           %see MFCC
C6_1 = MFCC('six1.wav');
figure('Position',[100 100 scrsz(3)-200 scrsz(4)-200]);
subplot(1,2,1); 
bar3(C4_1(:,:)); 
axis square;
title('MFCC of 1st speaker for pronouncing digit 4')
ylabel('time window');
xlabel('MFCC')
subplot(1,2,2); 
bar3(C6_1(:,:)); 
axis square;
title('MFCC of 1st speaker for pronouncing digit 6')
%**************************************************************************


%*** visualization of histograms for some coefficients ********************
figure;
subplot(2,1,1);
histfit(C4(:,3),25);                   %histogram of 2nd coefficient
title('C_i (2) for digit 4');
ylabel('frequency of appearance')
subplot(2,1,2);
histfit(C4(:,13),25);                  %histogram of 12th coefficient
title('C_i (12) for digit 4');
xlabel('values')
ylabel('frequency of appearance')

figure;
subplot(2,1,1);
histfit(C6(:,3),25);                   %histogram of 2nd coefficient
title('C_i (2) for digit 6');
ylabel('frequency of appearance')
subplot(2,1,2);
histfit(C6(:,13),25);                  %histogram of 12th coefficient
title('C_i (12) for digit 6');
xlabel('values')
ylabel('frequency of appearance')
%**************************************************************************




