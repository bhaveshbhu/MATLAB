function [im]=getim()


im=getsnapshot(vid);

imshow(im);
im=ycbcr2rgb(im);

end