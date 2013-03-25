function redcars

	r = grid(:,:,1);
	g = grid(:,:,2);
	b = grid(:,:,3);
	red = (r > 2*g) & (r > 2*b) & r > 30;
green = (g > 2*r) & (g > 2*b) & g > 30;
    blue = (b > 2*r) & (b > 2*g) & b > 30;
    yellow = (g > 200) & (r > 200) & b <100;
		
	% group all red object within 5 pixels of each other as one object
	se = strel('disk',5);
	red = imclose(red,se);
    green = imclose(green,se);
    blue = imclose(blue,se);
        yellow = imclose(yellow,se);
	% delete all objects smaller than 35 pixels in area
	red = bwareaopen(red,35);
    green = bwareaopen(green,35);
    blue = bwareaopen(blue,35);
      yellow = bwareaopen(yellow,35);
	
	% take the centroids of all objects and store them in S
	r = regionprops(bwlabel(red),'centroid');
	R = vertcat(r.Centroid);
    
    g = regionprops(bwlabel(green),'centroid');
	G = vertcat(g.Centroid);
    
    b = regionprops(bwlabel(blue),'centroid');
	B = vertcat(b.Centroid);
    
   y = regionprops(bwlabel(yellow),'centroid');
	Y = vertcat(y.Centroid);
    % plot the image and the centroids
	figure
	imshow(grid)
	hold on
	plot(R(:,1),R(:,2),'+')
   zoom on
end