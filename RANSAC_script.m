% part3 (a)
img1 = imread('mountain1.png');
img2 = imread('mountain2.png');
[cc1,cc2] = get_correspondences(img1,img2,7);
H_R = RANSAC(cc1,cc2);
[warp_R,mosaic_R] = warpImage(img1,img2,H_R);
H = computeH(cc1,cc2);
[warp,mosaic] = warpImage(img1,img2,H);
imwrite(warp_R,'mountainwarp_R.png');
imwrite(mosaic_R,'mountainmos_R.png');
imwrite(warp,'mountainwarp_O.png');
imwrite(mosaic,'mountainmos_O.png');