%Q1 to calculate DTFS we calculate FFT/N 
%X1 = [0,0,1,2,3,0,0,0]
%N1 = 8
%x_fft1 = fft(X1,N1)/N1
%figure(1);
%subplot(211)
%stem(abs(x_fft1*2*pi ))
%subplot(212)
%stem(angle(x_fft1 ))

%Q2 Inverse DFT
X2 = zeros([1,256])
X2(0+1) = 640
X2(16+1) = 256*exp(j*pi/4)
X2(240+1) = 256*exp(-j*pi/4)
x2 = ifft(X2)
%x2(0+1:5+1);

% ii) small omega = k * 2pi/N
%     big omega = k * 2pi/N * Fs 

% iii) use synthesis equation, form the close form of x[n], which is
% x[n] = 2.5+cos(2pi1/16n t+pi/3)
% hence x(t) = 2.5 + cos(1000pi t + pi/3) given Fs = 8k

 %x3 = [1,2,3,4] h[n] = [1,1]
 %N3 = 3  %and 5 6 7
 %x3 = ifft(fft([2,3,4,5],N3).*fft([1,1],N3))

% minimum is 5

% results are wrong due to truncation. => N-1 polynomials are defined by N
% points. You use any less will have error in approximation