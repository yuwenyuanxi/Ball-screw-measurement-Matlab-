function im=image_shot(is_shot,directory,obj,imNums,ROI)
global objRes
% im=image_shot(obj,imNums,ROI)

% tmp_roi=obj.ROIPosition;
% row=(tmp_roi(4)-ROI(1));col=tmp_roi(3)-ROI(3);
% im=zeros(row*imNums,col);
% tmp_roi=obj.ROIPosition;
% for i=1:imNums  %返回一大包图
%     frame = getsnapshot(obj);%抓图
%     im((i-1)*row+1:i*row,1:col)=frame(1:row,1:col);
% end

% obj.ROIPosition=objRes;
row=ROI(2)-ROI(1);
col=ROI(4)-ROI(3);
path='E:\matlab工程文件夹\18-08-06 汉中滚珠丝杠测量\7-21\';
for i=1:imNums  %返回一大包图
%      frame = getsnapshot(obj);%抓图

    frame=imread([path,'f',int2str(i),'.bmp']);
    frame_gray=rgb2gray(frame);
    kk=frame_gray(1470:2219,1967:2966);
%     kk=frame_gray(1:row,1:col);
    im((i-1)*row+1:i*row,1:col)=kk;
end


end
%     imwrite(frame,[directory,filename,'.jpg']);%存图'