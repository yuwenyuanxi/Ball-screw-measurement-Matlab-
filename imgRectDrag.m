function [rect] = imgRectDrag(img)
system('echo off | clip');
figure;
imshow(img);
h = imrect;
rect = wait(h);
rect=[rect(1),rect(2),rect(3)+rect(1),rect(4)+rect(2)];
close;
end