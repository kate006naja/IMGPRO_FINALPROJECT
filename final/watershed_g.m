%% watershed_g.m
clear all; close all;
f = imread('small-blobs.tif');
figure(1); imshow(f);

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd, h, 'replicate').^2 + ...
         imfilter(fd, h', 'replicate').^2);
figure(2); imshow(mat2gray(g));

L = watershed(g);
wr = (L==0);
figure(3); imshow(wr);

g2 = imclose(imopen(g, ones(3,3)), ones(3,3));
L2 = watershed(g2);
wr2 = (L2==0);
figure(4); imshow(wr2);