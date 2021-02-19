% plotting variour  r^{n}
close all; clear all
n = -20:20;
r=[ 1 1.1 1.2 1.3];
titleStr = sprintf('%0.1f^{(-n)},',r);
figure(1); hold on;
title(titleStr);
colormap = ['rgbk'];
for (i=1:length(r))
    plot(n,r(i).^(-n),colormap(i));
end
hold on;
xlabel('n');
ylabel('r^{(-n)}');
axis([-20 20 0 10]);

n = -10:30;
r=[ 0.7 0.8 0.9 1.0 ];
titleStr = sprintf('%0.1f^{(-n)},',r);
figure(2); hold on;
title(titleStr);
colormap = ['rgbk'];
for (i=1:length(r))
    plot(n,r(i).^(-n),colormap(i));
end
hold on;
xlabel('n');
ylabel('r^{(-n)}');
axis([-10 30 0 10]);
