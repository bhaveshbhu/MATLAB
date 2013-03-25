function [x y]=locate(a,mat)

[m n]=size(mat);

for i=1:m
    for j=1:n
        if(mat(i,j)==a(1,1))
            x=i;
            y=j;
            
        end
    end
end

end