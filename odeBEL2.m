function  [ x,y ] = odeBEL2( fn1,fn2,t,y)

fn1=str2func(fn1);
fn2=str2func(fn2);

yp=y(1);
y=y(2);

dx=0.1;
x=0:dx:10;
    
for i=1:length(x)-1
    
    fp(i)=fn1(x(i),yp(i));
    f(i)=fn2(x(i),y(i),fp(i));
    ye12(i)=y(i)+0.5.*dx.*fp(i);
    ype12(i)=yp(i)+0.5.*dx.*f(i);
    
 
    fp12(i)=fn1(x(i),ype12(i));
    f12(i)=fn2(x(i),ye12(i),fp12(i));
    yee12(i)=y(i)+0.5.*dx.*fp12(i);
    ypee12(i)=yp(i)+0.5.*dx.*f12(i);
    

        ffp12(i)=fn1(x(i),ypee12(i));
        ff12(i)=fn2(x(i),yee12(i),ffp12(i));
    ye1(i)=y(i)+dx.*ffp12(i);
    ype1(i)=yp(i)+dx.*ff12(i);
    
        fp1(i)=fn1(x(i),ype1(i));
        f1(i)=fn2(x(i),ye1(i),fp1(i));
    
    fpbar(i)=(fp(i)+2.*fp12(i)+2.*ffp12(i)+fp1(i))./6;
    fbar(i)=(f(i)+2.*f12(i)+2.*ff12(i)+f1(i))./6;
    
    yp(i+1)=yp(i)+dx.*fbar(i);
    y(i+1)=y(i)+dx.*fpbar(i);
    
end


y(1,:)=y;
y(2,:)=yp;

end

