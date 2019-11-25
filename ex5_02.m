% ex5_02.m
% Periodic Noise Reduction by Frequency Domain Filtering

clear all;
close all;
clc;

%f = imread('building.tif');
f = imread('lena.bmp');
figure(1); imshow(f);
sz = size(f); % = 256 x 256

C = [6 32]; % assign locations of noise spectrum
[r, R, S] = imnoise3(sz(1), sz(2), C); % generate periodic noise
figure(2); imshow(r, []); % show periodic noise in spatial domain
figure(3); imshow(S, []); % show locations of noise spectrum

fn = (double(f) + (mat2gray(r).*255))./2; % add noise into an img
figure(4); imshow(fn, [])

PQ = paddedsize(size(fn));
FN = fft2(fn, PQ(1), PQ(2));

FNs = fftshift(FN);
FNlog = log(1 + FNs);
figure(5); imshow(uint8(abs(FNlog)), []); 
% imshow(unint8(abs(log(1 + (fftshift(FN))))))

[H D] = notchfilt('notch', sz(1), sz(2), 5, 8, C);
H1 = fftshift(H);
figure(6); imshow(uint8(H1.*255), []);

g = dftfilt(fn, H);
figure(7); imshow(uint8(g), []);
% if the image doesn't get resroration there is no error in your code 
% it some error variable in notchfilt, try to fix it !