% % % %%
% % % %基本参数输入。无特别说明，本程序单位为mm
% % % barDiaInput=dePara(5);%量棒直径（物理值）
% % % xScale=0.005;%单位像素对应的物理长度（x方向）
% % % yScale=xScale;%单位像素对应的物理长度（x方向）
% % % randProp=0.05;%数据点前后掐去随机比例
% % % radCirStd=(barDiaInput/2)*(1/xScale);%计算量棒半径像素对应长度
% % % step_r=1;%霍夫半径步长
% % % step_angle=0.1;%霍夫角度步长
% % % minr=dePara(5)*100;%霍夫半径最小值
% % % maxr=dePara(1)*200+10;%霍夫半径最大值
% % % cir_num_thresh=1;%霍夫取圆数量概率，越小取越多
% % % error_thresh=1;%霍夫取圆后，实际数据点与拟合数据点距离的阈值，用于区分二值点坐标是否为圆弧一部分，单位为像素

%% 双圆弧区域选择及量棒中心点拟合
[le_r_measure,ri_r_measure, le_x,le_y,ball_x,ball_y,ri_x,ri_y] = imgDoubArcHough_par( imNums,radCirStd, randProp ,step_r,step_angle,minr,maxr,cir_num_thresh,error_thresh,handles);

%输出平均值
ball_x=mean(ball_x);ball_y=mean(ball_y);
le_r_measure=mean(le_r_measure);ri_r_measure=mean(ri_r_measure);
le_x_measure=mean(le_x);le_y_measure=mean(le_y);
ri_x_measure=mean(ri_x);ri_y_measure=mean(ri_y);
%% 结果输出部分
%rePara1=[左半径 右半径 左圆心x 左圆心y 珠心x 珠心y 右圆心x 右圆心y]
rePara1=[le_r_measure,ri_r_measure, le_x_measure,le_y_measure,ball_x,ball_y,ri_x_measure,ri_y_measure];
