inputIm1 = imread('crop1.jpg');
refIm1 = imread('crop2.jpg');
inputIm2 = imread('wdc1.jpg');
refIm2 = imread('wdc2.jpg');
load('cc1.mat');
load('cc2.mat');
cc3 = get_cors('wdc1.jpg');
cc4 = get_cors('wdc2.jpg');
H1 = computeH(cc1,cc2);
H2 = computeH(cc3,cc4);
[warp1,mosaic1] = warpImage(inputIm1,refIm1, H1);
[warp2,mosaic2] = warpImage(inputIm2,refIm2, H2);
imwrite(warp1,'cropwarp.png');
imwrite(mosaic1,'cropmos.png');
imwrite(warp2,'wdcwarp.png');
imwrite(mosaic2,'wdcmos.png');