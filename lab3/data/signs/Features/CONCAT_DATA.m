clear all; clc;
load('DATA_2nd_signer')
DATA2= DATA;
clear DATA
load('DATA1')
DATA1 = DATA;


for i = 15:30
    DATA{i} = [DATA1{i} DATA2{i-14}];
end

clear DATA1 DATA2 i

save('DATA_ALL')