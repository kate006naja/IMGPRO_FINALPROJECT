%% watershed_dt.m
% ----------------------
clear all; close all;
f = imread('bwdowel.tif');
figure(1); imshow(f);

gc = ~f;
figure(2); imshow(gc);

D = bwdist(gc);
figure(3); imshow(mat2gray(D));

L = watershed(-D);
figure(4); imshow(~L);

w = (L==0);
g2 = f& ~w;
figure(5); imshow(g2);