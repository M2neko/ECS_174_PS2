% part (a)
function [points] = get_cors(img)
%Uncomment the following line if testing
%img = "izuku.jpg";
imshow(img);
title('Quit with Enter');
hold on;
[x,y] = ginput();
points = [x,y]';
plot(x,y,'r.','MarkerSize',12);
hold off;
end
