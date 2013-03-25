function [frame,redcircoordx,redcircoordy,red_sq_coord,blue_sq_coord,bluecircoordx,bluecircoordy]=optika(im)

frame=im;

for j = 1:5
    for i = 1:3
        frame(:,:,i) = medfilt2(frame(:,:,i));
    end
end
res = size(frame);
frameHSV = rgb2hsv(frame);
for i = 1:res(1)
    for j = 1:res(2)
        colorHSV = frameHSV(i, j, :);
        colorRGB = [0 0 0];
        if colorHSV(1) >= 315/360 || colorHSV(1) <= 45/360         % Set the RGB Color to the one most dominant in the pixel
            colorRGB = [255 0 0];
        elseif colorHSV(1) <= 75/360
            colorRGB = [255 255 0];
        elseif colorHSV(1) <= 165/360
            colorRGB = [0 255 0];
        elseif colorHSV(1) <= 195/360
           colorRGB = [0 255 255];
        elseif colorHSV(1) <= 285/360
            colorRGB = [0 0 255];
        elseif colorHSV(1) <= 315/360
            colorRGB = [255 0 255];
       end
       if colorHSV(2) < 0.30   % If the color is not saturated (purity of color, 0 denotes white or black, or a shade of gray between the two), set the color to white.
            colorRGB = [255 255 255];
        end
        
        if colorHSV(3) < 0.30   % If the color is not intense, it must be black.
            colorRGB = [0 0 0];
        end
        
        frame(i, j, :) = colorRGB;  % Set the RGB color to our dominant color approximation
    end
end
l=frame;
%l=vfm('grab');
%figure,imshow(c);
c=rgb2gray(l);
bw=im2bw(c,.2);

b=ones(1);
bw=imfilter(bw,b);
npr=100;
%bw = bwareaopen(bw,npr);
H = fspecial('unsharp');
sh = imfilter(bw,H,'replicate');
sh = bwareaopen(sh,npr); 
%figure,imshow(sh); 
%title('Sharpened Image');

%extraction of destination object
checkpoint_r=l(:,:,1)-l(:,:,2);  % red detect 
checkpoint_r=im2bw(checkpoint_r,.2);
checkpoint_r=imfilter(checkpoint_r,b);
	checkpoint_r = bwareaopen(checkpoint_r,150);

checkpoint_b=l(:,:,3)-l(:,:,2);  %blue ->  white others black
checkpoint_b=im2bw(checkpoint_b,.2);
checkpoint_b=imfilter(checkpoint_b,b);

checkpoint_g=l(:,:,2)-l(:,:,1);  %  green -> 
checkpoint_g=im2bw(checkpoint_g,.2);
checkpoint_g=imfilter(checkpoint_g,b);

[B,L] = bwboundaries(checkpoint_r,'noholes');
stats = regionprops(L,'Area','Centroid');
redcircoordx=zeros(1,length(B)-1);
redcircoordy=zeros(1,length(B)-1);
t=1;
% loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};

  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));

  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;

  % compute the roundness metric
  metric(k) = 4*pi*area/perimeter^2;
  if(metric(k)<0.89)
  red_square=metric(k);
  red_sq_coord=floor(stats(k).Centroid);
  else
      r=floor(stats(k).Centroid);
      redcircoordx(t)= r(1);
      redcircoordy(t)=r(2);
      t=t+1;
  end
end

[B,L] = bwboundaries(checkpoint_b,'noholes');
stats_B = regionprops(L,'Area','Centroid');
bluecircoordx=zeros(1,length(B)-1);
bluecircoordy=zeros(1,length(B)-1);
t=1;
  % loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};
% compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));

  % obtain the area calculation corresponding to label 'k'
  area = stats_B(k).Area;

  % compute the roundness metric
  metric_b(k) = 4*pi*area/perimeter^2;
  if(metric_b(k)<0.89)
  blue_square=metric_b(k);
  blue_sq_coord=floor(stats_B(k).Centroid);
   else
      r=floor(stats_B(k).Centroid);
      bluecircoordx(t)= r(1);
      bluecircoordy(t)=r(2);
      t=t+1;
  end
end











