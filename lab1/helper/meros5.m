%************ clear all and get screen size  ******************************
clear all; close all;
scrsz = get(0,'ScreenSize');
%**************************************************************************

%********** call read_all_speaker to make mfcc matrices *******************
[C1,I1] = read_all_speakers(4);             %get read_all_speakers
[C2,I2] = read_all_speakers(6);
[C3,I3] = read_all_speakers(8);
%**************************************************************************


%********* some chosen pairs of coefficients for digit 4 ******************
figure('Position',[0 0 scrsz(3) scrsz(4)]); 
subplot(4,4,1);
plot(C1(:,1),C1(:,2),'.'); title('0-1');
subplot(4,4,2);
plot(C1(:,3),C1(:,4),'.'); title('2-3');
subplot(4,4,3);
plot(C1(:,5),C1(:,6),'.'); title('4-5');
subplot(4,4,4);
plot(C1(:,7),C1(:,8),'.'); title('6-7');
subplot(4,4,5);
plot(C1(:,9),C1(:,10),'.'); title('8-9');
subplot(4,4,6);
plot(C1(:,11),C1(:,12),'.'); title('10-11');
subplot(4,4,7);
plot(C1(:,1),C1(:,13),'.'); title('0-12');
subplot(4,4,8);
plot(C1(:,1),C1(:,3),'.'); title('0-2');
subplot(4,4,9);
plot(C1(:,1),C1(:,4),'.'); title('0-3');
subplot(4,4,10);
plot(C1(:,1),C1(:,5),'.'); title('0-4');
subplot(4,4,11);
plot(C1(:,1),C1(:,6),'.'); title('0-5');
subplot(4,4,12);
plot(C1(:,1),C1(:,7),'.'); title('0-6');
subplot(4,4,13);
plot(C1(:,1),C1(:,8),'.'); title('0-7');
subplot(4,4,14);
plot(C1(:,1),C1(:,9),'.'); title('0-8');
subplot(4,4,15);
plot(C1(:,1),C1(:,10),'.'); title('0-9');
subplot(4,4,16);
plot(C1(:,1),C1(:,11),'.'); title('0-10');
%**************************************************************************


%***** kmeans for all the coefficients for pronouncing digit 4 ************
%******* from all speakers and visualization of results *******************
K=5;                                        %don't change this!!!!
figure('Position',[0 0 scrsz(3) scrsz(4)]); 
opts1 = statset('Display','final');
[idx1,ctrs1] = kmeans(C1,K,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',20,'start','sample','Options',opts1); 

subplot(4,4,1); hold on; box on;
plot(C1(idx1==1,1),C1(idx1==1,2),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,2),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,2),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,2),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,2),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,2),'kx','LineWidth',2)
title('0-1');
subplot(4,4,2); hold on; box on;             
plot(C1(idx1==1,3),C1(idx1==1,4),'r.','MarkerSize',12)
plot(C1(idx1==2,3),C1(idx1==2,4),'b.','MarkerSize',12)
plot(C1(idx1==3,3),C1(idx1==3,4),'m.','MarkerSize',12)
plot(C1(idx1==4,3),C1(idx1==4,4),'g.','MarkerSize',12)
plot(C1(idx1==5,3),C1(idx1==5,4),'c.','MarkerSize',12)
plot(ctrs1(:,3),ctrs1(:,4),'kx','LineWidth',2)
title('2-3');
subplot(4,4,3); hold on; box on;             
plot(C1(idx1==1,5),C1(idx1==1,6),'r.','MarkerSize',12)
plot(C1(idx1==2,5),C1(idx1==2,6),'b.','MarkerSize',12)
plot(C1(idx1==3,5),C1(idx1==3,6),'m.','MarkerSize',12)
plot(C1(idx1==4,5),C1(idx1==4,6),'g.','MarkerSize',12)
plot(C1(idx1==5,5),C1(idx1==5,6),'c.','MarkerSize',12)
plot(ctrs1(:,5),ctrs1(:,6),'kx','LineWidth',2)
title('4-5');
subplot(4,4,4); hold on; box on;             
plot(C1(idx1==1,7),C1(idx1==1,8),'r.','MarkerSize',12)
plot(C1(idx1==2,7),C1(idx1==2,8),'b.','MarkerSize',12)
plot(C1(idx1==3,7),C1(idx1==3,8),'m.','MarkerSize',12)
plot(C1(idx1==4,7),C1(idx1==4,8),'g.','MarkerSize',12)
plot(C1(idx1==5,7),C1(idx1==5,8),'c.','MarkerSize',12)
plot(ctrs1(:,7),ctrs1(:,8),'kx','LineWidth',2)
title('6-7');
subplot(4,4,5); hold on; box on;             
plot(C1(idx1==1,9),C1(idx1==1,10),'r.','MarkerSize',12)
plot(C1(idx1==2,9),C1(idx1==2,10),'b.','MarkerSize',12)
plot(C1(idx1==3,9),C1(idx1==3,10),'m.','MarkerSize',12)
plot(C1(idx1==4,9),C1(idx1==4,10),'g.','MarkerSize',12)
plot(C1(idx1==5,9),C1(idx1==5,10),'c.','MarkerSize',12)
plot(ctrs1(:,9),ctrs1(:,10),'kx','LineWidth',2)
title('8-9');
subplot(4,4,6); hold on; box on;             
plot(C1(idx1==1,11),C1(idx1==1,12),'r.','MarkerSize',12)
plot(C1(idx1==2,11),C1(idx1==2,12),'b.','MarkerSize',12)
plot(C1(idx1==3,11),C1(idx1==3,12),'m.','MarkerSize',12)
plot(C1(idx1==4,11),C1(idx1==4,12),'g.','MarkerSize',12)
plot(C1(idx1==5,11),C1(idx1==5,12),'c.','MarkerSize',12)
plot(ctrs1(:,11),ctrs1(:,12),'kx','LineWidth',2)
title('10-11');
subplot(4,4,7); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,13),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,13),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,13),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,13),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,13),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,13),'kx','LineWidth',2)
title('0-12');
subplot(4,4,8); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,3),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,3),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,3),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,3),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,3),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,3),'kx','LineWidth',2)
title('0-2');
subplot(4,4,9); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,4),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,4),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,4),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,4),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,4),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,4),'kx','LineWidth',2)
title('0-3');
subplot(4,4,10); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,5),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,5),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,5),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,5),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,5),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,5),'kx','LineWidth',2)
title('0-4');
subplot(4,4,11); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,6),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,6),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,6),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,6),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,6),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,6),'kx','LineWidth',2)
title('0-5');
subplot(4,4,12); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,7),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,7),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,7),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,7),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,7),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,7),'kx','LineWidth',2)
title('0-6');
subplot(4,4,13); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,8),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,8),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,8),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,8),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,8),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,8),'kx','LineWidth',2)
title('0-7');
subplot(4,4,14); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,9),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,9),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,9),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,9),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,9),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,9),'kx','LineWidth',2)
title('0-8');
subplot(4,4,15); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,10),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,10),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,10),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,10),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,10),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,10),'kx','LineWidth',2)
title('0-9');
subplot(4,4,16); hold on; box on;             
plot(C1(idx1==1,1),C1(idx1==1,11),'r.','MarkerSize',12)
plot(C1(idx1==2,1),C1(idx1==2,11),'b.','MarkerSize',12)
plot(C1(idx1==3,1),C1(idx1==3,11),'m.','MarkerSize',12)
plot(C1(idx1==4,1),C1(idx1==4,11),'g.','MarkerSize',12)
plot(C1(idx1==5,1),C1(idx1==5,11),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,11),'kx','LineWidth',2)
title('0-10');

figure('Position',[0 0 scrsz(3) scrsz(4)]); %movement of windows
subplot(4,4,1);
plot(idx1(1:I1(1)));                        %1st prounouncing
ylim([-1 K+1]);
for i=1:(length(I1)-1)
    subplot(4,4,i+1);
    plot(idx1(I1(i)+1 : I1(i+1)));          %other pronouncings
    ylim([-1 K+1]);
end
%**************************************************************************



%**** kmeans for different K and visualization in class space *************
clear idx1; clear opts1; clear ctrs1;
K=8;                                        %you can change this
opts1 = statset('Display','final');
[idx1,ctrs1] = kmeans(C1,K,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',20,'start','sample','Options',opts1);
figure('Position',[0 0 scrsz(3) scrsz(4)]);  
subplot(4,4,1);
%idx1= filter([1 1 1]/3,1,idx1); %normalization
plot(idx1(1:I1(1))); %1st pronouncing
ylim([-1 K+1]);
for i=1:(length(I1)-1)
    subplot(4,4,i+1);
    plot(idx1(I1(i)+1 : I1(i+1)));
    ylim([-1 K+1]);
end
%**************************************************************************


%% 

%********** visualization of chosen pairs for digit 6 *********************
figure('Position',[0 0 scrsz(3) scrsz(4)]); 
subplot(4,4,1);
plot(C2(:,1),C2(:,2),'.'); title('0-1');
subplot(4,4,2);
plot(C2(:,3),C2(:,4),'.'); title('2-3');
subplot(4,4,3);
plot(C2(:,5),C2(:,6),'.'); title('4-5');
subplot(4,4,4);
plot(C2(:,7),C2(:,8),'.'); title('6-7');
subplot(4,4,5);
plot(C2(:,9),C2(:,10),'.'); title('8-9');
subplot(4,4,6);
plot(C2(:,11),C2(:,12),'.'); title('10-11');
subplot(4,4,7);
plot(C2(:,1),C2(:,13),'.'); title('0-12');
subplot(4,4,8);
plot(C2(:,1),C2(:,3),'.'); title('0-2');
subplot(4,4,9);
plot(C2(:,1),C2(:,4),'.'); title('0-3');
subplot(4,4,10);
plot(C2(:,1),C2(:,5),'.'); title('0-4');
subplot(4,4,11);
plot(C2(:,1),C2(:,6),'.'); title('0-5');
subplot(4,4,12);
plot(C2(:,1),C2(:,7),'.'); title('0-6');
subplot(4,4,13);
plot(C2(:,1),C2(:,8),'.'); title('0-7');
subplot(4,4,14);
plot(C2(:,1),C2(:,9),'.'); title('0-8');
subplot(4,4,15);
plot(C2(:,1),C2(:,10),'.'); title('0-9');
subplot(4,4,16);
plot(C2(:,1),C2(:,11),'.'); title('0-10');
%**************************************************************************



%***** kmeans for all the coefficients for pronouncing digit 6 ************
%******* from all speakers and visualization of results *******************
K=5;                                            %don't change this!!!
figure('Position',[0 0 scrsz(3) scrsz(4)]); 
opts2 = statset('Display','final');
[idx2,ctrs2] = kmeans(C2,5,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',20,'start','sample','Options',opts2); 

subplot(4,4,1); hold on; box on;
plot(C2(idx2==1,1),C2(idx2==1,2),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,2),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,2),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,2),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,2),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,2),'kx','LineWidth',2)
title('0-1');
subplot(4,4,2); hold on; box on;             
plot(C2(idx2==1,3),C2(idx2==1,4),'r.','MarkerSize',12)
plot(C2(idx2==2,3),C2(idx2==2,4),'b.','MarkerSize',12)
plot(C2(idx2==3,3),C2(idx2==3,4),'m.','MarkerSize',12)
plot(C2(idx2==4,3),C2(idx2==4,4),'g.','MarkerSize',12)
plot(C2(idx2==5,3),C2(idx2==5,4),'c.','MarkerSize',12)
plot(ctrs2(:,3),ctrs2(:,4),'kx','LineWidth',2)
title('2-3');
subplot(4,4,3); hold on; box on;             
plot(C2(idx2==1,5),C2(idx2==1,6),'r.','MarkerSize',12)
plot(C2(idx2==2,5),C2(idx2==2,6),'b.','MarkerSize',12)
plot(C2(idx2==3,5),C2(idx2==3,6),'m.','MarkerSize',12)
plot(C2(idx2==4,5),C2(idx2==4,6),'g.','MarkerSize',12)
plot(C2(idx2==5,5),C2(idx2==5,6),'c.','MarkerSize',12)
plot(ctrs2(:,5),ctrs2(:,6),'kx','LineWidth',2)
title('4-5');
subplot(4,4,4); hold on; box on;             
plot(C2(idx2==1,7),C2(idx2==1,8),'r.','MarkerSize',12)
plot(C2(idx2==2,7),C2(idx2==2,8),'b.','MarkerSize',12)
plot(C2(idx2==3,7),C2(idx2==3,8),'m.','MarkerSize',12)
plot(C2(idx2==4,7),C2(idx2==4,8),'g.','MarkerSize',12)
plot(C2(idx2==5,7),C2(idx2==5,8),'c.','MarkerSize',12)
plot(ctrs2(:,7),ctrs2(:,8),'kx','LineWidth',2)
title('6-7');
subplot(4,4,5); hold on; box on;             
plot(C2(idx2==1,9),C2(idx2==1,10),'r.','MarkerSize',12)
plot(C2(idx2==2,9),C2(idx2==2,10),'b.','MarkerSize',12)
plot(C2(idx2==3,9),C2(idx2==3,10),'m.','MarkerSize',12)
plot(C2(idx2==4,9),C2(idx2==4,10),'g.','MarkerSize',12)
plot(C2(idx2==5,9),C2(idx2==5,10),'c.','MarkerSize',12)
plot(ctrs2(:,9),ctrs2(:,10),'kx','LineWidth',2)
title('8-9');
subplot(4,4,6); hold on; box on;             
plot(C2(idx2==1,11),C2(idx2==1,12),'r.','MarkerSize',12)
plot(C2(idx2==2,11),C2(idx2==2,12),'b.','MarkerSize',12)
plot(C2(idx2==3,11),C2(idx2==3,12),'m.','MarkerSize',12)
plot(C2(idx2==4,11),C2(idx2==4,12),'g.','MarkerSize',12)
plot(C2(idx2==5,11),C2(idx2==5,12),'c.','MarkerSize',12)
plot(ctrs2(:,11),ctrs2(:,12),'kx','LineWidth',2)
title('10-11');
subplot(4,4,7); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,13),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,13),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,13),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,13),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,13),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,13),'kx','LineWidth',2)
title('0-12');
subplot(4,4,8); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,3),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,3),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,3),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,3),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,3),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,3),'kx','LineWidth',2)
title('0-2');
subplot(4,4,9); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,4),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,4),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,4),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,4),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,4),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,4),'kx','LineWidth',2)
title('0-3');
subplot(4,4,10); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,5),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,5),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,5),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,5),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,5),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,5),'kx','LineWidth',2)
title('0-4');
subplot(4,4,11); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,6),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,6),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,6),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,6),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,6),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,6),'kx','LineWidth',2)
title('0-5');
subplot(4,4,12); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,7),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,7),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,7),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,7),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,7),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,7),'kx','LineWidth',2)
title('0-6');
subplot(4,4,13); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,8),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,8),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,8),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,8),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,8),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,8),'kx','LineWidth',2)
title('0-7');
subplot(4,4,14); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,9),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,9),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,9),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,9),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,9),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,9),'kx','LineWidth',2)
title('0-8');
subplot(4,4,15); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,10),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,10),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,10),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,10),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,10),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,10),'kx','LineWidth',2)
title('0-9');
subplot(4,4,16); hold on; box on;             
plot(C2(idx2==1,1),C2(idx2==1,11),'r.','MarkerSize',12)
plot(C2(idx2==2,1),C2(idx2==2,11),'b.','MarkerSize',12)
plot(C2(idx2==3,1),C2(idx2==3,11),'m.','MarkerSize',12)
plot(C2(idx2==4,1),C2(idx2==4,11),'g.','MarkerSize',12)
plot(C2(idx2==5,1),C2(idx2==5,11),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,11),'kx','LineWidth',2)
title('0-10');

figure('Position',[0 0 scrsz(3) scrsz(4)]);     %movement of windows
subplot(4,4,1);
plot(idx2(1:I2(1)));                            %1st pronouncing
ylim([-1 K+1]);
for i=1:(length(I2)-1)
    subplot(4,4,i+1);
    plot(idx2(I2(i)+1 : I2(i+1)));              %others
    ylim([-1 K+1]);
end
%**************************************************************************



%******** kmeans for different K and visualization of windows *************
%*************************** in class space *******************************
clear idx2; clear opts2; clear ctrs2;
K=8;                                            %you can change this
opts2 = statset('Display','final');
[idx2,ctrs2] = kmeans(C2,K,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',20,'start','sample','Options',opts2);
figure('Position',[0 0 scrsz(3) scrsz(4)]);  
subplot(4,4,1);
plot(idx2(1:I2(1)));                            %1st pronouncing
ylim([-1 K+1]);
for i=1:(length(I2)-1)
    subplot(4,4,i+1);
    plot(idx2(I2(i)+1 : I2(i+1)));              %others
    ylim([-1 K+1]);
end
%**************************************************************************


%%


%********** visualization of chosen pairs for digit 8 *********************
figure('Position',[0 0 scrsz(3) scrsz(4)]); 
subplot(4,4,1);
plot(C3(:,1),C3(:,2),'.'); title('0-1');
subplot(4,4,2);
plot(C3(:,3),C3(:,4),'.'); title('2-3');
subplot(4,4,3);
plot(C3(:,5),C3(:,6),'.'); title('4-5');
subplot(4,4,4);
plot(C3(:,7),C3(:,8),'.'); title('6-7');
subplot(4,4,5);
plot(C3(:,9),C3(:,10),'.'); title('8-9');
subplot(4,4,6);
plot(C3(:,11),C3(:,12),'.'); title('10-11');
subplot(4,4,7);
plot(C3(:,1),C3(:,13),'.'); title('0-12');
subplot(4,4,8);
plot(C3(:,1),C3(:,3),'.'); title('0-2');
subplot(4,4,9);
plot(C3(:,1),C3(:,4),'.'); title('0-3');
subplot(4,4,10);
plot(C3(:,1),C3(:,5),'.'); title('0-4');
subplot(4,4,11);
plot(C3(:,1),C3(:,6),'.'); title('0-5');
subplot(4,4,12);
plot(C3(:,1),C3(:,7),'.'); title('0-6');
subplot(4,4,13);
plot(C3(:,1),C3(:,8),'.'); title('0-7');
subplot(4,4,14);
plot(C3(:,1),C3(:,9),'.'); title('0-8');
subplot(4,4,15);
plot(C3(:,1),C3(:,10),'.'); title('0-9');
subplot(4,4,16);
plot(C3(:,1),C3(:,11),'.'); title('0-10');
%**************************************************************************



%***** kmeans for all the coefficients for pronouncing digit 8 ************
%******* from all speakers and visualization of results *******************
K=5;                                            %don't change this!!!!!
figure('Position',[0 0 scrsz(3) scrsz(4)]); 
opts3 = statset('Display','final');
[idx3,ctrs3] = kmeans(C3,K,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',20,'start','sample','Options',opts3); 

subplot(4,4,1); hold on; box on;
plot(C3(idx3==1,1),C3(idx3==1,2),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,2),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,2),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,2),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,2),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,2),'kx','LineWidth',2)
title('0-1');
subplot(4,4,2); hold on; box on;             
plot(C3(idx3==1,3),C3(idx3==1,4),'r.','MarkerSize',12)
plot(C3(idx3==2,3),C3(idx3==2,4),'b.','MarkerSize',12)
plot(C3(idx3==3,3),C3(idx3==3,4),'m.','MarkerSize',12)
plot(C3(idx3==4,3),C3(idx3==4,4),'g.','MarkerSize',12)
plot(C3(idx3==5,3),C3(idx3==5,4),'c.','MarkerSize',12)
plot(ctrs3(:,3),ctrs3(:,4),'kx','LineWidth',2)
title('2-3');
subplot(4,4,3); hold on; box on;             
plot(C3(idx3==1,5),C3(idx3==1,6),'r.','MarkerSize',12)
plot(C3(idx3==2,5),C3(idx3==2,6),'b.','MarkerSize',12)
plot(C3(idx3==3,5),C3(idx3==3,6),'m.','MarkerSize',12)
plot(C3(idx3==4,5),C3(idx3==4,6),'g.','MarkerSize',12)
plot(C3(idx3==5,5),C3(idx3==5,6),'c.','MarkerSize',12)
plot(ctrs3(:,5),ctrs3(:,6),'kx','LineWidth',2)
title('4-5');
subplot(4,4,4); hold on; box on;             
plot(C3(idx3==1,7),C3(idx3==1,8),'r.','MarkerSize',12)
plot(C3(idx3==2,7),C3(idx3==2,8),'b.','MarkerSize',12)
plot(C3(idx3==3,7),C3(idx3==3,8),'m.','MarkerSize',12)
plot(C3(idx3==4,7),C3(idx3==4,8),'g.','MarkerSize',12)
plot(C3(idx3==5,7),C3(idx3==5,8),'c.','MarkerSize',12)
plot(ctrs3(:,7),ctrs3(:,8),'kx','LineWidth',2)
title('6-7');
subplot(4,4,5); hold on; box on;             
plot(C3(idx3==1,9),C3(idx3==1,10),'r.','MarkerSize',12)
plot(C3(idx3==2,9),C3(idx3==2,10),'b.','MarkerSize',12)
plot(C3(idx3==3,9),C3(idx3==3,10),'m.','MarkerSize',12)
plot(C3(idx3==4,9),C3(idx3==4,10),'g.','MarkerSize',12)
plot(C3(idx3==5,9),C3(idx3==5,10),'c.','MarkerSize',12)
plot(ctrs3(:,9),ctrs3(:,10),'kx','LineWidth',2)
title('8-9');
subplot(4,4,6); hold on; box on;             
plot(C3(idx3==1,11),C3(idx3==1,12),'r.','MarkerSize',12)
plot(C3(idx3==2,11),C3(idx3==2,12),'b.','MarkerSize',12)
plot(C3(idx3==3,11),C3(idx3==3,12),'m.','MarkerSize',12)
plot(C3(idx3==4,11),C3(idx3==4,12),'g.','MarkerSize',12)
plot(C3(idx3==5,11),C3(idx3==5,12),'c.','MarkerSize',12)
plot(ctrs3(:,11),ctrs3(:,12),'kx','LineWidth',2)
title('10-11');
subplot(4,4,7); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,13),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,13),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,13),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,13),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,13),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,13),'kx','LineWidth',2)
title('0-12');
subplot(4,4,8); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,3),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,3),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,3),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,3),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,3),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,3),'kx','LineWidth',2)
title('0-2');
subplot(4,4,9); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,4),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,4),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,4),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,4),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,4),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,4),'kx','LineWidth',2)
title('0-3');
subplot(4,4,10); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,5),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,5),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,5),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,5),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,5),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,5),'kx','LineWidth',2)
title('0-4');
subplot(4,4,11); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,6),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,6),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,6),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,6),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,6),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,6),'kx','LineWidth',2)
title('0-5');
subplot(4,4,12); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,7),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,7),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,7),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,7),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,7),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,7),'kx','LineWidth',2)
title('0-6');
subplot(4,4,13); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,8),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,8),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,8),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,8),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,8),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,8),'kx','LineWidth',2)
title('0-7');
subplot(4,4,14); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,9),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,9),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,9),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,9),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,9),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,9),'kx','LineWidth',2)
title('0-8');
subplot(4,4,15); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,10),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,10),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,10),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,10),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,10),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,10),'kx','LineWidth',2)
title('0-9');
subplot(4,4,16); hold on; box on;             
plot(C3(idx3==1,1),C3(idx3==1,11),'r.','MarkerSize',12)
plot(C3(idx3==2,1),C3(idx3==2,11),'b.','MarkerSize',12)
plot(C3(idx3==3,1),C3(idx3==3,11),'m.','MarkerSize',12)
plot(C3(idx3==4,1),C3(idx3==4,11),'g.','MarkerSize',12)
plot(C3(idx3==5,1),C3(idx3==5,11),'c.','MarkerSize',12)
plot(ctrs3(:,1),ctrs3(:,11),'kx','LineWidth',2)
title('0-10');

figure('Position',[0 0 scrsz(3) scrsz(4)]);  
subplot(4,4,1);
plot(idx3(1:I3(1)));                            
ylim([-1 K+1]);
for i=1:(length(I3)-1)
    subplot(4,4,i+1);
    plot(idx3(I3(i)+1 : I3(i+1)));             
    ylim([-1 K+1]);
end
%**************************************************************************



%******** kmeans for different K and visualization of windows *************
%*************************** in class space *******************************
clear idx2; clear opts2; clear ctrs2;
K=8;                                            %you can change this
opts3 = statset('Display','final');
[idx3,ctrs3] = kmeans(C3,K,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',20,'start','sample','Options',opts3);
figure('Position',[0 0 scrsz(3) scrsz(4)]);  
subplot(4,4,1);
plot(idx3(1:I3(1)));                            
ylim([-1 K+1]);
for i=1:(length(I3)-1)
    subplot(4,4,i+1);
    plot(idx3(I3(i)+1 : I3(i+1)));              
    ylim([-1 K+1]);
end
%**************************************************************************





