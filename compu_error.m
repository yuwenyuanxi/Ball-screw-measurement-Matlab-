function rePara2=compu_error(rePara1,dePara,stick)
%rePara1=[左半径 右半径 左圆心x 左圆心y 珠心x 珠心y 右圆心x 右圆心y]
%rePara2=[左半径 右半径 左水平偏 右水平偏 左垂直偏 右垂直偏 左接触角 右接触角]
%dePara=[左半径 右半径 左偏心 右偏心 球直径 外圆直径 量棒直径]
%左右圆心绕着珠心旋转，根据设计参数计算偏差
pot=[rePara1(3) rePara1(7);rePara1(4) rePara1(8)];%le_x,ri_x;le_y,ri_y
pot(1,:)=pot(1,:)-rePara1(5);
pot(2,:)=pot(2,:)-rePara1(6);
pot=rotate2D(pot,stick(1));
pot=pot/200;
%这边定义的偏心方向，为正常二维坐标轴方向，非图像坐标轴
le_delta_y=-dePara(3)-pot(2,1);%左圆心垂直偏心
le_delta_x=pot(1,1)-dePara(3);%左圆心水平偏心
ri_delta_y=-dePara(4)-pot(2,2);%右圆心垂直偏心
ri_delta_x=pot(1,2)+dePara(4);%右圆心水平偏心
le_angle=90+rad2deg(atan(pot(2,1)/pot(1,1)));
ri_angle=90-rad2deg(atan(pot(2,2)/pot(1,2)));

rePara2=[rePara1(1)/200 rePara1(2)/200 le_delta_x ri_delta_x le_delta_y ri_delta_y le_angle ri_angle];
end

