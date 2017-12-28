function [ C_all , I ] = read_all_speakers( d )
%Σ'αυτη τη συναρτηση περναμε σε εναν πινακα με 13 στηλες τους MFCC
%συντελεστες για καθε χρονικο παραθυρο του καθε ολμιλητη και στο array Ι
%τις γραμμες του C_all για τις οποιες εχουμε αλλαγη εκφωνητη. Σαν ορισμα
%δεχομαστε την τιμη d απο 1-9 που αντιστοιχει στο ψηφιο του οποιου τις
%εκφωνησεις θελουμε να διαβασουμε.

if d==1
    C1 = MFCC('one1.wav');
    C2 = MFCC('one2.wav');
    C3 = MFCC('one3.wav');
    C4 = MFCC('one4.wav');
    C5 = MFCC('one5.wav');
    C6 = MFCC('one6.wav');
    C7 = MFCC('one7.wav');
    C8 = MFCC('one8.wav');
    C9 = MFCC('one9.wav');
    C10 = MFCC('one10.wav');
    C11 = MFCC('one11.wav');
    C12 = MFCC('one12.wav');
    C13 = MFCC('one13.wav');
    C14 = MFCC('one14.wav');
    C15 = MFCC('one15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

if d==2
    C1 = MFCC('two1.wav');
    C2 = MFCC('two2.wav');
    C3 = MFCC('two3.wav');
    C4 = MFCC('two4.wav');
    C5 = MFCC('two5.wav');
    C6 = MFCC('two6.wav');
    C7 = MFCC('two7.wav');
    C8 = MFCC('two8.wav');
    C9 = MFCC('two9.wav');
    C10 = MFCC('two10.wav');
    C11 = MFCC('two11.wav');
    C12 = MFCC('two12.wav');
    C13 = MFCC('two13.wav');
    C14 = MFCC('two14.wav');
    C15 = MFCC('two15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

if d==3
    C1 = MFCC('three1.wav');
    C2 = MFCC('three2.wav');
    C3 = MFCC('three3.wav');
    C4 = MFCC('three4.wav');
    C5 = MFCC('three5.wav');
    C6 = MFCC('three6.wav');
    C7 = MFCC('three7.wav');
    C8 = MFCC('three8.wav');
    C9 = MFCC('three9.wav');
    C10 = MFCC('three10.wav');
    C11 = MFCC('three11.wav');
    C12 = MFCC('three12.wav');
    C13 = MFCC('three13.wav');
    C14 = MFCC('three14.wav');
    C15 = MFCC('three15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

if d==4
    C1 = MFCC('four1.wav');
    C2 = MFCC('four2.wav');
    C3 = MFCC('four3.wav');
    C4 = MFCC('four4.wav');
    C5 = MFCC('four5.wav');
    C6 = MFCC('four6.wav');
    C7 = MFCC('four7.wav');
    C8 = MFCC('four8.wav');
    C9 = MFCC('four9.wav');
    C10 = MFCC('four10.wav');
    C11 = MFCC('four11.wav');
    C12 = MFCC('four12.wav');
    C13 = MFCC('four13.wav');
    C14 = MFCC('four14.wav');
    C15 = MFCC('four15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

if d==5
    C1 = MFCC('five1.wav');
    C2 = MFCC('five2.wav');
    C3 = MFCC('five3.wav');
    C4 = MFCC('five4.wav');
    C5 = MFCC('five5.wav');
    C6 = MFCC('five6.wav');
    C7 = MFCC('five7.wav');
    C8 = MFCC('five8.wav');
    C9 = MFCC('five9.wav');
    C10 = MFCC('five10.wav');
    C11 = MFCC('five11.wav');
    C12 = MFCC('five12.wav');
    C13 = MFCC('five13.wav');
    C14 = MFCC('five14.wav');
    C15 = MFCC('five15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

    
if d==6
    C1 = MFCC('six1.wav');
    C2 = MFCC('six2.wav');
    C3 = MFCC('six3.wav');
    C4 = MFCC('six4.wav');
    C5 = MFCC('six5.wav');
    C6 = MFCC('six6.wav');
    C7 = MFCC('six7.wav');
    C8 = MFCC('six8.wav');
    C9 = MFCC('six9.wav');
    C10 = MFCC('six10.wav');
    C11 = MFCC('six11.wav');
    %C12 = MFCC('six12.wav');   %!
    C13 = MFCC('six13.wav');
    C14 = MFCC('six14.wav');
    C15 = MFCC('six15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C13,1)+I(11);
    I(13)=size(C14,1)+I(12);
    I(14)=size(C15,1)+I(13);
end

if d==7
    C1 = MFCC('seven1.wav');
    C2 = MFCC('seven2.wav');
    C3 = MFCC('seven3.wav');
    C4 = MFCC('seven4.wav');
    C5 = MFCC('seven5.wav');
    C6 = MFCC('seven6.wav');
    C7 = MFCC('seven7.wav');
    C8 = MFCC('seven8.wav');
    C9 = MFCC('seven9.wav');
    C10 = MFCC('seven10.wav');
    C11 = MFCC('seven11.wav');
    C12 = MFCC('seven12.wav');
    C13 = MFCC('seven13.wav');
    C14 = MFCC('seven14.wav');
    C15 = MFCC('seven15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

if d==8
    C1 = MFCC('eight1.wav');
    C2 = MFCC('eight2.wav');
    C3 = MFCC('eight3.wav');
    C4 = MFCC('eight4.wav');
    C5 = MFCC('eight5.wav');
    C6 = MFCC('eight6.wav');
    %C7 = MFCC('eight7.wav');   %!
    C8 = MFCC('eight8.wav');
    C9 = MFCC('eight9.wav');
    C10 = MFCC('eight10.wav');
    C11 = MFCC('eight11.wav');
    C12 = MFCC('eight12.wav');
    C13 = MFCC('eight13.wav');
    C14 = MFCC('eight14.wav');
    C15 = MFCC('eight15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C8,1)+I(6);  %!
    I(8)=size(C9,1)+I(7);
    I(9)=size(C10,1)+I(8);
    I(10)=size(C11,1)+I(9);
    I(11)=size(C12,1)+I(10);
    I(12)=size(C13,1)+I(11);
    I(13)=size(C14,1)+I(12);
    I(14)=size(C15,1)+I(13);
end
    
if d==9
    C1 = MFCC('nine1.wav');
    C2 = MFCC('nine2.wav');
    C3 = MFCC('nine3.wav');
    C4 = MFCC('nine4.wav');
    C5 = MFCC('nine5.wav');
    C6 = MFCC('nine6.wav');
    C7 = MFCC('nine7.wav');
    C8 = MFCC('nine8.wav');
    C9 = MFCC('nine9.wav');
    C10 = MFCC('nine10.wav');
    C11 = MFCC('nine11.wav');
    C12 = MFCC('nine12.wav');
    C13 = MFCC('nine13.wav');
    C14 = MFCC('nine14.wav');
    C15 = MFCC('nine15.wav');
    C_all = [C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;C11;C12;C13;C14;C15];
    I(1)=size(C1,1);
    I(2)=size(C2,1)+I(1);
    I(3)=size(C3,1)+I(2);
    I(4)=size(C4,1)+I(3);
    I(5)=size(C5,1)+I(4);
    I(6)=size(C6,1)+I(5);
    I(7)=size(C7,1)+I(6);
    I(8)=size(C8,1)+I(7);
    I(9)=size(C9,1)+I(8);
    I(10)=size(C10,1)+I(9);
    I(11)=size(C11,1)+I(10);
    I(12)=size(C12,1)+I(11);
    I(13)=size(C13,1)+I(12);
    I(14)=size(C14,1)+I(13);
    I(15)=size(C15,1)+I(14);
end

end
    
    
    
    
    
    
    
    
    
    
    