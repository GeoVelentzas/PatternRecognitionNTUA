function [ C ] = MFCC( signal )
%takes as input a signal and outputs matrix C wher each row is 
%the dct transform of the logarithm of the enrergy of filtered 
%window a mel filter. The interval of each window is 25ms and the
%intersection is 10ms. From this matrix we keep the first 13 coefficients


% read the pronouncing of a digint and preprocess for computing the basic parameters
[x,Fs] = wavread(signal); 
x1 = filter([1  +0.97],[1 0],x);        %proemphasis
Ts = 1/Fs;                              %sampling period
l = length(x1);                         %length of time vector
t = 0.025;                              %length of each window (sec)
t_over = 0.010;                         %intersection length of windows (sec)
t_step = t-t_over;                      %timestep from window to window
w = round(t/Ts)+1;                      %size of each window in samples
step = round(t_step/Ts);                %size of step in samples
h = hamming(w);                         %hamming window


% windowing with hamming
k=0;                                    %we create a matrix
for i=1:step:l-w                        %xs1 where each row
    k=k+1;                              %contains a time window
    xs1(k,:)= h.*x1(i:i+w-1);           %multiplied with hamming
end                                     %The number of the windows is
now = k;                                %stored in now (number of windows)


% Create a sequence of mel filters 
max = 2595*(log10(1+Fs/1400));          %compute maximum frequency in mel space (Fs/2 in linear)
m = linspace(0,max,26);                 %compute central frequencies of each filter in mel space
f = 700*(10.^(m/2595)-1);               %central frequencies in linear space
f_lin = f(2:25);                        %keep the needed filters... discard 0 and Fs/2 centered
spec = 2^nextpow2(w);                   %compute number of points for fft
f_spec = round(((spec/2)*f_lin)/(Fs/2));%computer vector of frequencies in fft
H = melfilt(f_spec,spec);               %function melfilt will create mel filters
                                        

% Compute E,G,C and FFTs of windows                                        
E = energy(xs1,H,spec,now);             
G = log10(E(:,:));                      
C = (dct(G(:,:)'))';                    %dct
C = C(:,1:13);                          %keep tht first 13 coefficients


end



