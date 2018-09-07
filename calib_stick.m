function out=calib_stick(BW,ex)
%量棒标定
%数张二值图像做直线检测，获得直线所在区域，其余地方全部删除，然后拟合
%转换成弧度，再平均
global imNums ROI_row
row=size(BW,1)/imNums;
first_im=BW(1:row,:);
if row<ROI_row  %如果图片过小，则填充，否则霍夫变换会出错
    first_im=Filled(first_im);
end

first_im=imdilate(first_im,ones(2));
first_im=first_im';
[H,T,R] = hough(first_im, 'Theta', -15:0.5:15);
Peaks=houghpeaks(H,1);
lines=houghlines(first_im,T,R,Peaks);
xy=[lines(1).point1;lines(1).point2];  
%xy=[左点行 左点列 右点行 右点列]

roi=zeros(size(first_im'));
ind=[min(xy(:,1)),max(xy(:,1))];  %第一列为原始图像的row
roi(ind(1)-ex:ind(2)+ex,:)=1;roi=logical(roi);

angle=zeros(1,imNums);
b=zeros(1,imNums);
for i=1:imNums
    %将每个图像都做屏蔽，然后拟合直线，最后求平均
    im=BW(row*(i-1)+1:row*i,:);
    if row<ROI_row  %如果图片过小，则填充，否则霍夫变换会出错
        im=Filled(im);
    end
    im_roi=logical(im).*roi;
    [x,y]=find(im_roi==1);
    line=polyfit(y,x,1);
    angle(i)=atan(line(1));
    b(i)=line(2);
end
out=[mean(angle) mean(b)];

end