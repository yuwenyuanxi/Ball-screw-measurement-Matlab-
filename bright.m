function out=bright(im)
if size(im,3)==3
    im=rgb2gray(im);
end
w2=fspecial('average',[2 2]);
im=imfilter(im,w2,'replicate'); 
out=double(max(max(im)));

end