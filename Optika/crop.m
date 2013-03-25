function [mat]=crop(matr)

k=[67 11 527 457]; % dimensions
mat=imcrop(matr,k);
% 
% m=i2;
% n=j2;
% 
% mat=zeros(m,n);
% 
% for i=1:m
%     for j=1:n
%         mat(i,j)= matr(i1+i-1,j1+j-1);
%     end
% end
     end