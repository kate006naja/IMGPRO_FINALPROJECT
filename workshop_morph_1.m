% workshop_morp_1.m
clear all;
close all;
clc;
%% load image and create strel
f = imread('broken-text.tif');
se1 = strel('disk', 3);
se2 = strel('square', 10);
se3 = strel('disk', 15);

%% 3 filter f with imdilate
figure(1); 
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(imdilate(f, se1));
subplot(2, 2, 3); imshow(imdilate(f, se2));
subplot(2, 2, 4); imshow(imdilate(f, se3));

%% 4 filter f with imerode
figure(2); 
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(imerode(f, se1));
subplot(2, 2, 3); imshow(imerode(f, se2));
subplot(2, 2, 4); imshow(imerode(f, se3));

%% 5 filter f with imopen
figure(3); 
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(imopen(f, se1));
subplot(2, 2, 3); imshow(imopen(f, se2));
subplot(2, 2, 4); imshow(imopen(f, se3));

%% 6 filter f with imclose
figure(4); 
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(imclose(f, se1));
subplot(2, 2, 3); imshow(imclose(f, se2));
subplot(2, 2, 4); imshow(imclose(f, se3));
