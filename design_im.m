function []=design_im(im_rota,dePara,rePara1,ball,b_rotated,handles)
%dePara=[左半径 右半径 左偏心 右偏心 球直径 外圆直径 量棒直径]
%rePara1=[左半径 右半径 左圆心x 左圆心y 珠心x 珠心y 右圆心x 右圆心y]像素

val=150;
le_cir=[ball(1)+dePara(3)*200;ball(2)-dePara(3)*200;dePara(1)];%左圆心及半径
ri_cir=[ball(1)-dePara(4)*200;ball(2)-dePara(4)*200;dePara(2)];%右圆心及半径
cir_d=dePara(6);%外圆直径
stick_d=dePara(7);%量棒直径
de_im=zeros(max(im_rota(2,:)),max(im_rota(1,:)),3);
dist_cir_stick_pix=(stick_d-cir_d)*100;
cir_realpix=b_rotated-dist_cir_stick_pix;%理想外圆尺寸偏移位置

[le_loca,a]=create_arc(le_cir,cir_realpix(2),ball,'le');%创建圆弧廓形
[ri_loca,b]=create_arc(ri_cir,cir_realpix(2),ball,'ri');%创建圆弧廓形
de_im(round(cir_realpix(2)),1:round(a),1)=val;  %红色
de_im(round(cir_realpix(2)),round(b):end,1)=val;  %红色

for i=1:length(le_loca(2,:))
    de_im(round(le_loca(2,i)),round(le_loca(1,i)),1)=val;  %红色
end
for i =1:length(ri_loca(2,:))
    de_im(round(ri_loca(2,i)),round(ri_loca(1,i)),1)=val;  %红色
end
% axes(handles.axes1);
de_im=imdilate(de_im,ones(4));
imshow(de_im)
hold on
plot(im_rota(1,:),im_rota(2,:),'w-','linewidth',1)
plot(rePara1(3),rePara1(4),'w.')
plot(rePara1(7),rePara1(8),'w.')
le_angle=plot_angle([rePara1(3);rePara1(4)],ball,rePara1(1),'le');%求角
ri_angle=plot_angle([rePara1(7);rePara1(8)],ball,rePara1(2),'ri');


zoom on
% datacursormode on  %数据游标
%角度显示
hold off
end

function [loca,a]=create_arc(cir,cir_offset,ball,str)
if strcmp(str,'le')
    %左圆弧提供左偏移
    i=0:0.01:2*pi;
    loca=[cos(i)*cir(3)*200+cir(1);sin(i)*cir(3)*200+cir(2)];
    loca(:,find(loca(2,:)<cir_offset))=[];
    loca(:,find(loca(1,:)>ball(1)))=[];
    a=min(loca(1,:));
elseif strcmp(str,'ri')
    i=0:0.01:2*pi;
    loca=[cos(i)*cir(3)*200+cir(1);sin(i)*cir(3)*200+cir(2)];
    loca(:,find(loca(2,:)<cir_offset))=[];
    loca(:,find(loca(1,:)<ball(1)))=[];
    a=max(loca(1,:));
end

end

function [angle]=plot_angle(cir,ball,r,str)
%cir,拟合圆心，ball珠心，r拟合半径
delta_x=abs(cir(1)-ball(1));
delta_y=abs(cir(2)-ball(2));
angle=atan(delta_x/delta_y)/pi*180;

dy=r*cos(atan((cir(1)-ball(1))/(cir(2)-ball(2))));
dx=r*sin(atan((cir(1)-ball(1))/(cir(2)-ball(2))));

pot=cir+[dx;dy];
if str=='le'
    ex=-65;
elseif str=='ri'
    ex=15;
end

text(pot(1)+ex,pot(2),[num2str(angle,3),'°'],'Color','white','FontSize',10)
% annotation('arrow',[pot(1) cir(1)]/im_size(2),[pot(2)
% cir(2)]/im_size(1));无效
line([pot(1) cir(1)],[pot(2) cir(2)]) %行列顺序
end
