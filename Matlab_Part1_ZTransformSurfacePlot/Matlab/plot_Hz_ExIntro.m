% Lets plot H(z) = \frac{z}{z-0.5}
% We see that its a surface !

close all; clear all
% y[n] = x[n] + x[n-1] + 1/3x[n-1]
% H(z) = (z+1)/(z-1/3);

[x,y]=meshgrid(-2.2:0.05:2.2);
% The actual complex values
zzz = x + j*y;

% Define the z-transform by its poles and zeros...
% One real pole
close all;
figure(1);

nn =[1 1];  zz=roots(nn);
dd = [1 -1/3]; pp=roots(dd);

if (isempty(zz) == 1)
  zz = [0];
end

if (isempty(pp) == 1)
  pp = [0];
end



% Evaluate the numerator and denominator at every grid point
numv = polyval(nn,zzz);
denv = polyval(dd,zzz);

% .. so the Z-transform is the ratio of the two
gg = numv ./ denv;

% Plot the surface
subplot(111)
% Note: vertical axis in dB (log scale) so zeros go to -Inf
surfl(x, y, 10*log10(abs(gg).^2))
shading interp
colormap(gray)
axis([-2 2 -2 2 -30 30])




hold on
% Add the unit circle
% Define the values of z around the unit circle
ww = exp(j*[0:100]*2*pi/100);
% Evaluate the ZT function on the unit circle
gw = polyval(nn,ww)./polyval(dd,ww);
% Plot a red line just above the surface around the unit circle
plot3(real(ww), imag(ww), 20*log10(abs(gw)),'r-+')
title('Surface of H(z)(dB) H(z) = (z+1)/(z-1/3)');

% Add similar lines just above the surface for the Re and Im axes
uu = x(1,:);
gx = polyval(nn,uu)./polyval(dd,uu);
gy = polyval(nn,j*uu)./polyval(dd,j*uu);
plot3(uu, 0*uu, 20*log10(abs(gx)), 'b');
plot3(uu*0, uu, 20*log10(abs(gy)), 'b');

% Plot a 'flat' z-plane at height -30: axes and unit circle
plot3(uu*0, uu, -30*ones(1,length(uu)), 'k');
plot3(uu, 0*uu, -30*ones(1,length(uu)), 'k');
plot3(real(ww), imag(ww), -30*ones(1,length(ww)),'k')

% Add the actual poles and zeros on the 2D zplane
plot3(real(zz), imag(zz), [-30].*ones(length(real(zz))), 'ob')
plot3(real(pp), imag(pp), [-30].*ones(length(real(pp))), 'xr')
xlabel('real axis');
ylabel('imaginary axis');
% Now try spinning it in 3D to get a sense of the surface...
axis vis3d





% to plot power spectrum
figure(2);
w1=0:2*pi/511:2*pi;
Hresp = (abs(fft(nn,512))./abs(fft(dd,512)));
plot(w1./pi,10*log10(Hresp.^2));
xlabel('frequency radian: 0..2\pi'); ylabel('10*log10(abs(magnitude)^2))');
title('X(e^{j\omega)');
grid on;

