function [ H ] = melfilt( f_spec ,spec )
%Dimiourgia systixias trigvnikwn filtrwn pou isapexoun ston xwro mel
%kai einai isa se plithos me to periexomeno twn kentrikwn syxnothtwn
%tis f_spec. To spec dilwnei to plithos twn simeiwn sto xwro fourier

N = length(f_spec);
H = zeros(N,spec);
H(1,1:f_spec(1)) = linspace(0,1,f_spec(1));
H(1,f_spec(1):f_spec(2)) = linspace(1,0,1+f_spec(2)-f_spec(1));
H(1,:) = [H(1,1:spec/2) H(1,spec/2:-1:1)];

for i=2:N-1
    H(i,f_spec(i-1):f_spec(i)) = linspace(0,1,1+f_spec(i)-f_spec(i-1));
    H(i,f_spec(i):f_spec(i+1)) = linspace(1,0,1+f_spec(i+1)-f_spec(i));
    H(i,:) = [H(i,1:spec/2) H(i,spec/2:-1:1)];
end

H(N,f_spec(N-1):f_spec(N)) = linspace(0,1,1+f_spec(N)-f_spec(N-1));
H(N,f_spec(N):(spec/2)) = linspace(1,0,1+(spec/2)-f_spec(N));
H(N,:) = [H(N,1:spec/2) H(N,spec/2:-1:1)];