function point=move(fromx,fromy)
j=fromy;
i=fromx;

for p=1:4
    k=0;
 for i=fromx:1:8
     if(k==0)
       if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) || i==8)
          if(i==8)
               temp(1,:)=[i,fromy]; 
           else
               temp(1,:)=[i-1,fromy];
            k=1;
           end
       end
     end
 end
 dis(1)=sqrt((temp(1)-rx).^2+(temp(1,2)-ry).^2);
 k=0; 
 for i=fromx:-1:1
     if(k==0)
     if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) || i==1)
      if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) && i==1)
           temp(2,:)=[i+1,fromy];
         k=1;
     elseif(i==1)
             temp(2,:)=[i,fromy];
         else
         temp(2,:)=[i+1,fromy];
         k=1;
      end
         end
     end
 end
      dis(2)=sqrt((temp(2)-rx).^2+(temp(2,2)-ry).^2);
 
 
 k=0;
 for j=fromy:1:8
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==8)
         if(j==8)
              temp(3,:)=[fromx,j];
         else
         temp(3,:)=[fromx,j-1];
         k=1;
         end
     end
     end
 end
  dis(3)=sqrt((temp(3)-rx).^2+(temp(3,2)-ry).^2);
 
 k=0;
 j=8;
 for j=fromy:-1:1
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==1)
         if(j==1)
             temp(4,:)=[fromx,j];
         else
         temp(4,:)=[fromx,j+1];
         k=1;
         end
     end
     end
  
 end
  dis(4)=sqrt((temp(4)-rx).^2+(temp(4,2)-ry).^2);
  
  
  if(min(dis)==dis(1))
      point(p,:)=temp(1,:)
  elseif(min(dis)==dis(2))
       point(p,:)=temp(2,:)
  elseif(min(dis)==dis(3))
             point(p,:)=temp(3,:)
          else
                  point(p,:)=temp(4,:)
  end
  fromx=point(p,1);
  fromy=point(p,2);
end
%upto green
fromx=rx;
fromy=ry;
j=fromy;
i=fromx;

for p=5:7
    k=0;
 for i=fromx:1:8
     if(k==0)
       if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) || i==8)
          if(i==8)
               temp(1,:)=[i,fromy]; 
           else
               temp(1,:)=[i-1,fromy];
            k=1;
           end
       end
     end
 end
 dis(1)=sqrt((temp(1)-3).^2+(temp(1,2)-6).^2);
 k=0; 
 for i=fromx:-1:1
     if(k==0)
     if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) || i==1)
      if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) && i==1)
           temp(2,:)=[i+1,fromy];
         k=1;
     elseif(i==1)
             temp(2,:)=[i,fromy];
         else
         temp(2,:)=[i+1,fromy];
         k=1;
      end
         end
     end
 end
      dis(2)=sqrt((temp(2)-3).^2+(temp(2,2)-6).^2);
 
 
 k=0;
 for j=fromy:1:8
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==8)
         if(j==8)
              temp(3,:)=[fromx,j];
         else
         temp(3,:)=[fromx,j-1];
         k=1;
         end
     end
     end
 end
  dis(3)=sqrt((temp(3)-3).^2+(temp(3,2)-6).^2);
 
 k=0;
 j=8;g
 for j=fromy:-1:1
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==1)
         if(j==1)
             temp(4,:)=[fromx,j];
         else
         temp(4,:)=[fromx,j+1];
         k=1;
         end
     end
     end
  
 end
  dis(4)=sqrt((temp(4)-3).^2+(temp(4,2)-6).^2);
  
  
  if(min(dis)==dis(1))
      point(p,:)=temp(1,:)
  elseif(min(dis)==dis(2))
       point(p,:)=temp(2,:)
  elseif(min(dis)==dis(3))
             point(p,:)=temp(3,:)
          else
                  point(p,:)=temp(4,:)
  end
  fromx=point(p,1);
  fromy=point(p,2);
end
%vid=videoinput('winvideo',1, 'YUY2_160x120')
 %preview(vid)
 %im=getsnapshot(vid);
 % im=ycbcr2rgb(im);
% calling  rgbone function.........

green = (g > 2*r) & (g > 2*b) & g > 30;
for i=1:8
        
        for j=1:8
            if(green(i,j)==1)
                
                    gx=j;
                   gy=i;
                   
            end
        end
end
        if(gy!=fromy)
            k=0;
 for j=fromy:-1:1
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==1)
         if(j==1)
             temp(4,:)=[fromx,j];
         else
         temp(4,:)=[fromx,j+1];
         k=1;
         end
     end
     end
  
 end
  else
            %get snapshot
        end
        %move to 3,3
        
        fromx=temp(4);   %after crossing green
        fromy=temp(4,2);   %after crossing green
        
        
        
        %for blue
   
    k=0;
 for i=fromx:1:8
     if(k==0)
       if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) || i==8)
          if(i==8)
               temp(1,:)=[i,fromy]; 
           else
               temp(1,:)=[i-1,fromy];
            k=1;
           end
       end
     end
 end
 dis(1)=sqrt((temp(1)-rx).^2+(temp(1,2)-ry).^2);
 k=0; 
 for i=fromx:-1:1
     if(k==0)
     if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) || i==1)
      if((grid(fromy,i,1)==0 && grid(fromy,i,2)==0 && grid(fromy,i,3)==0) && i==1)
           temp(2,:)=[i+1,fromy];
         k=1;
     elseif(i==1)
             temp(2,:)=[i,fromy];
         else
         temp(2,:)=[i+1,fromy];
         k=1;
      end
         end
     end
 end
      dis(2)=sqrt((temp(2)-bx).^2+(temp(2,2)-by).^2);
 
 
 k=0;
 for j=fromy:1:8
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==8)
         if(j==8)
              temp(3,:)=[fromx,j];
         else
         temp(3,:)=[fromx,j-1];
         k=1;
         end
     end
     end
 end
  dis(3)=sqrt((temp(3)-bx).^2+(temp(3,2)-by).^2);
 
 k=0;
 j=8;
 for j=fromy:-1:1
     if(k==0)
     if((grid(j,fromx,1)==0 && grid(j,fromx,2)==0 && grid(j,fromx,3)==0) || j==1)
         if(j==1)
             temp(4,:)=[fromx,j];
         else
         temp(4,:)=[fromx,j+1];
         k=1;
         end
     end
     end
  
 end
  dis(4)=sqrt((temp(4)-bx).^2+(temp(4,2)-by).^2);
  
  
  if(min(dis)==dis(1))
      point(8,:)=temp(1,:)
  elseif(min(dis)==dis(2))
       point(8,:)=temp(2,:)
  elseif(min(dis)==dis(3))
             point(8,:)=temp(3,:)
          else
                  point(8,:)=temp(4,:)
  end
  fromx=point(8,1);
  fromy=point(8,2);


 %vid=videoinput('winvideo',1, 'YUY2_160x120')
 %preview(vid)
 %im=getsnapshot(vid);
 % im=ycbcr2rgb(im);
% calling  rgbone function.........

%getting blue coord
blue = (b > 2*r) & (b > 2*g) & b > 30;
for i=1:8
        
        for j=1:8
            if(green(i,j)==1)
                
                    gx=j;
                   gy=i;
                   
            end
        end
end
if(by!=fromy)
   %%%% move 1  forward
 else
            %get snapshot
        end
        %move to 3,3
        
        fromx=temp(4);   %after crossing green
        fromy=temp(4,2);   %after crossing green

        
        
        
        

end
      

  
  
  
  

