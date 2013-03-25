function[meanx,meany]=centroid(t)
bin=t;
[rows,cols] = size(bin);
x = ones(rows,1)*[1:cols];    % Matrix with each pixel set to its x coordinate
y = [1:rows]'*ones(1,cols);   %   "     "     "    "    "  "   "  y    "

area = sum(sum(bin));
meanx = sum(sum(double(bin).*x))/area;
meany = sum(sum(double(bin).*y))/area;

end

