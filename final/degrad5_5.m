% degrad5_5.m
% ----- Modelling the Degradation Function -----
clear all;
close all;
clc;

f = checkerboard(8);
figure; imshow(im2uint8(mat2gray(f)));

PSF = fspecial('motion', 7, 45); % 45 mean blur at 45 degree for 7 pixels
gb = imfilter(f, PSF, 'circular'); % filter PSF into f using circular style
% left right and top down
figure; imshow(im2uint8(mat2gray(gb)));

noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
figure; imshow(im2uint8(mat2gray(noise)));

g = gb + noise;

figure; imshow(im2uint8(mat2gray(g)));

figure; imshow(pixeldup(f, 8), []);

% --- Restoration by Using Direct Inverse Filter Technique
%     via deconvwr function -----

% deblur image using wiener filter
fr1 = deconvwnr(g, PSF); % PSF is like a cause of degrade picture
figure; imshow(im2uint8(mat2gray(fr1)));

Sn = abs(fft2(noise)).^2;       % noise power spectrum
nA = sum(Sn(:))/numel(noise);   % noise average power
Sf = abs(fft2(f)).^2;           % image power spectrum
fA = sum(Sf(:))/numel(f);       % image average power
R = nA/fA;

fr2 = deconvwnr(g, PSF, R);
figure; imshow(im2uint8(mat2gray(fr2)));

% --- Restoration by Using Autocorrelation function -----
NCORR = fftshift(real(ifft2(Sn))); % shift the inverse of noise power spectrum
ICORR = fftshift(real(ifft2(Sf))); % shift the inverse of image power spectrum
fr3 = deconvwnr(g, PSF, NCORR, ICORR);
figure; imshow(im2uint8(mat2gray(fr3)));

% ----- Restoration by Using Constrained Least Squares (Regularized)
%       Filtering -----
fr4 = deconvreg(g, PSF, 2);         % noise power is approximately 2
figure; imshow(im2uint8(mat2gray(fr4)));

fr5 = deconvreg(g, PSF, 0.8, [1e-7 1e7]);
figure; imshow(im2uint8(mat2gray(fr5)));