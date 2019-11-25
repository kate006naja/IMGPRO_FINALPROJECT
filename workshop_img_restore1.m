%% 1.
clear all;
f = [20 21 25 24 24;
     21 255 26 0 25;
     27 26 28 29 29;
     25 25 0 28 30;
     26 27 28 30 30];
f1 = adpmedian(f, 3);
% I guess
%% 2. Create 3 Periodic Noise on Frequency Domain 
clear all;
f = imread('lena.bmp');
sz = size(f);
[r1, R1, S1] = imnoise3(sz(1), sz(2), [30 62]);
[r2, R2, S2] = imnoise3(sz(1), sz(2), [62 30]);
[r3, R3, S3] = imnoise3(sz(1), sz(2), [24 24]);
figure;
subplot(1,3,1); imshow(S1, []);
subplot(1,3,2); imshow(S2, []);
subplot(1,3,3); imshow(S3, []);
pause;
%% 3. Adding Noise on Frequency Domain using lena.bmp
clear all;
f = imread('lena.bmp');
sz = size(f);
[r1, R1, S1] = imnoise3(sz(1), sz(2), [70 20]);
[r2, R2, S2] = imnoise3(sz(1), sz(2), [24 62]);
[r3, R3, S3] = imnoise3(sz(1), sz(2), [24 24]);
% Adding Noise using seperate r
fn1 = (double(f) + (mat2gray(r1).*255))./2;
fn2 = (double(f) + (mat2gray(r2).*255))./2;
fn3 = (double(f) + (mat2gray(r3).*255))./2;
PQ = paddedsize(size(fn1));

FN1 = fft2(fn1, PQ(1), PQ(2)); FNs1 = fftshift(FN1);
FN2 = fft2(fn2, PQ(1), PQ(2)); FNs2 = fftshift(FN2);
FN3 = fft2(fn3, PQ(1), PQ(2)); FNs3 = fftshift(FN3);
FNf1 = uint8(abs(log(1 + FNs1)));
FNf2 = uint8(abs(log(1 + FNs2)));
FNf3 = uint8(abs(log(1 + FNs3)));
figure;
subplot(1,3,1); imshow(FNf1, []);
subplot(1,3,2); imshow(FNf2, []);
subplot(1,3,3); imshow(FNf3, []);
pause;
%% 4. Get rid of Noise!!
clear all;
f = imread('lena.bmp');
sz = size(f);
[r1, R1, S1] = imnoise3(sz(1), sz(2), [70 20]);
[r2, R2, S2] = imnoise3(sz(1), sz(2), [24 62]);
[r3, R3, S3] = imnoise3(sz(1), sz(2), [24 24]);
% Adding Noise using seperate r
fn1 = (double(f) + (mat2gray(r1).*255))./2;
fn2 = (double(f) + (mat2gray(r2).*255))./2;
fn3 = (double(f) + (mat2gray(r3).*255))./2;
PQ = paddedsize(size(fn1));

FN1 = fft2(fn1, PQ(1), PQ(2)); FNs1 = fftshift(FN1);
FN2 = fft2(fn2, PQ(1), PQ(2)); FNs2 = fftshift(FN2);
FN3 = fft2(fn3, PQ(1), PQ(2)); FNs3 = fftshift(FN3);
FNf1 = uint8(abs(log(1 + FNs1)));
FNf2 = uint8(abs(log(1 + FNs2)));
FNf3 = uint8(abs(log(1 + FNs3)));
figure;
subplot(1,3,1); imshow(FNf1, []);
subplot(1,3,2); imshow(FNf2, []);
subplot(1,3,3); imshow(FNf3, []);

% Making Filter using all cause of noise
[h1 D1] = notchfilt('notch', sz(1), sz(2), 5, 8, [70 20]);
H1 = fftshift(h1);
[h2 D2] = notchfilt('notch', sz(1), sz(2), 5, 8, [24 62]);
H2 = fftshift(h2);
[h3 D3] = notchfilt('notch', sz(1), sz(2), 5, 8, [24 24]);
H3 = fftshift(h3);
% I'm not sure this call filter or convwolution or just multiply
g1 = uint8(dftfilt(fn1, h1));
g2 = uint8(dftfilt(fn2, h2));
g3 = uint8(dftfilt(fn3, h3));

figure;
subplot(2,3,1); imshow(H1, []);
subplot(2,3,2); imshow(H2, []);
subplot(2,3,3); imshow(H3, []);
subplot(2,3,4); imshow(g1, []);
subplot(2,3,5); imshow(g2, []);
subplot(2,3,6); imshow(g3, []);
pause;