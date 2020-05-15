% part2 (a)
function [points1,points2] = get_correspondences(img1,img2,n)

figure;
imshow(img1);
title('Image 1');
[x,y] = ginput(n);
points1 = [x,y]';
hold on;
plot(x,y,'r.','MarkerSize',12);
hold off;

figure;
imshow(img2);
title('Image 2');
hold on;
[x,y] = ginput(n);
points2 = [x,y]';
hold on;
plot(x,y,'r.','MarkerSize',12);
hold off;
end