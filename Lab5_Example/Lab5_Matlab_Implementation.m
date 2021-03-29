% design a low pass filter
close all;
clear all;

% Question: Q5

% Designing the FIR filter directly by inverse Fourier Transform!
N = 31;
w_c = 2*pi*2.5/10; %2*pi*f/Fs???;   % how to calculate the normalized cut-off frequeny given the sampling rate at 10Khz and the stop-band at 2.5Khz?
n_range = -15:1:15;
midX = length(n_range)/2;
for (n=1:length(n_range))
  h(n) = sin(w_c*n_range(n))/(pi*n_range(n)); %??? For non-sero n
end

h(1+((length(n_range)-1)/2)) = w_c/pi;
plot(h,'+-');

% Question: Q5(1)
h2 = h./sum(h); %???   % h2 is a normalized version of h
fvtool(h2,1); % examine using magnitude response at y-axis (not dB or magnitude^2)?


% Question: Q5 (2)
% Lets study the performance of the designed filter,
% does it satisfy criteria? passband ripple < 0.1, stopband attenuation <
% 0.01?
fvtool(h,1);


% Question: Q5 (3)
% Using Matab's function fir1 to design, fill in the ???
%B_ham = fir1(???,???, hamming(???),'noscale')
B_ham = fir1(N-1,w_c/pi, hamming(N),'noscale');
fvtool(B_ham,1);

 