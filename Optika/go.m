function [l]=go(dx,dy,binary,mat)


[bot]=bot_mat(binary);
[bx by]=locate(1,bot);

dist1=abs((dx-(bx+1))^2+(dy-by)^2);
dist2=abs((dx-(bx-1))^2+(dy-by)^2);
dist3=abs((dx-bx)^2+(dy-(by+1))^2);
dist4=abs((dx-bx)^2+(dy-(by-1))^2);

if(bx+1<=6)
if(mat(bx+1,by)~=0)
    dist1=10000;
end
else
    dist1=10000;
end
if(bx-1>0)
if(mat(bx-1,by)~=0)
    dist2=10000;
end
else
    dist2=10000;

end
if(by+1<=6)
if(mat(bx,by+1)~=0)
    dist3=10000;
end
else
    dist3=10000;
end
if(by-1>0)
if(mat(bx,by-1)~=0)
    dist4=10000;
end
else
    dist4=10000;
end


c=[dist1 dist2 dist3 dist4];
d=sort(c);
k=d(1,1);

if(k==dist1)
    l=[(bx+1) by];
elseif(k==dist2)
    l=[(bx-1) by];
elseif(k==dist3)
    l=[bx (by+1)];
    elseif(k==dist4)
    l=[bx (by-1)];
end

align(l,bot);
forward();
 

end
