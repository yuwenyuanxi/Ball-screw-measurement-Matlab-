function out=imrotate_pot(im,pot,angle)
%二值图像绕任意点进行旋转
[row,col]=size(im);
[y,x]=find(im==1);  %点坐标
BW=[x'-pot(1);y'-pot(2)];        %以pot为原点的点坐标
BW_rotated=rotate2D(BW,angle);  %点坐标绕着原点旋转
pot_restore=[BW_rotated(1,:)+pot(1);BW_rotated(2,:)+pot(2)];   %恢复点坐标偏移
im_new=zeros(size(im));%建立新的二值化图像
pot_restore=ceil(pot_restore);%向上取整
x_=pot_restore(1,:);y_=pot_restore(2,:);
ind=find(x_<1);
x_(ind)=[];
y_(ind)=[];
ind=find(y_<1);
x_(ind)=[];
y_(ind)=[];
ind=find(x_>col);
x_(ind)=[];
y_(ind)=[];
ind=find(y_>row);
x_(ind)=[];
y_(ind)=[];

% for i=1:length(x_)
% im_new(y_(i),x_(i))=1;
% end
% im_new=imdilate(im_new,ones(2));
% out=logical(im_new);
out=[x_;y_];
end