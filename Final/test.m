close all;
clc;
% part2 (d)
%{
inputIm1 = imread('crop1.jpg');
refIm1 = imread('crop2.jpg');
load('cc1.mat');
load('cc2.mat');
inputIm2 = imread('wdc1.jpg');
refIm2 = imread('wdc2.jpg');

[points1,points2] = get_correspondences(inputIm2,refIm2,10);
save('points.mat','points1','points2');

H1 = computeH(cc1,cc2);
H2 = computeH(points1,points2);

[warp1,mosaic1] = warpImage(inputIm1,refIm1,H1);
[warp2,mosaic2] = warpImage(inputIm2,refIm2,H2);
imwrite(warp1,'cropwarp.png');
imwrite(mosaic1,'cropmos.png');
imwrite(warp2,'wdcwarp.png');
imwrite(mosaic2,'wdcmos.png');
%}

% part2 (e)
%{
img1 = imread('town1.png');
img2 = imread('town2.png');
[cc3,cc4] = get_correspondences(img1,img2,6);
H3 = computeH(cc3,cc4);
[warp3,mosaic3] = warpImage(img1,img2,H3);
imwrite(warp3,'townwarp.png');
imwrite(mosaic3,'townmos.png');
%}

% part2 (f)
%{
img3 = imread('plate.png');
img4 = imread('car.png');
[cc5,cc6] = get_correspondences(img3,img4,4);
H4 = computeH(cc5,cc6);
[warp4,mosaic4] = warpImage(img3,img4,H4);
imwrite(warp4,'carwarp.png');
imwrite(mosaic4,'carmos.png');
%}

% part3 (a)
%{
img5 = imread('mountain1.png');
img6 = imread('mountain2.png');
[cc7,cc8] = get_correspondences(img5,img6,7);
H5_R = RANSAC(cc7,cc8);
[warp5_R,mosaic5_R] = warpImage(img5,img6,H5_R);
H5 = computeH(cc7,cc8);
[warp5,mosaic5] = warpImage(img5,img6,H5);
imwrite(warp5_R,'mountainwarp_R.png');
imwrite(mosaic5_R,'mountainmos_R.png');
imwrite(warp5,'mountainwarp_O.png');
imwrite(mosaic5,'mountainmos_O.png');
%}

% part3 (b)
%{
img = imread('tiles.jpg');
[M,N,~] = size(img);
[cc9] = get_correspondences_fronto(img,4);
cc10 = double([1 1;1 M;N M;N 1]');
H6 = computeH(cc9,cc10);
[warp6,mosaic6] = warpImage(img,img,H6);
imwrite(warp6,'tileswarp.png');
imwrite(mosaic6,'tilesmos.png');
%}
