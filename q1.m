%% Question 1
% Detecting yellow stars

%% In Spatial Domain

clc;
close all;

[im_temp , map1] = imread('octone.gif');
imwrite(im_temp,map1,'octane.jpg');
im = imread('octane.jpg');
figure;
imshow(im);
title('Original Image')
 
R = im(:,:, 1);
G = im(:,:, 2);
B = im(:,:, 3);
 
% Threshold each color band.

yellow_redThreshold   = 235;   % 140 for big stars
yellow_greenThreshold = 235;   % 140 for big stars
yellow_blueTreshold = 70;
yellowMask = (B < yellow_blueTreshold) & (R > yellow_redThreshold) & (G > yellow_greenThreshold);

maskedrgbImage = uint8(zeros(size(yellowMask)));
maskedrgbImage(:,:,1) = im(:,:,1) .* uint8(yellowMask);
maskedrgbImage(:,:,2) = im(:,:,2) .* uint8(yellowMask);
maskedrgbImage(:,:,3) = im(:,:,3) .* uint8(yellowMask);


figure;
imshow(maskedrgbImage);
title('Final Image With Just Yellow Stars');