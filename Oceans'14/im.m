frame = imread('oce.jpg');

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



 imtool(frame)
t=frame-im;
imtool(t)
t=bwareaopen(t,100);
imtool(t)
















j=0;
i=0;
grid=zeros(8,8,3);
for l=18:35:(res(1))
    i=i+1;
    j=1;
    for m=17:35:(res(2))
            grid(i,j,:)=frame(l,m,:);
           j=j+1;
        
         end
    
end
r = grid(:,:,1);
	g = grid(:,:,2);
	b = grid(:,:,3);
	red = (r > 2*g) & (r > 2*b) & r > 30;
green = (g > 2*r) & (g > 2*b) & g > 30;
    blue = (b > 2*r) & (b > 2*g) & b > 30;
    yellow = (g > 200) & (r > 200) & b <100;
 %red coor
    for i=1:8
        
        for j=1:8
            if(red(i,j)==1)
                
                    rx=j;
                    ry=i;
                   
            end
        end
    end
    %blue coor
      for i=1:8
        
        for j=1:8
            if(blue(i,j)==1)
                
                    bx=j;
                    by=i;
                   
            end
        end
      end
    %green coor
        for i=1:8
        
        for j=1:8
            if(green(i,j)==1)
                
                    gx=j;
                   gy=i;
                   
            end
        end
        end
 %yellow coor   
          for i=1:8
        
        for j=1:8
            if(yellow(i,j)==1)
                
                    yx=j;
                    yy=i;
                   
            end
        end
          end
    
              
          
          
    
    
            
            
            
            
            