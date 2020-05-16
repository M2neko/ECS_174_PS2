
function [points] = get_correspondences_fronto(img,n)
imshow(img);
title('Image');
[x,y] = ginput(n);
points = [x,y]';
plot(x,y,'r.','MarkerSize',12);
close all;
end