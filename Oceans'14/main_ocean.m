I=imread('1.jpg');
size(I)

[m,n,t]=size(I);
binblue=zeros(m,n); num=0;
for i=1:m
for j=1:n
if(I(i,j,1)<=255 && I(i,j,1)>239 && I(i,j,2)<=255 && I(i,j,2)>244 && I(i,j,3)<90)
binblue(i,j)=1; num=num+1;
end
end
imshow(binblue);
end
se = strel('square', 5);
bw=imclose(binblue,se);

bw=imfill(bw,'holes'); 

se=strel('disk',2); 
bw=imopen(bw,se);
imshow(bw);
%count no of objects
%centroid 
[rows,cols] = size(binblue);
x = ones(rows,1)*[1:cols];    % Matrix with each pixel set to its x coordinate
y = [1:rows]'*ones(1,cols);   %   "     "     "    "    "  "   "  y    "

area = sum(sum(binblue));
meanx = sum(sum(double(binblue).*x))/area;
meany = sum(sum(double(binblue).*y))/area;
%centroid end
%detecting black region
[m,n,t]=size(I);
binblack=zeros(m,n); num=0;
for i=1:m
for j=1:n
if(I(i,j,1)<=10 && I(i,j,2)<=10 && I(i,j,3)<30)
binblack(i,j)=1; num=num+1;
end
end
imshow(binblack);
end
[labeled,numObjects] = bwlabel(binblack,4);



