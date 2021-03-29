%  this is a Matlab routine to plot the surface.
%  Its much prettier than python's Matplotlib
%  plot_Hz_Matlab([1,1],[1, -1/3], [-3,3,0.01])
%

function  plot_Hz_Matlab(B,A, mesh_gridValues)
close all;
display('plotting surface defined by B,A coefficients');
B
A

xmin=mesh_gridValues(1);  xmax=mesh_gridValues(2);  xstep = mesh_gridValues(3);
zz=roots(B); 
if (isempty(zz) == 1)
  zz = [0];
end
display('Roots of B (numerator) = '); zz

pp=roots(A);
if (isempty(pp) == 1)
  pp = [0];
end
display('Roots of A (denominator) = '); pp

% Evaluate the numerator and denominator at every grid point
[x,y]=meshgrid(xmin:xstep:xmax);
cz = x + j*y;
numv = polyval(B,cz);
denv = polyval(A,cz);

% so the Z-transform is the ratio of the two
gg = numv ./ denv;

% Plot the surface
LogMagValues = 20*log10(abs(gg));
medianLogValue = median(median(LogMagValues));
% Note: vertical axis in dB (log scale) so zeros go to -Inf
figure(1);

surfl(x, y, 10*log10(abs(gg).^2));
hold on;
shading interp
colormap(gray)
zmin = medianLogValue-20;
if (zmin > -30)
    zmin = -30;
end
zmax = medianLogValue+20;
if (zmax < 20)
    zmax = 20;
end

title('Surface of H(z)(dB)');
% Add the unit circle
% Define the values of z around the unit circle
ww = exp(j*[0:100]*2*pi/100);
% Evaluate the ZT function on the unit circle
gw = polyval(B,ww)./polyval(A,ww);
% Plot a red line just above the surface around the unit circle
plot3(real(ww), imag(ww), 20*log10(abs(gw)),'r-+');
axis([xmin,xmax, xmin, xmax, zmin, zmax])
hold on

% Add similar lines just above the surface for the Re and Im axes
uu = x(1,:);
gx = polyval(B,uu)./polyval(A,uu);
gy = polyval(B,j*uu)./polyval(A,j*uu);
plot3(uu, 0*uu, 20*log10(abs(gx)), 'b');
plot3(uu*0, uu, 20*log10(abs(gy)), 'b');

% Plot a 'flat' z-plane at height -30: axes and unit circle
plot3(uu*0, uu, zmin*ones(1,length(uu)), 'k');
plot3(uu, 0*uu, zmin*ones(1,length(uu)), 'k');
plot3(real(ww), imag(ww), zmin*ones(1,length(ww)),'k')

% Add the actual poles and zeros on the 2D zplane
plot3(real(zz), imag(zz), [zmin].*ones(length(real(zz))), 'ob')
plot3(real(pp), imag(pp), [zmin].*ones(length(real(pp))), 'xr')
xlabel('real axis');
ylabel('imaginary axis');
% Now try spinning it in 3D to get a sense of the surface...
axis vis3d




% to plot power spectrum
figure(2);
display('Figure 2: shows the magnitude spectrum');
w1=0:2*pi/511:2*pi;
Hresp = (abs(fft(B,512))./abs(fft(A,512)));
plot(w1./pi,20*log10(Hresp));
xlabel('frequency radian: -\pi to \pi'); ylabel('20*log10(|magnitude|))');
title('Magnitude spectrum (dB)');
grid on;

