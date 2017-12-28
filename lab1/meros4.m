%************  ¡»¡—…”Ã¡ œÀŸÕ  ¡…  À≈…”…Ãœ –¡—¡»’—ŸÕ ***********************
clear all; close all; clc;
scrsz = get(0,'ScreenSize');
%**************************************************************************



%************  À«”« ‘«” read_all_speakers √…¡ ƒ«Ã…œ’—√…¡ ******************
%********************** –…Õ¡ ŸÕ Ã≈ ‘œ’” MFCCs *****************************
C1 = read_all_speakers(4);
C2 = read_all_speakers(6);
%**************************************************************************



%********* ≈Ã÷¡Õ…”« ‘ŸÕ ∆≈’√ŸÕ C(7) KAI C(8) ******************************
figure('Position',[250 50 scrsz(3)-500 scrsz(4)-150]); 
subplot(2,2,1); box on;
plot(C1(:,8),C1(:,9),'*');
title('∆Âı„Á C_i (7) Í·È C_i (8) „È· ÙÔ ¯ÁˆÈÔ "4"')
xlabel('C_i (7)');
ylabel('C_i (8)');
subplot(2,2,2); box on;
plot(C2(:,8),C2(:,9),'*');
title('∆Âı„Á C_i (7) Í·È C_i (8) „È· ÙÔ ¯ÁˆÈÔ "6"')
xlabel('C_i (7)');
ylabel('C_i (8)');
%**************************************************************************



%**********  —¡‘«Ã¡ ‘ŸÕ C(7) KAI C(8) √…¡ ≈÷¡—Ãœ√«  Ã≈¡ÕS *****************
X1 = [C1(:,8)  C1(:,9)];
X2 = [C2(:,8)  C2(:,9)];
%**************************************************************************



%********** KMEANS √…¡ ‘œ’” C(7) KAI C(8) ‘œ’ ÿ«÷…œ’ "4" ******************
subplot(2,2,3); hold on; box on;
opts1 = statset('Display','final');
[idx1,ctrs1] = kmeans(X1,5,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',10,'start','sample','Options',opts1);               
plot(X1(idx1==1,1),X1(idx1==1,2),'r.','MarkerSize',12)
plot(X1(idx1==2,1),X1(idx1==2,2),'b.','MarkerSize',12)
plot(X1(idx1==3,1),X1(idx1==3,2),'m.','MarkerSize',12)
plot(X1(idx1==4,1),X1(idx1==4,2),'g.','MarkerSize',12)
plot(X1(idx1==5,1),X1(idx1==5,2),'c.','MarkerSize',12)
plot(ctrs1(:,1),ctrs1(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs1(:,1),ctrs1(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)
title('K-means for C_i (7) and C_i (8) with 5 Clusters');
xlabel('C_i (8)');
ylabel('C_i (7)');
%**************************************************************************



%********** KMEANS √…¡ ‘œ’” C(7) KAI C(8) ‘œ’ ÿ«÷…œ’ "6" ******************
subplot(2,2,4); hold on; box on;
opts2 = statset('Display','final');
[idx2,ctrs2] = kmeans(X2,5,'distance','sqEuclidean',...
    'onlinephase','off','Replicates',10,'start','sample','Options',opts2);               
plot(X2(idx2==1,1),X2(idx2==1,2),'r.','MarkerSize',12)
plot(X2(idx2==2,1),X2(idx2==2,2),'b.','MarkerSize',12)
plot(X2(idx2==3,1),X2(idx2==3,2),'m.','MarkerSize',12)
plot(X2(idx2==4,1),X2(idx2==4,2),'g.','MarkerSize',12)
plot(X2(idx2==5,1),X2(idx2==5,2),'c.','MarkerSize',12)
plot(ctrs2(:,1),ctrs2(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs2(:,1),ctrs2(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)
title('K-means for C_i (7) and C_i (8) with 5 Clusters');
xlabel('C_i (8)');
ylabel('C_i (7)');
%**************************************************************************






