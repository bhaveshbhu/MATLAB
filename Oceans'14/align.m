function align(l,bot)

[x y]=locate(2,bot);

i=l(1,1)-x;
j=l(1,2)-y;

if((i==2)||(j==2))
    right();
    right();
end
if((i/j)<0)
    right();
end
if((i/j)>0)
    left();

end