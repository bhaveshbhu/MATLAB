function [binary] = binary(frame)

[m n t]=size(frame);
binary=zeros(m,n);

for i=1:m
    for j=1:n
        if (frame(i,j,1)>150&&frame(i,j,2)<100&&frame(i,j,3)<100)
            binary(i,j)=1;
        end
    end
end

binary= bwareaopen(binary,50);

end