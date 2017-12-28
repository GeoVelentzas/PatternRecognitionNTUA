function [ M1_n M2_n M3_n M4_n M5_n M6_n M7_n M8_n M9_n] = AverageC( n )
%Σ'αυτη τη συναρτηση δεχομαστε ως ορισμα την τιμη n και υπολογιζουμε τους
%μεσους ορους των συντελεστων C(n) για καθε εκφωνηση και καθε ψηφιο
%ξεχωριστα. Τα αποτελεσματα εξαγονται στα arrays Μi_n οπου το k στοιχειο
%του Mi_n περιεχει το μεσο ορο των C(n) συντελεστων της k-εκφωνησης του
%i-ψηφιου.

C1_1 = MFCC('one1.wav');    C1_2 = MFCC('one2.wav');    C1_3 = MFCC('one3.wav');    C1_4 = MFCC('one4.wav');
C1_5 = MFCC('one5.wav');    C1_6 = MFCC('one6.wav');    C1_7 = MFCC('one7.wav');    C1_8 = MFCC('one8.wav');
C1_9 = MFCC('one9.wav');    C1_10 = MFCC('one10.wav');  C1_11 = MFCC('one11.wav');  C1_12 = MFCC('one12.wav');
C1_13 = MFCC('one13.wav');  C1_14 = MFCC('one14.wav');  C1_15 = MFCC('one15.wav');
M1_n(1) = sum(C1_1(:,n+1))/size(C1_1,1); % ο Μ1_n θα ειναι πινακας γραμμη
M1_n(2) = sum(C1_2(:,n+1))/size(C1_2,1);
M1_n(3) = sum(C1_3(:,n+1))/size(C1_3,1);
M1_n(4) = sum(C1_4(:,n+1))/size(C1_4,1);
M1_n(5) = sum(C1_5(:,n+1))/size(C1_5,1);
M1_n(6) = sum(C1_6(:,n+1))/size(C1_6,1);
M1_n(7) = sum(C1_7(:,n+1))/size(C1_7,1);
M1_n(8) = sum(C1_8(:,n+1))/size(C1_8,1);
M1_n(9) = sum(C1_9(:,n+1))/size(C1_9,1);
M1_n(10) = sum(C1_10(:,n+1))/size(C1_10,1);
M1_n(11) = sum(C1_11(:,n+1))/size(C1_11,1);
M1_n(12) = sum(C1_12(:,n+1))/size(C1_12,1);
M1_n(13) = sum(C1_13(:,n+1))/size(C1_13,1);
M1_n(14) = sum(C1_14(:,n+1))/size(C1_14,1);
M1_n(15) = sum(C1_15(:,n+1))/size(C1_15,1);



C2_1 = MFCC('two1.wav');    C2_2 = MFCC('two2.wav');    C2_3 = MFCC('two3.wav');    C2_4 = MFCC('two4.wav');
C2_5 = MFCC('two5.wav');    C2_6 = MFCC('two6.wav');    C2_7 = MFCC('two7.wav');    C2_8 = MFCC('two8.wav');
C2_9 = MFCC('two9.wav');    C2_10 = MFCC('two10.wav');  C2_11 = MFCC('two11.wav');  C2_12 = MFCC('two12.wav');
C2_13 = MFCC('two13.wav');  C2_14 = MFCC('two14.wav');  C2_15 = MFCC('two15.wav');
M2_n(1) = sum(C2_1(:,n+1))/size(C2_1,1);
M2_n(2) = sum(C2_2(:,n+1))/size(C2_2,1);
M2_n(3) = sum(C2_3(:,n+1))/size(C2_3,1);
M2_n(4) = sum(C2_4(:,n+1))/size(C2_4,1);
M2_n(5) = sum(C2_5(:,n+1))/size(C2_5,1);
M2_n(6) = sum(C2_6(:,n+1))/size(C2_6,1);
M2_n(7) = sum(C2_7(:,n+1))/size(C2_7,1);
M2_n(8) = sum(C2_8(:,n+1))/size(C2_8,1);
M2_n(9) = sum(C2_9(:,n+1))/size(C2_9,1);
M2_n(10) = sum(C2_10(:,n+1))/size(C2_10,1);
M2_n(11) = sum(C2_11(:,n+1))/size(C2_11,1);
M2_n(12) = sum(C2_12(:,n+1))/size(C2_12,1);
M2_n(13) = sum(C2_13(:,n+1))/size(C2_13,1);
M2_n(14) = sum(C2_14(:,n+1))/size(C2_14,1);
M2_n(15) = sum(C2_15(:,n+1))/size(C2_15,1);



C3_1 = MFCC('three1.wav');C3_2 = MFCC('three2.wav');C3_3 = MFCC('three3.wav');C3_4 = MFCC('three4.wav');
C3_5 = MFCC('three5.wav');C3_6 = MFCC('three6.wav');C3_7 = MFCC('three7.wav');C3_8 = MFCC('three8.wav');
C3_9 = MFCC('three9.wav');C3_10 = MFCC('three10.wav');C3_11 = MFCC('three11.wav');C3_12 = MFCC('three12.wav');
C3_13 = MFCC('three13.wav');C3_14 = MFCC('three14.wav');C3_15 = MFCC('three15.wav');
M3_n(1) = sum(C3_1(:,n+1))/size(C3_1,1);
M3_n(2) = sum(C3_2(:,n+1))/size(C3_2,1);
M3_n(3) = sum(C3_3(:,n+1))/size(C3_3,1);
M3_n(4) = sum(C3_4(:,n+1))/size(C3_4,1);
M3_n(5) = sum(C3_5(:,n+1))/size(C3_5,1);
M3_n(6) = sum(C3_6(:,n+1))/size(C3_6,1);
M3_n(7) = sum(C3_7(:,n+1))/size(C3_7,1);
M3_n(8) = sum(C3_8(:,n+1))/size(C3_8,1);
M3_n(9) = sum(C3_9(:,n+1))/size(C3_9,1);
M3_n(10) = sum(C3_10(:,n+1))/size(C3_10,1);
M3_n(11) = sum(C3_11(:,n+1))/size(C3_11,1);
M3_n(12) = sum(C3_12(:,n+1))/size(C3_12,1);
M3_n(13) = sum(C3_13(:,n+1))/size(C3_13,1);
M3_n(14) = sum(C3_14(:,n+1))/size(C3_14,1);
M3_n(15) = sum(C3_15(:,n+1))/size(C3_15,1);


C4_1 = MFCC('four1.wav');C4_2 = MFCC('four2.wav');C4_3 = MFCC('four3.wav');C4_4 = MFCC('four4.wav');
C4_5 = MFCC('four5.wav');C4_6 = MFCC('four6.wav');C4_7 = MFCC('four7.wav');C4_8 = MFCC('four8.wav');
C4_9 = MFCC('four9.wav');C4_10 = MFCC('four10.wav');C4_11 = MFCC('four11.wav');C4_12 = MFCC('four12.wav');
C4_13 = MFCC('four13.wav');C4_14 = MFCC('four14.wav');C4_15 = MFCC('four15.wav');
M4_n(1) = sum(C4_1(:,n+1))/size(C4_1,1);
M4_n(2) = sum(C4_2(:,n+1))/size(C4_2,1);
M4_n(3) = sum(C4_3(:,n+1))/size(C4_3,1);
M4_n(4) = sum(C4_4(:,n+1))/size(C4_4,1);
M4_n(5) = sum(C4_5(:,n+1))/size(C4_5,1);
M4_n(6) = sum(C4_6(:,n+1))/size(C4_6,1);
M4_n(7) = sum(C4_7(:,n+1))/size(C4_7,1);
M4_n(8) = sum(C4_8(:,n+1))/size(C4_8,1);
M4_n(9) = sum(C4_9(:,n+1))/size(C4_9,1);
M4_n(10) = sum(C4_10(:,n+1))/size(C4_10,1);
M4_n(11) = sum(C4_11(:,n+1))/size(C4_11,1);
M4_n(12) = sum(C4_12(:,n+1))/size(C4_12,1);
M4_n(13) = sum(C4_13(:,n+1))/size(C4_13,1);
M4_n(14) = sum(C4_14(:,n+1))/size(C4_14,1);
M4_n(15) = sum(C4_15(:,n+1))/size(C4_15,1);


C5_1 = MFCC('five1.wav');C5_2 = MFCC('five2.wav');C5_3 = MFCC('five3.wav');C5_4 = MFCC('five4.wav');
C5_5 = MFCC('five5.wav');C5_6 = MFCC('five6.wav'); C5_7 = MFCC('five7.wav');C5_8 = MFCC('five8.wav');
C5_9 = MFCC('five9.wav');C5_10 = MFCC('five10.wav');C5_11 = MFCC('five11.wav');C5_12 = MFCC('five12.wav');
C5_13 = MFCC('five13.wav');C5_14 = MFCC('five14.wav');C5_15 = MFCC('five15.wav');    
M5_n(1) = sum(C5_1(:,n+1))/size(C5_1,1);
M5_n(2) = sum(C5_2(:,n+1))/size(C5_2,1);
M5_n(3) = sum(C5_3(:,n+1))/size(C5_3,1);
M5_n(4) = sum(C5_4(:,n+1))/size(C5_4,1);
M5_n(5) = sum(C5_5(:,n+1))/size(C5_5,1);
M5_n(6) = sum(C5_6(:,n+1))/size(C5_6,1);
M5_n(7) = sum(C5_7(:,n+1))/size(C5_7,1);
M5_n(8) = sum(C5_8(:,n+1))/size(C5_8,1);
M5_n(9) = sum(C5_9(:,n+1))/size(C5_9,1);
M5_n(10) = sum(C5_10(:,n+1))/size(C5_10,1);
M5_n(11) = sum(C5_11(:,n+1))/size(C5_11,1);
M5_n(12) = sum(C5_12(:,n+1))/size(C5_12,1);
M5_n(13) = sum(C5_13(:,n+1))/size(C5_13,1);
M5_n(14) = sum(C5_14(:,n+1))/size(C5_14,1);
M5_n(15) = sum(C5_15(:,n+1))/size(C5_15,1);
  
C6_1 = MFCC('six1.wav');C6_2 = MFCC('six2.wav');C6_3 = MFCC('six3.wav');C6_4 = MFCC('six4.wav');
C6_5 = MFCC('six5.wav');C6_6 = MFCC('six6.wav');C6_7 = MFCC('six7.wav');C6_8 = MFCC('six8.wav');
C6_9 = MFCC('six9.wav');C6_10 = MFCC('six10.wav');C6_11 = MFCC('six11.wav'); 
C6_13 = MFCC('six13.wav');C6_14 = MFCC('six14.wav');C6_15 = MFCC('six15.wav');        
M6_n(1) = sum(C6_1(:,n+1))/size(C6_1,1);
M6_n(2) = sum(C6_2(:,n+1))/size(C6_2,1);
M6_n(3) = sum(C6_3(:,n+1))/size(C6_3,1);
M6_n(4) = sum(C6_4(:,n+1))/size(C6_4,1);
M6_n(5) = sum(C6_5(:,n+1))/size(C6_5,1);
M6_n(6) = sum(C6_6(:,n+1))/size(C6_6,1);
M6_n(7) = sum(C6_7(:,n+1))/size(C6_7,1);
M6_n(8) = sum(C6_8(:,n+1))/size(C6_8,1);
M6_n(9) = sum(C6_9(:,n+1))/size(C6_9,1);
M6_n(10) = sum(C6_10(:,n+1))/size(C6_10,1);
M6_n(11) = sum(C6_11(:,n+1))/size(C6_11,1);
%M6_n(11) = sum(C6_12(:,n+1))/size(C6_12,1);
M6_n(12) = sum(C6_13(:,n+1))/size(C6_13,1);
M6_n(13) = sum(C6_14(:,n+1))/size(C6_14,1);
M6_n(14) = sum(C6_15(:,n+1))/size(C6_15,1);

C7_1 = MFCC('seven1.wav');C7_2 = MFCC('seven2.wav');C7_3 = MFCC('seven3.wav');C7_4 = MFCC('seven4.wav');
C7_5 = MFCC('seven5.wav');C7_6 = MFCC('seven6.wav');C7_7 = MFCC('seven7.wav');C7_8 = MFCC('seven8.wav');
C7_9 = MFCC('seven9.wav');C7_10 = MFCC('seven10.wav');C7_11 = MFCC('seven11.wav');C7_12 = MFCC('seven12.wav');
C7_13 = MFCC('seven13.wav');C7_14 = MFCC('seven14.wav');C7_15 = MFCC('seven15.wav');
M7_n(1) = sum(C7_1(:,n+1))/size(C7_1,1);
M7_n(2) = sum(C7_2(:,n+1))/size(C7_2,1);
M7_n(3) = sum(C7_3(:,n+1))/size(C7_3,1);
M7_n(4) = sum(C7_4(:,n+1))/size(C7_4,1);
M7_n(5) = sum(C7_5(:,n+1))/size(C7_5,1);
M7_n(6) = sum(C7_6(:,n+1))/size(C7_6,1);
M7_n(7) = sum(C7_7(:,n+1))/size(C7_7,1);
M7_n(8) = sum(C7_8(:,n+1))/size(C7_8,1);
M7_n(9) = sum(C7_9(:,n+1))/size(C7_9,1);
M7_n(10) = sum(C7_10(:,n+1))/size(C7_10,1);
M7_n(11) = sum(C7_11(:,n+1))/size(C7_11,1);
M7_n(12) = sum(C7_12(:,n+1))/size(C7_12,1);
M7_n(13) = sum(C7_13(:,n+1))/size(C7_13,1);
M7_n(14) = sum(C7_14(:,n+1))/size(C7_14,1);
M7_n(15) = sum(C7_15(:,n+1))/size(C7_15,1);

C8_1 = MFCC('eight1.wav');C8_2 = MFCC('eight2.wav');C8_3 = MFCC('eight3.wav');C8_4 = MFCC('eight4.wav');
C8_5 = MFCC('eight5.wav');C8_6 = MFCC('eight6.wav');                          C8_8 = MFCC('eight8.wav');
C8_9 = MFCC('eight9.wav');C8_10 = MFCC('eight10.wav');C8_11 = MFCC('eight11.wav');C8_12 = MFCC('eight12.wav');
C8_13 = MFCC('eight13.wav');C8_14 = MFCC('eight14.wav');C8_15 = MFCC('eight15.wav');
M8_n(1) = sum(C8_1(:,n+1))/size(C8_1,1);
M8_n(2) = sum(C8_2(:,n+1))/size(C8_2,1);
M8_n(3) = sum(C8_3(:,n+1))/size(C8_3,1);
M8_n(4) = sum(C8_4(:,n+1))/size(C8_4,1);
M8_n(5) = sum(C8_5(:,n+1))/size(C8_5,1);
M8_n(6) = sum(C8_6(:,n+1))/size(C8_6,1);
%M8_n(7) = sum(C8_7(:,n+1))/size(C8_7,1);
M8_n(7) = sum(C8_8(:,n+1))/size(C8_8,1);
M8_n(8) = sum(C8_9(:,n+1))/size(C8_9,1);
M8_n(9) = sum(C8_10(:,n+1))/size(C8_10,1);
M8_n(10) = sum(C8_11(:,n+1))/size(C8_11,1);
M8_n(11) = sum(C8_12(:,n+1))/size(C8_12,1);
M8_n(12) = sum(C8_13(:,n+1))/size(C8_13,1);
M8_n(13) = sum(C8_14(:,n+1))/size(C8_14,1);
M8_n(14) = sum(C8_15(:,n+1))/size(C8_15,1);


C9_1 = MFCC('nine1.wav');C9_2 = MFCC('nine2.wav');C9_3 = MFCC('nine3.wav');C9_4 = MFCC('nine4.wav');
C9_5 = MFCC('nine5.wav');C9_6 = MFCC('nine6.wav');C9_7 = MFCC('nine7.wav');C9_8 = MFCC('nine8.wav');
C9_9 = MFCC('nine9.wav');C9_10 = MFCC('nine10.wav');C9_11 = MFCC('nine11.wav');C9_12 = MFCC('nine12.wav');
C9_13 = MFCC('nine13.wav');C9_14 = MFCC('nine14.wav');C9_15 = MFCC('nine15.wav');
M9_n(1) = sum(C9_1(:,n+1))/size(C9_1,1);
M9_n(2) = sum(C9_2(:,n+1))/size(C9_2,1);
M9_n(3) = sum(C9_3(:,n+1))/size(C9_3,1);
M9_n(4) = sum(C9_4(:,n+1))/size(C9_4,1);
M9_n(5) = sum(C9_5(:,n+1))/size(C9_5,1);
M9_n(6) = sum(C9_6(:,n+1))/size(C9_6,1);
M9_n(7) = sum(C9_7(:,n+1))/size(C9_7,1);
M9_n(8) = sum(C9_8(:,n+1))/size(C9_8,1);
M9_n(9) = sum(C9_9(:,n+1))/size(C9_9,1);
M9_n(10) = sum(C9_10(:,n+1))/size(C9_10,1);
M9_n(11) = sum(C9_11(:,n+1))/size(C9_11,1);
M9_n(12) = sum(C9_12(:,n+1))/size(C9_12,1);
M9_n(13) = sum(C9_13(:,n+1))/size(C9_13,1);
M9_n(14) = sum(C9_14(:,n+1))/size(C9_14,1);
M9_n(15) = sum(C9_15(:,n+1))/size(C9_15,1);





end

