function optikamain()


vid=videoinput('winvideo',1, 'YUY2_160x120')

%vid=videoinput('winvideo',1, 'RGB24_160x120')

%preview(vid)
test = serial('COM8');
fopen(test)
im=getsnapshot(vid);

imshow(im);
im=ycbcr2rgb(im);
imshow(im);
im=crop(im);

%imwrite(im,'arena.jpg');


[frame,redcircoordx,redcircoordy,red_sq_coord,blue_sq_coord,bluecircoordx,bluecircoordy]=optika(im);

[binary] = binary1(frame);

[mat matr] = optika2(frame,redcircoordx,redcircoordy,red_sq_coord,blue_sq_coord,bluecircoordx,bluecircoordy);
 imtool(frame)
 imshow(frame)
imtool(binary)
imshow(frame)
[bot]=bot_mat(binary);

end







