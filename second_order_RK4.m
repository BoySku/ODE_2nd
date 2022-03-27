clc
clearvars

yp=1;y=1;dx=0.1;x=0:dx:10;
    
for i=1:length(x)-1
    
    fp(i)=yp(i);
    f(i)=-2.*fp(i)-y(i);
    ye12(i)=y(i)+0.5.*dx.*fp(i);
    ype12(i)=yp(i)+0.5.*dx.*f(i);
    
    fp12(i)=ype12(i);
    f12(i)=-2.*fp12(i)-ye12(i);
    yee12(i)=y(i)+0.5.*dx.*fp12(i);
    ypee12(i)=yp(i)+0.5.*dx.*f12(i);
    
    ffp12(i)=ypee12(i);
    ff12(i)=-2.*ffp12(i)-yee12(i);
    ye1(i)=y(i)+dx.*ffp12(i);
    ype1(i)=yp(i)+dx.*ff12(i);
    
    fp1(i)=ype1(i);
    f1(i)=-2.*fp1(i)-ye1(i);
    
    fpbar(i)=(fp(i)+2.*fp12(i)+2.*ffp12(i)+fp1(i))./6;
    fbar(i)=(f(i)+2.*f12(i)+2.*ff12(i)+f1(i))./6;
    
    yp(i+1)=yp(i)+dx.*fbar(i);
    y(i+1)=y(i)+dx.*fpbar(i);
    
end
xx=0:dx./100:10;
yt=(1+2.*xx).*exp(-xx);

plot(x,y,'o',xx,yt,'r')