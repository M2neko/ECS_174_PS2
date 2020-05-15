clc;
inputIm1 = imread('crop1.jpg');
refIm1 = imread('crop2.jpg');
load('cc1.mat');
load('cc2.mat');
img1 = imread('plate.png');
img2 = imread('car.png');

[cc3,cc4] = get_correspondences(img1,img2, 4);
H1 = computeH(cc1,cc2);
H2 = computeH(cc3,cc4);

[warp1,mosaic1] = warpImage(inputIm1,refIm1, H1);
[warp2,mosaic2] = warpImage(img1,img2, H2);
imwrite(warp1,'cropwarp.png');
imwrite(mosaic1,'cropmos.png');
imwrite(warp2,'carwarp.png');
imwrite(mosaic2,'carmos.png');