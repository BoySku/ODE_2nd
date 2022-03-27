clc
clearvars

yp=1; y=1; dx=0.1; x=0:dx:10;

for i=1:length(x)-1

    z(i)=yp(i);
    zp(i)=-2.*z(i)-y(i);
        
    y12(i)=y(i)+0.5*dx.*zp(i);
        zp12(i)=-2.*z(i)-y12(i);
    yp12(i)=yp(i)+0.5.*dx.*zp12(i);
        z12(i)=yp(i);
     
    yp(i+1)=yp(i)+dx.*zp12(i);
    y(i+1)=y(i)+dx.*z12(i);
    
end
yt=(1+2.*x).*exp(-x)
plot(x,y,'r',x,yt,'g')