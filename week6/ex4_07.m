% ex4_07.m

% PLotting highpass filters

clear all;

f = imread('chestXray.tif');
% f = imread('mri.tif')

PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
HBW = hpfilter('ideal', PQ(1), PQ(2), D0, 2);
H = 0.9 + 10*HBW;
gbw = dftfilt(double(f), HBW);
gbwl = gscale(gbw);
ghf = dftfilt(double(f), H);
ghfl = gscale(ghf);
ghe = histeq(ghfl, 256);

figure(1); imshow(f, []);
figure(2); imshow(gbwl, []);
figure(3); imshow(ghfl, []);
figure(4); imshow(ghe, []);