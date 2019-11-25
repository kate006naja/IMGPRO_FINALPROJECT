% Workshop on image Restoration (Part II)

%% 1. create PSF in form of "motion" at least 3 forms
clear all;
close all;
clc;

% in 'motion' its len and theta
% default len is 9 default theta is 0
PSF1 = fspecial('motion', 20, 15); % blur 20 pixel at 4 degrees
PSF2 = fspecial('motion', 10, 90); % blur 10 pixel at 90 degrees
PSF3 = fspecial('motion', 10, 45); % blur 10 pixel at 45 degrees
figure(1);
subplot(1,3,1); imshow(pixeldup(PSF1, 73), []);
subplot(1,3,2); imshow(pixeldup(PSF2, 73), []);
subplot(1,3,3); imshow(pixeldup(PSF3, 73), []);
% 2. Insert it in lena.bmp
f = imread('lena.bmp');

% now im adding noise too
noise = im2uint8(imnoise(zeros(size(f)), 'gaussian', 0, 0.01));
gb1 = im2uint8(mat2gray(imfilter(f, PSF1, 'circular'))); % filter PSF into f using circular style
gb2 = im2uint8(mat2gray(imfilter(f, PSF2, 'circular'))); % filter PSF into f using circular style
gb3 = im2uint8(mat2gray(imfilter(f, PSF3, 'circular'))); % filter PSF into f using circular style
g1 = gb1 + noise;
g2 = gb2 + noise;
g3 = gb3 + noise;

figure(2);
subplot(1,3,1); imshow(g1);
subplot(1,3,2); imshow(g2);
subplot(1,3,3); imshow(g3);

%% 3. Restoration lena img(deblur) using 3 approach
% 1. Restoration using Direct Inverse Filter Technique
% or what you call deconvwnr function

% Power and Spectrum of noise and image
Sn = abs(fft2(noise)).^2;
nA = sum(Sn(:))/numel(noise);

Sf1 = abs(fft2(f)).^2;
fA1 = sum(Sf1(:))/numel(f);
R1 = nA/fA1;
Sf2 = abs(fft2(f)).^2;
fA2 = sum(Sf2(:))/numel(f);
R2 = nA/fA2;
Sf3 = abs(fft2(f)).^2;
fA3 = sum(Sf3(:))/numel(f);
R3 = nA/fA3;

fri1 = deconvwnr(g1, PSF1, R1);
fri2 = deconvwnr(g2, PSF2, R2);
fri3 = deconvwnr(g3, PSF3, R3);
figure(3);
subplot(1,3,1); imshow(im2uint8(mat2gray(fri1)));
subplot(1,3,2); imshow(im2uint8(mat2gray(fri2)));
subplot(1,3,3); imshow(im2uint8(mat2gray(fri3)));
% 2. Using Auto correlation function
NCORR = fftshift(real(ifft2(Sn))); % shift the inverse of noise power spectrum
ICORR1 = fftshift(real(ifft2(Sf1))); % shift the inverse of image power spectrum
ICORR2 = fftshift(real(ifft2(Sf2)));
ICORR3 = fftshift(real(ifft2(Sf3)));
far1 = deconvwnr(g1, PSF1, NCORR, ICORR1);
far2 = deconvwnr(g2, PSF2, NCORR, ICORR2);
far3 = deconvwnr(g3, PSF3, NCORR, ICORR3);
figure(4);
subplot(1,3,1); imshow(im2uint8(mat2gray(far1)));
subplot(1,3,2); imshow(im2uint8(mat2gray(far2)));
subplot(1,3,3); imshow(im2uint8(mat2gray(far3)));

% 3. Constrainted Least Square
fl1 = deconvreg(g1, PSF1, 0.8, [1e-7 1e7]);
fl2 = deconvreg(g2, PSF2, 0.8, [1e-7 1e7]);
fl3 = deconvreg(g3, PSF3, 0.8, [1e-7 1e7]);
figure(5);
subplot(1,3,1); imshow(im2uint8(fl1));
subplot(1,3,2); imshow(im2uint8(fl2));
subplot(1,3,3); imshow(im2uint8(fl3));