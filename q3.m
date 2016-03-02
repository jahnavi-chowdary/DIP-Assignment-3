%% Question 3
% Chroma Keying

%% Read the Images

close all;
clear;
clc;

fg= imread('fg.JPG');
bg= imread('bg.jpg');

h = size(bg,1);
w = size(bg,2);
fg = imresize(fg,[h w]);

fg = im2double(fg);
bg = im2double(bg);

%% Getting the Final Image
% Extract 3 different color channels and luminance matrix
fgR = fg(:,:,1);
fgG = fg(:,:,2);
fgB = fg(:,:,3);
fgY = 0.3*fgR+0.59*fgG+0.11*fgB;
 
% Subtract luminance from green channel
fgR_Y=mat2gray(fgR-fgY);
fgG_Y=mat2gray(fgG-fgY);
fgB_Y=mat2gray(fgB-fgY);
 
% Define a threshold 

% The threshold should be chose in such a way to avoid it is not too high as that will trim the image and too low will let some green through the borders

thres = 120/255;

mask = fgG_Y < thres;

final = [];

final(:,:,1)=fg(:,:,1).*mask + bg(:,:,1).*(1-mask);
final(:,:,2)=fg(:,:,2).*mask + bg(:,:,2).*(1-mask);
final(:,:,3)=fg(:,:,3).*mask + bg(:,:,3).*(1-mask);

figure; imshow((fg));
title('Original Image');

figure; imshow((bg));
title('Background Image');

figure, imshow(mat2gray(final));
title('Final Image');