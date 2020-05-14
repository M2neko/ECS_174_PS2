% part (c)
function [warpIm] = warpImage(inputIm, refIm, H)
    corners = zeros(4,2);
    [r,c,~] = size(inputIm);
    
    lt = [1; 1; 1];
    lt = H * lt;
    corners(1,1) = lt(1) / lt(3);
    corners(1,2) = lt(2) / lt(3);
    
    rt = [1; c; 1];
    rt = H * rt;
    corners(2,1) = rt(1) / rt(3);
    corners(2,2) = rt(2) / rt(3);
    
    lb = [r; 1; 1];
    lb = H * lb;
    corners(3,1) = lb(1) / lb(3);
    corners(3,2) = lb(2) / lb(3);
    
    rb = [r; c; 1];
    rb = H * rb;
    corners(4,1) = rb(1) / rb(3);
    corners(4,2) = rb(2) / rb(3);
    
    warpIm_minx = round(min([corners(1,1),corners(2,1),corners(3,1),corners(4,1), 1]));
    warpIm_miny = round(min([corners(1,2),corners(2,2),corners(3,2),corners(4,2), 1]));
    warpIm_maxx = round(max([corners(1,1),corners(2,1),corners(3,1),corners(4,1), size(double(refIm),1)]));
    warpIm_maxy = round(max([corners(1,2),corners(2,2),corners(3,2),corners(4,2), size(double(refIm),2)]));
    [x,y] = meshgrid(warpIm_minx:warpIm_maxx, warpIm_miny:warpIm_maxy);
    
    
    [width,height] = size(x);
    p = [x(:),y(:)];

    origin = [p';ones(1,size(p',2))];

    p = (H)\ origin;
    xpr = p(1,:)./p(3,:);

    ypr = p(2,:)./p(3,:);
    
    x = reshape(xpr,width,height);
    y = reshape(ypr,width,height);
    R = interp2(double(inputIm(:,:,1)),x,y);
    G = interp2(double(inputIm(:,:,2)),x,y);
    B = interp2(double(inputIm(:,:,3)),x,y);
    warpIm = cat(3,R,G,B);
    figure;
    imshow(uint8(warpIm));
    title('warpIm');
    
    
    
    
end
