%% Question 4
% Cylindrical Projection and  Mercator Projection 

%% 

clear;
clc;
close all;

im = imread('map.gif');

[h w] = size(im);

x=1:h;
y=1:w;

h1 = (x-h/2)/(h/2);
w1 = (y-w/2)/(w/2);

h2 = (x-h/2)/(h/2);
w2 = (y-w/2)/(w/2)*pi/2;

% Getting the Grids
[x1,y1] = meshgrid(w1,h1);
[x2,y2] = meshgrid(w2,h2);

% Getting the new Coordinates
x_new1 = x1;
y_new1 = asin(y1);

x_new2 = x2;
y_new2 = (1/2)*(4*atan(exp(y2))-pi);

% Interpolation
cylindrical_projection = interp2(x1,y1,double(im),x_new1,y_new1);
mercator_projection = interp2(x2,y2,double(im),x_new2,y_new2);

figure;imshow(im,[]);
title('Original Image');

figure;imshow(cylindrical_projection);
title('Cylindrical Projection Image');

figure;imshow(mercator_projection);
title('Mercator Projection Image');
