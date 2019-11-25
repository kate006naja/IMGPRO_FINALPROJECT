% ex_asf
% Adaptive Spatial Filters
% ------------------------
% Demonstration of Adaptive Spatial Filters
clear all;
close all;
clc;

f = imread('lena.bmp');
g = imnoise(f, 'salt & pepper', 0.20); % corrupted img by salt & pepper noise.
f1 = medfilt2(g, [3 3], 'symmetric');
f2 = adpmedian(g, 5);

figure();
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(g);
subplot(2,2,3); imshow(f1);
subplot(2,2,4); imshow(f2);
