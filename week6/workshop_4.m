%% 1.
clear all;
close all;

h1 = [-1 -1 -1;
    -1 8 -1;
    -1 -1 -1];

h2 = [1 1 1;
    1 -8 1;
    1 1 1];

h3 = [1 1 0;
    1 0 1;
    0 1 1];

figure(1);
subplot(2,2,1); freqz2(h1);
subplot(2,2,2); freqz2(h2);
subplot(2,2,3); freqz2(h3);
%% 2.
f = imread('lena.bmp');
figure(2); imshow(f);
F = fft2(f);

S = fftshift(log(1+abs(F)));
s = gscale(S);
figure(3);
imshow(S, []);

PQ = paddedsize(size(f));
H1 = ifftshift(freqz2(h1, PQ(1), PQ(2)));
H2 = ifftshift(freqz2(h2, PQ(1), PQ(2)));
H3 = ifftshift(freqz2(h3, PQ(1), PQ(2)));

% filtering
gf1 = dftfilt(double(f), H1);
gf2 = dftfilt(double(f), H2);
gf3 = dftfilt(double(f), H3);

figure(4);
subplot(3,2,1); imshow(gf1, []);
subplot(3,2,3); imshow(gf2, []);
subplot(3,2,5); imshow(gf3, []);
subplot(3,2,2); imshow(abs(gf1), []);
subplot(3,2,4); imshow(abs(gf2), []);
subplot(3,2,6); imshow(abs(gf3), []);

%% 3. create lowpass and highpass filter 
% on spatail domain

