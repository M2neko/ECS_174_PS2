% part3 (b)
img = imread('tiles.jpg');
[M,N,~] = size(img);
[cc1] = get_correspondences_fronto(img,4);
cc2 = double([1 1;1 M;N M;N 1]');
H = computeH(cc1,cc2);
[warp,mosaic] = warpImage(img,img,H);
imwrite(warp,'tileswarp.png');
imwrite(mosaic,'tilesmos.png');