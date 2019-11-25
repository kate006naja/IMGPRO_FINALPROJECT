% ex4_06.m

% Plotting highpass filter
clear all;
close all;

f = imread('chestXray.tif');
PQ = paddedsize(size(f));
D0 = 0.02 + PQ(1);
H1 = hpfilter('btw', PQ(1), PQ(2), D0);
g = dftfilt(double(f), H1);
figure(1);
subplot(1,2,1); imshow(f, []);
subplot(1,2,2); imshow(g, []);

figure(2);
mesh(fftshift(H1));
axis([0 1000 0 1000 0 1]);