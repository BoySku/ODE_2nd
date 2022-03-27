clc
clearvars 

[X,Y]=ode23('app1',[0 10],[1 1]);
[x,y]=ode45('app1',[0 10],[1 1]);
xx=0:0.01:10;
yt=(1+2.*xx).*exp(-xx);

plot(X,Y(:,1),'o',x,y(:,1),'x',xx,yt,'g')    