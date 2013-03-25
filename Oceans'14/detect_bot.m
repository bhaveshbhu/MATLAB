function [small_cir,big_cir]=detect_bot(im)

[im_clr]=clear_im(im);

[drone]=binary(im_clr);

[l num]=bwlabel(drone);
k=regionprops(l,'all');
peri=[k.Perimeter];
centroid=[k.Centroid];

%centroid=reshape(centroid,[2 num]);
cir1=[0 0];
cir2=[0 0];
area=[k.Area];
for i=1:num
    ratio(i)=(peri(i)*peri(i))/area(i);
    if ((ratio(i)>11) && (ratio(i)<14) && cir1(1)==0)
       cir1=[k(i).Centroid];
       c1=i;
    elseif ((ratio(i)>11) && (ratio(i)<14) && cir1(1)~=0)
       cir2=[k(i).Centroid];
       c2=i;
      end
end

if(peri(c1)<peri(c2) && area(c1)<area(c2))
    small_cir=cir1;
    big_cir=cir2;
else
    small_cir=cir2;
    big_cir=cir1;
    end

end

