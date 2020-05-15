% part (a)
function [points1,points2] = get_correspondences(img1,img2)
imshow(img1);
title('Quit with Enter');
hold on;
[x,y] = ginput();
points1 = [x,y]';
plot(x,y,'r.','MarkerSize',12);
hold off;

imshow(img2);
title('Quit with Enter');
hold on;
[x,y] = ginput();
points2 = [x,y]';
plot(x,y,'r.','MarkerSize',12);
hold off;
end
