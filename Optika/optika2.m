function [mat matr]= optika2(frame,redcircoordx,redcircoordy,red_sq_coord,blue_sq_coord,bluecircoordx,bluecircoordy)

%im=crop(im);
im=frame;

[m n t]=size(im);
red=zeros(m,n);
green=zeros(m,n);
blue=zeros(m,n);

rll=100;
rul=100;
rlh=100;
ruh=140;

gll=75;
gul=100;
glh=100;
guh=140;

bll=75;
bul=100;
blh=100;
buh=140;

for i=1:m
    for j=1:n
        if((im(i,j,1)>rul&&im(i,j,2)<rll&&im(i,j,3)<rll)||(im(i,j,1)>ruh&&im(i,j,2)<rlh&&im(i,j,3)<rlh))
            red(i,j)=1;
        elseif ((im(i,j,1)<gll&&im(i,j,2)>gul&&im(i,j,3)<gll)||(im(i,j,1)<glh&&im(i,j,2)>guh&&im(i,j,3)<glh))
            green(i,j)=2;
        elseif ((im(i,j,1)<bll&&im(i,j,2)<bll&&im(i,j,3)>bul)||(im(i,j,1)<blh&&im(i,j,2)<blh&&im(i,j,3)>buh))
            blue(i,j)=3;
        end
    end
end
 red = bwareaopen(red,150);

matr=zeros(m,n);

for i=1:m
    for j=1:n
        if(red(i,j)==1)
            matr(i,j)=1;
        elseif(green(i,j)==2)
            matr(i,j)=2;
        elseif(blue(i,j)==3)
            matr(i,j)=3;
         end
    end
end

[x y]=size(matr);
mat =zeros(6,6);

r=0;
g=0;
b=0;
nul=0;

        k=(floor(x/6));
        l=(floor(y/6));
        xc=1:k:x;
        yc=1:l:y;
        for u=1:6
            for v=1:6
                for p=(xc(u)+floor(k/2)-10):(xc(u)+floor(k/2)+10)
                     for q=(yc(v)+floor(l/2)-10):(yc(v)+floor(l/2)+10)
                         if(p==red_sq_coord(1) && q==red_sq_coord(2))
                             mat(v,u)=1;
                         elseif(p==redcircoordx(1) && q==redcircoordy(1))
                                 mat(v,u)=2;
                                 elseif(p==redcircoordx(2) && q==redcircoordy(2))
                                 mat(v,u)=3;
                                 elseif(p==redcircoordx(3) && q==redcircoordy(3))
                                 mat(v,u)=4;
                                 elseif(p==redcircoordx(4) && q==redcircoordy(4))
                                 mat(v,u)=5;
                                 elseif(p==redcircoordx(5) && q==redcircoordy(5))
                                 mat(v,u)=6;
                                 elseif(p==blue_sq_coord(1) && q==blue_sq_coord(2))
                                 mat(v,u)=7;
                                 elseif(p==bluecircoordx(1) && q==bluecircoordy(1))
                                 mat(v,u)=8;
                                 elseif(p==bluecircoordx(2) && q==bluecircoordy(2))
                                 mat(v,u)=9;
                                 elseif(p==bluecircoordx(3) && q==bluecircoordy(3))
                                 mat(v,u)=10;
                                 elseif(p==bluecircoordx(4) && q==bluecircoordy(4))
                                 mat(v,u)=11;
                                  end
                     end
                 end
                
            end
          end
end