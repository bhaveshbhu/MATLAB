function [bots]=locate()

%output matrix shld hv coordinate of 4 n 5
[im]=getim();
[im]=crop(im);
[m n t]=size(im);
drone=zeros(m,n);

for i=1:m
    for j=1:n
        if (im(i,j,1)>150 &&  im(i,j,2)<100  &&  im(i,j,3)<100)
            drone(i,j)=1;
        end
    end
end

[drone]=clean(drone);

[l num]=bwlabel(drone);
k=regionprops(l,'all');
peri=[k.Perimeter];
centroid=[k.Centroid];

centroid=reshape(centroid,[2 num]);
area=[k.Area];
for i=1:num
    ratio(i)=(peri(i)*peri(i))/area(i);
    if ( (ratio(i)>11) && (ratio(i)<14))
        x0=[centroid(1,i) centroid(2,i)];
    elseif ((ratio(i)>45)&& (ratio(i)<51))
        x1=[centroid(1,i) centroid(2,i)];
    end
end

bot=zeros(6,6);
bots=zeros(2,2);

u=floor((x0(1,1)/m)*6);
v=floor((x0(1,2)/n)*6);

bot(u,v)=1;
bots(1,1)=u;
bots(2,1)=v;

if((x1(1,1)-x0(1,1))<(x1(1,2)-x0(1,2))&&(x1(1,2)-x0(1,2))>0)
    bot(u,v+1)=5;
    bots(2,1)=u;
    bots(2,2)=v+1;
elseif((x1(1,1)-x0(1,1))<(x1(1,2)-x0(1,2))&&(x1(1,2)-x0(1,2))<0)
    bot(u,v-1)=5;
    bots(2,1)=u;
    bots(2,2)=v-1;
elseif((x1(1,1)-x0(1,1))>(x1(1,2)-x0(1,2))&&(x1(1,1)-x0(1,1))>0)
    bot(u+1,v)=5;
    bots(2,1)=u+1;
    bots(2,2)=v;
elseif((x1(1,1)-x0(1,1))>(x1(1,2)-x0(1,2))&&(x1(1,1)-x0(1,1))<0)
    bot(u-1,v)=5;
    bots(2,1)=u-1;
    bots(2,2)=v;
end
end