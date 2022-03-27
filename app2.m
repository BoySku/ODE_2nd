function dy = app2( t,y )

dy=zeros(2,1);
dy(1)=y(2);
dy(2)=dy(1)-0.75.*y(1);

end

