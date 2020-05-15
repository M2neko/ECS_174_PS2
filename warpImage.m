% part (c)
function [warpIm, mergeIm] = warpImage(inputIm, refIm, H)
corners = zeros(4,2);
[r,c,~] = size(inputIm);

lt = [1; 1; 1];
lt = H * lt;
corners(1,1) = lt(1) / lt(3);
corners(1,2) = lt(2) / lt(3);

rt = [1; r; 1];
rt = H * rt;
corners(2,1) = rt(1) / rt(3);
corners(2,2) = rt(2) / rt(3);

lb = [c; 1; 1];
lb = H * lb;
corners(3,1) = lb(1) / lb(3);
corners(3,2) = lb(2) / lb(3);

rb = [c; r; 1];
rb = H * rb;
corners(4,1) = rb(1) / rb(3);
corners(4,2) = rb(2) / rb(3);

%--------------------------Warp Image---------------------------

warpIm_minx = round(min([corners(1,1),corners(2,1),corners(3,1),corners(4,1), 1]));
warpIm_miny = round(min([corners(1,2),corners(2,2),corners(3,2),corners(4,2), 1]));
warpIm_maxx = round(max([corners(1,1),corners(2,1),corners(3,1),corners(4,1),size(double(refIm),1)]));
warpIm_maxy = round(max([corners(1,2),corners(2,2),corners(3,2),corners(4,2),size(double(refIm),2)]));
[x,y] = meshgrid(warpIm_minx:warpIm_maxx, warpIm_miny:warpIm_maxy);

[h,w] = size(x);
p = [x(:),y(:)];

origin = [p';ones(1,size(p',2))];

re = H \ origin;
xpr = re(1,:) ./ re(3,:);
ypr = re(2,:) ./ re(3,:);

box1 = reshape(xpr,h,w);
box2 = reshape(ypr,h,w);
R = interp2(double(inputIm(:,:,1)),box1,box2);
G = interp2(double(inputIm(:,:,2)),box1,box2);
B = interp2(double(inputIm(:,:,3)),box1,box2);
warpIm = cat(3,R,G,B);

warpIm(isnan(warpIm)) = 0;

warpIm = uint8(warpIm);

figure;
imshow(warpIm);
title('warpIm');

%-----------------------------------------------------------


%--------------------------Merge image----------------------

[wr,wc,~] = size(warpIm);
[rr,rc,~] = size(refIm);
nheight = max([wr,rr]);
nwidth = max([wc,rc]);

new_ref = zeros(nheight,nwidth,3);
new_wap = zeros(nheight,nwidth,3);
mergeIm = zeros(nheight,nwidth,3);


ref_x = max([1,1 - warpIm_minx]);
ref_y = max([1,1 - warpIm_miny]);
wap_x = max([1,warpIm_minx]);
wap_y = max([1,warpIm_miny]);

new_ref(ref_y:ref_y + rr - 1,ref_x:ref_x + rc - 1,:) = refIm(:,:,:);
new_wap(wap_y:wap_y + wr - 1,wap_x:wap_x + wc - 1,:) = warpIm(:,:,:);


for i = 1:nheight
    for j = 1:nwidth
        if new_ref(i,j,1) > 0 || new_ref(i,j,2) > 0 || new_ref(i,j,3) > 0
            mergeIm(i,j,:) = new_ref(i,j,:);
        end
        if new_wap(i,j,1) > 0 || new_wap(i,j,2) > 0 || new_wap(i,j,3) > 0
            mergeIm(i,j,:) = new_wap(i,j,:);
        end
    end
end

% Also work but slow?
%{
for i = 1:nheight
    for j = 1:nwidth
        if ~isequal(new_ref(i,j,:),double(zeros(1,1,3))) 
            mergeIm(i,j,:) = new_ref(i,j,:);
        end
        if ~isequal(new_wap(i,j,:),double(zeros(1,1,3))) 
            mergeIm(i,j,:) = new_wap(i,j,:);
        end
    end
end
%}

% Also work but slow
%{
for i = 1:nheight
    for j = 1:nwidth
        mergeIm(i,j,:) = new_ref(i,j,:);
        if new_wap(i,j,1) > 0 || new_wap(i,j,2) > 0 || new_wap(i,j,3) > 0
            mergeIm(i,j,:) = new_wap(i,j,:);
        end
    end
end
%}

% Test 50% blend
%{
for i = 1:nheight
    for j = 1:nwidth
        mergeIm(i,j,:) = new_ref(i,j,:) / 2 + new_wap(i,j,:) / 2;
    end
end
%}

mergeIm = uint8(mergeIm);

figure;
imshow(mergeIm);
title('mergeIm');

%-----------------------------------------------------------

end
