% part (a)
function [points1,points2] = get_correspondences(img1,img2,n)
imshow(img1);
title('Image 1');
[x,y] = ginput(n);
points1 = [x,y]';
plot(x,y,'r.','MarkerSize',12);

imshow(img2);
title('Image 2');
hold on;
[x,y] = ginput(n);
points2 = [x,y]';
plot(x,y,'r.','MarkerSize',12);
end