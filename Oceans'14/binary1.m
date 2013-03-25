function [binary] = binary(frame)

[m n t]=size(frame);
binary=zeros(m,n);

for i=1:m
    for j=1:n
        if (frame(i,j,1)==0&&frame(i,j,2)==0&&frame(i,j,3)==0)
            binary(i,j)=1;
        end
    end
end

binary= bwareaopen(binary,50);

end