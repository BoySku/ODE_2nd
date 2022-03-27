clc
clearvars 

[X,Y]=ode23('app2',[0 10],[1 (1+sqrt(2))./2]);
[x,y]=ode45('app2',[0 10],[1 (1+sqrt(2))./2]);

xx=0:0.01:10;

yt=(cos((sqrt(2)/2).*xx)+sin((sqrt(2)/2).*xx)).*exp(xx./2);

plot(X,Y(:,1),'o',x,y(:,1),'x', xx,yt,'g')
