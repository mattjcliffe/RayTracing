%%% MJC 30-09-2016
% Very simple ray tracer for telescopes 

clear all ; clc
Ein = [1e-3 ; 0];
[Ein] = freespaceABCD(Ein,100e-3);
f = 100e-3;
d1 = 150e-3;
[E1] = lensABCD(Ein(:,length(Ein)),f);
[E2] = freespaceABCD(E1,d1);
f = 50e-3;
d2 = 200e-3;
[E3] = lensABCD(E2(:,length(E2)),f);
[E4] = freespaceABCD(E3,d2);

Eout = horzcat(Ein,E1,E2,E3,E4);
figure(1)
clf
plot(linspace(0,100e-3+d1+d2,length(Eout(1,:))),Eout(1,:))
hold on 
plot(linspace(0,100e-3+d1+d2,length(Eout(1,:))),-Eout(1,:))
