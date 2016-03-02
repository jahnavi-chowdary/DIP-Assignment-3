%% Question 2

%% Read the image and Get the binary image.
% In order to get a proper binary image, erosion and dilation is used 

clc;
clear;
close all;

im = imread('circles.jpg');
figure; imshow(im);
title('Original Image');

im_binary = im2bw(im,0.15);
im_binary = imfill(im_binary,'holes');
SE = strel('disk', 2);
im_binary = imerode(im_binary,SE);
im_binary = imdilate(im_binary,SE);
figure; imshow(im_binary);
title('Binary image');


%% Get the No of Categories, No of Circles in each category and a Binary Image for each category

count = zeros(1,10);
l = 1;

for i = 3:12
    if i == 3
        s = strel('disk', 3);
        temp = imtophat(im_binary,s);
        temp = imerode(temp,SE);
        im_top_fil = imdilate(temp,SE);
        figure; imshow(im_top_fil);
        [labeledImage, numberOfCircles] = bwlabel(im_top_fil);
        count(l) = numberOfCircles;
        title([' No.Of Circles in Category ' num2str(l) ' = ' num2str(numberOfCircles) ' ']);
        l = l+1;
    else 
        s1 = strel('disk', i-1);
        s2 = strel('disk',i);
    
        tmp1 = imtophat(im_binary,s1);
        tmp1 = imerode(tmp1,SE);
        tmp1 = imdilate(tmp1,SE);
    
    
        tmp2 = imtophat(im_binary,s2);
        tmp2 = imerode(tmp2,SE);
        tmp2 = imdilate(tmp2,SE);
    
        im_top_fil = tmp2 - tmp1;
        figure; imshow(im_top_fil);
        [labeledImage, numberOfCircles] = bwlabel(im_top_fil);
        count(l) = numberOfCircles;
        title([' No.Of Circles in Category ' num2str(l) ' = ' num2str(numberOfCircles) ' ']);
        l = l+1;
    end
end

radii = [3:12];
final(:,1) = radii';
final(:,2) = count';
final;

TotalNoOfCircles = sum(count)
NoOfCategories = l - 1

