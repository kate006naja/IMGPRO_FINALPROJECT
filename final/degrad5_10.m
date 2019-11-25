% degrad5_10.m
% ----- Blind deconvolution -----
clear all;
close all;
clc;

f = checkerboard(8);
% figure, imshow(pixeldup(f, 8), []);
figure(1); imshow(pixeldup(f, 8), []);

PSF = fspecial('gaussian', 5, 45);
% imshow(pixeldup(PSF, 73), []);
figure(2); imshow(pixeldup(PSF, 73), []);
SD = 0.05;
g = imnoise(imfilter(f, PSF), 'gaussian', 0, SD^2);
figure(3); imshow(pixeldup(g, 8), []);

INITPSF = ones(size(PSF));
NUMIT = 100;
DAMPAR = 10*SD;
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
[fr, PSFs] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
figure(4); imshow(pixeldup(fr, 8), []);
figure(5);
subplot(1,2,1); imshow(pixeldup(PSF, 8), []);
subplot(1,2,2); imshow(pixeldup(PSFs, 8), []);