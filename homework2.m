clc;clear

n=0:1:1999;
x=0.001*cos(0.45*n*pi)+sin(0.3*n*pi)-cos(0.302*n*pi-pi/4);
%T=1000，所以N要取1000的整数倍才能不泄露


%先确定x(n)的1000点DFT
n1=0:1:999; %取1000个点
y1=x(1:1:1000);
subplot(2,2,1);
stem(n1,y1);
title('样本点 x(n), 0<=n<=999');
xlabel('n')
axis([0,1000,-2.5,2.5]);%限制x,y的坐标范围

Y1=fft(y1,1000);
magY1=abs(Y1(1:1:1000));
k1=0:1:999;
w1=2*pi/1000*k1;

%整体，验证是否只有六根非零谱线
subplot(2,2,2);
stem(k1,magY1);
title('样本点的DTFT的模');
xlabel('k1');
axis([0,1000,0,10]);%改x,y坐标轴的范围

%将左半部分非零谱线放大观察
subplot(2,2,4);
stem(k1,magY1);
title('样本点的DTFT的模(放大版)');
xlabel('k1');
axis([140,230,0,2]);%改x,y坐标轴的范围

% %填充90个零以获得较密的频谱
% n2=0:1:99;
% y2=[x(1:1:10),zeros(1,90)];%填充0
% subplot(3,2,3);
% stem(n2,y2);
% title('样本点 x(n), 0<=n<=9+ 90 zeros');
% xlabel('n')
% axis([0,100,-2.5,2.5]);%限制x,y的坐标范围
% 
% Y2=fft(y2,100);
% magY2=abs(Y2(1:1:51));
% k2=0:1:50;
% w2=2*pi/100*k2;
% 
% subplot(3,2,4);
% %plot(w2/pi,magY2);
% plot(k2,magY2);
% hold on
% %stem(w2/pi,magY2);
% stem(k2,magY2);
% title('DTFT的模');
% xlabel('k')
% axis([0,50,0,10])

% 
% %若取N为周期的两倍：
% subplot(2,2,3);
% stem(n,x);
% title('x(n), 0<=n<=1999');
% xlabel('n')
% axis([0,2000,-2.5,2.5])
% 
% X=fft(x,2000);
% magX=abs(X(1:1:2000));
% k=0:1:1999;
% w=2*pi/2000*k;
% 
% subplot(2,2,4);
% %stem(w/pi,magX);
% stem(k,magX);
% title('DTFT 的模');
% xlabel('k')
% axis([298,452,0,2])
% 
% %因为N为周期的两倍，所以图中有6个理想尖峰








