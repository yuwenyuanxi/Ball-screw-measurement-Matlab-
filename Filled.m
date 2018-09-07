
function bigger=Filled(BW)
global ROI_row
[row,col]=size(BW);
bigger=zeros(ROI_row,col);
bigger(ROI_row-row+1:end,:)=BW;
end