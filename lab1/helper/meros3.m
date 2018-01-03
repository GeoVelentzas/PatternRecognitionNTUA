%*********** clear all and get screensize *********************************
clear all; close all;
scrsz = get(0,'ScreenSize');
%**************************************************************************



%************ Compute Averages... could use cells instead... ***************
[M1(1,:) M2(1,:) M3(1,:) M4(1,:) M5(1,:) M6(1,:) M7(1,:) M8(1,:) M9(1,:)] = AverageC(2);
[M1(2,:) M2(2,:) M3(2,:) M4(2,:) M5(2,:) M6(2,:) M7(2,:) M8(2,:) M9(2,:)] = AverageC(12);
%**************************************************************************



%********* visualize averages for 2nd and 12th coefficient ***************8
figure; hold on; box on;
plot(M1(1,:),M1(2,:),'b*');
plot(M2(1,:),M2(2,:),'go');
plot(M3(1,:),M3(2,:),'rx');
plot(M4(1,:),M4(2,:),'bd');
plot(M5(1,:),M5(2,:),'r+');
plot(M6(1,:),M6(2,:),'ch');
plot(M7(1,:),M7(2,:),'k^');
plot(M8(1,:),M8(2,:),'m>');
plot(M9(1,:),M9(2,:),'r*');

plot(sum(M1(1,:)/length(M1(1,:))),sum(M1(2,:)/length(M1(2,:))),'b*','MarkerFaceColor','b','MarkerSize',15);
plot(sum(M2(1,:)/length(M2(1,:))),sum(M2(2,:)/length(M2(2,:))),'go','MarkerFaceColor','g','MarkerSize',15);
plot(sum(M3(1,:)/length(M3(1,:))),sum(M3(2,:)/length(M3(2,:))),'rx','MarkerFaceColor','r','MarkerSize',15);
plot(sum(M4(1,:)/length(M4(1,:))),sum(M4(2,:)/length(M4(2,:))),'bd','MarkerFaceColor','b','MarkerSize',15);    
plot(sum(M5(1,:)/length(M5(1,:))),sum(M5(2,:)/length(M5(2,:))),'r+','MarkerFaceColor','r','MarkerSize',15);    
plot(sum(M6(1,:)/length(M6(1,:))),sum(M6(2,:)/length(M6(2,:))),'ch','MarkerFaceColor','c','MarkerSize',15);   
plot(sum(M7(1,:)/length(M7(1,:))),sum(M7(2,:)/length(M7(2,:))),'k^','MarkerFaceColor','k','MarkerSize',15);    
plot(sum(M8(1,:)/length(M8(1,:))),sum(M8(2,:)/length(M8(2,:))),'m>','MarkerFaceColor','m','MarkerSize',15);    
plot(sum(M9(1,:)/length(M9(1,:))),sum(M9(2,:)/length(M9(2,:))),'r*','MarkerFaceColor','r','MarkerSize',15);
legend('1','2','3','4','5','6','7','8','9');
xlabel('C(2)');
ylabel('C(12)');
%**************************************************************************

















    