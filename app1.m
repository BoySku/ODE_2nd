function dy = app1( t,y )

dy=zeros(2,1);
dy(1)=y(2);
dy(2)=-2.*dy(1)-y(1);

end

