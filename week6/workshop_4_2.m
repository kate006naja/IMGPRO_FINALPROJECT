%% 3.

clear all;
close all;

L1 = [1 2 3;
      7 5 4;
      20 9 12];
L2 = [10 8 2;
     1 4 8;
      5 6 7];
H1 = [2 4 -2;
      5 6 -7;
      -4 -3 -1];  
H2 = [6 8 -9;
      1 -7 -2;
      5 -1 -1];

LF1 = freqz2(L1);
LF2 = freqz2(L2);
HF1 = freqz2(H1);
HF2 = freqz2(H2);

figure(1);
subplot(2,2,1); imshow(L1, []);
subplot(2,2,2); imshow(LF1);
subplot(2,2,3); imshow(L2, []);
subplot(2,2,4); imshow(LF2);

figure(2);
subplot(2,2,1); imshow(H1, []);
subplot(2,2,2); imshow(HF1);
subplot(2,2,3); imshow(H2, []);
subplot(2,2,4); imshow(HF2);

%% 2.
f = imread('lena.bmp');
figure(2); imshow(f);
F = fft2(f);

S = fftshift(log(1+abs(F)));
s = gscale(S);
figure(3);
imshow(S, []);

PQ = paddedsize(size(f));
GGG1 = ifftshift(freqz2(H1, PQ(1), PQ(2)));
GGG2 = ifftshift(freqz2(H2, PQ(1), PQ(2)));


% filtering
gf1 = dftfilt(double(f), GGG1);
gf2 = dftfilt(double(f), GGG2);

figure(4);
subplot(2,2,1); imshow(gf1, []);
subplot(2,2,2); imshow(gf2, []);
subplot(2,2,3); imshow(abs(gf1), []);
subplot(2,2,4); imshow(abs(gf2), []);

%% 3. create lowpass and highpass filter 
% on spatail domain

