%%% MJC 30-09-2016 %%%%%%%%%%%%%%%%%%%%
% Very simple ray tracer for telescopes 
% Example code 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; clc
%Ein is a vector with [x,theta] in m and rad
Ein = [1e-3 ; 0];
d0 = 1e-3; 

%Propagate by d0
[Ein] = freespaceABCD(Ein,d0);


f = 100e-3;
d1 = 150e-3;
%Insert lens focal length f
[E1] = lensABCD(Ein(:,length(Ein)),f);
%Propagate by d1
[E2] = freespaceABCD(E1,d1);
f = 50e-3;
d2 = 200e-3;
%Insert lens focal length f
[E3] = lensABCD(E2(:,length(E2)),f);
%Propagate d2
[E4] = freespaceABCD(E3,d2);

%concat and plot waist
Eout = horzcat(Ein,E1,E2,E3,E4);
figure(1)
clf
plot(linspace(0,d0+d1+d2,length(Eout(1,:))),Eout(1,:))
hold on 
plot(linspace(0,d0+d1+d2,length(Eout(1,:))),-Eout(1,:))
