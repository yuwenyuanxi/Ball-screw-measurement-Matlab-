function [xc,yc,R]=CircleFit(x,y)
%x是列，y是行，图像中的xy坐标系
t=0:0.01:pi;  
%plot(x,y,'.'); hold on; 
x=x(:);  
y=y(:);  
m=[x y ones(size(x))]\[-(x.^2+y.^2)]; 
xc = -.5*m(1);%拟合圆心X轴数值 
yc = -.5*m(2);%拟合圆心Y轴数值  
R  =  sqrt((m(1)^2+m(2)^2)/4-m(3));%拟合半径数值 
%plot(xc,yc,'r-x',(xc+R*cos(t)),(yc+R*sin(t)),'r.'); 



return





t=0:0.01:pi;  
a=20;%设定圆心X轴数值 
b=30;%设定圆心Y轴数值 
r=5;%设定圆半径数值 
x=a+r*cos(t)+randn(1,315); 
y=b+r*sin(t)+randn(1,315); 
plot(x,y,'.'); hold on; 
x=x(:);  
y=y(:);  
m=[x y ones(size(x))]\[-(x.^2+y.^2)]; 
xc = -.5*m(1)%拟合圆心X轴数值 
yc = -.5*m(2)%拟合圆心Y轴数值  
R  =  sqrt((m(1)^2+m(2)^2)/4-m(3))%拟合半径数值 
plot(xc,yc,'r-x',(xc+R*cos(t)),(yc+R*sin(t)),'r.'); 
axis equal;