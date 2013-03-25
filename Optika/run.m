function run(mat,binary,test)


num=1;
[dx dy]=locate(num,mat);
mat(dx,dy)=0;

while(l(1)~=dx && l(2)~=dy)
[l]=go(dx,dy,binary,mat);
end

if(num==1 || num==7 || num==12)
    {
       led_square(test);
        
        }
else
    led_circle(test);
end

end