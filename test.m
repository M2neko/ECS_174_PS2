clc;
inputIm = imread('crop1.jpg');
refIm = imread('crop2.jpg');
t1 = importdata('cc1.mat');
t2 = importdata('cc2.mat');
H = computeH(t1,t2);
disp(H);
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);