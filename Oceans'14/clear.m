function [im_clr]=clear(im)

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

end