function [points] = get_cors(img)
img = "izuku.jpg";
imshow(img);
title('Quit with Enter');
hold on;
[x,y] = ginput();
points = [x,y]';
plot(x,y,'x','linewidth',5);
hold off;
end
