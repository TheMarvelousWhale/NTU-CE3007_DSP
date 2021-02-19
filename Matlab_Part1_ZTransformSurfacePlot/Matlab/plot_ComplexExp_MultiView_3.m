% Program P1_2
% Generation of a complex exponential sequence in 3 views

% Figure 1 shows the real and imaginary part vs time individually
% Figure 2 shows the complex exponential (polar) illustration in 2D,
% Figure 3 shows the complex exponential (polar) illustration vs time as
% the 3rd axis

% Author: Chng Eng Siong
% NTU, Singapore, for DSP CE3007
% Feb 2014

clear all;
close all;

%w = pi/4;
wV = 0;
w = wV*pi;
A = 1.2;
z = A*exp(j*w);
realZ = real(z);
imagZ = imag(z);

titleStr = sprintf('z=%.2f e^{-j%.2f pi n}', A, wV);



% smooth version
i = 1;
for (n=-10:1:50)
 x(i) =  z^(-n);
 idx(i) = n;
 i=i+1;
end


% smooth version
i = 1;
for (n=-10:0.1:50)
 x10(i) =  z^(-n);
 idx10(i) = n;
 i=i+1;
end


figure(1);
pRe = subplot(2,1,1); hold on;
stem(idx,real(x));
plot(idx,abs(x),'r');
plot(idx,-abs(x),'r');
%axis([-10 50 -200 200])
axis([-10 50 -3.5 3.5])


xlabel('Time index n');ylabel('Amplitude');
titleStr = ['Real Part ' titleStr];
title(titleStr);
pIm = subplot(2,1,2); hold on;
stem(idx,imag(x));
plot(idx,abs(x),'r');
plot(idx,-abs(x),'r');


xlabel('Time index n');ylabel('Amplitude');
title('Imaginary part');
p1=[ 84   346   380   311];
set(0, 'DefaultFigurePosition', p1)


% showing the polar coordinate of the expoential,
% a decaying phasor as n-> infinity
figure(2)
%pP = polar(angle(x),abs(x)); showing the crude points
pP = polar(angle(x10),abs(x10)); hold on;  % showing the smooth version
title('Fig 2: the complex exponetial evolving in 2D');
xlabel('real');
ylabel('imag');
p2=[490   348   380   311];
set(0, 'DefaultFigurePosition', p2)


figure(3);
%h=plot3( real(x), idx, imag(x));  % the complex exponential
h=plot3( real(x10), idx10, imag(x10));  % the complex exponential
text(1.1,0,0,'real axis');
text(0.1,0,1,'imag axis');
p3=[ 893   348   380   311];
set(0, 'DefaultFigurePosition', p3)


hold on;
% the time axis, coming towards the viewer
h = plot3( zeros(length(x)), idx, zeros(length(x)),'k');

% the x-axis (real part) axis
xline  =[-1:0.01:1];
h = plot3( xline, zeros(length(xline)),zeros(length(xline)));
% the y-axis (imag part) axis
yline  =[-1:0.01:1];
h = plot3( zeros(length(yline)), zeros(length(yline)),yline);


title('Fig 3: the complex exponetial evolving wrt time');
xlabel('real');
ylabel('time (n)');
zlabel('imag ');
view([40 -18]);



