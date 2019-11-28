%% last_ex.m
clear all; close all;
f = imread('gel.tif');
figure(1); imshow(f);

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd, h, 'replicate').^2 + ...
        imfilter(fd, h', 'replicate').^2);

g1 = log2(1+double(g));
figure(2); imshow(mat2gray(g1));

L = watershed(g);
wr = L==0;
figure(3); imshow(wr);

rm = imregionalmin(g);
figure(4); imshow(rm);

im = imextendedmin(f, 2);
fim = f;
fim(im) = 175;
figure(5); imshow(fim);

Lim = watershed(bwdist(im));
em = Lim == 0;
figure(6); imshow(em);

gg = mat2gray(g1);
g2 = imimposemin(gg, em | im);
figure(7); imshow(g2);

L2 = watershed(g2);
f2 = f;
f2(L2 == 0) = 255;
figure(8); imshow(f2);