clear all;
close all;

f = zeros(256,256);
f(128-15:128+15, 128-15:128+15) = 1;
figure(1);
imshow(f);
% 2 freq (high, low)

F = fft2(double(f));
figure(2);
imshow(abs(F), []);
% hard for compute

Fc = fftshift(F);
figure(3);
imshow(abs(Fc), []);
%

S2 = log(1+abs(Fc));
figure(4);
imshow(abs(S2), []);
figure(5);
mesh(abs(F));
%press dynamic make it narrower to see it more clearly

%%
up = ones(128, 256);
low = zeros(128, 256);
bw = [up; low];
figure(1); imshow(bw);

[M, N] = size(bw);
BW = fft2(bw);
sig = 10;
H = lpfilter('gaussian', M, N, sig);
G = H.*BW;
g = real(ifft2(G));
figure(2); imshow(g, []);

PQ = paddedsize(size(bw));
BW1 = fft2(bw, PQ(1), PQ(2));
sig = 10;
H1 = lpfilter('gaussian', PQ(1), PQ(2), 2*sig);
% 2*sig, because the fiter size is now twice the size
% of the filter used without padding

G1 = H1.*BW1;
g1 = real(ifft2(G1));
figure(3); imshow(g1, []);

gc1 = g1(1:size(bw, 1), 1:size(bw, 2));
figure(4); imshow(gc1, []);
%%

f1 = rgb2gray(imread('SQ.png'));
figure(1); imshow(f1);
F1 = abs(fft2(f1));
F1 = fftshift(F1);
figure(2); imshow(F1, []);

f2 = rgb2gray(imread('Reg_0.png'));
figure(3); imshow(f2);
F2 = fft2(f2);
F2 = fftshift(F2);
figure(4); imshow(abs(F2), []);

f3 = rgb2gray(imread('Reg_90.png'));
figure(5); imshow(f3);
F3 = fft2(f3);
F3 = fftshift(F3);
figure(6); imshow(abs(F3), []);

figure(7);
subplot(3,1,1); imshow(F1, []);
subplot(3,1,2); imshow(abs(F2), []);
subplot(3,1,3); imshow(abs(F3), []);

%5
c0 = rgb2gray(imread('c0.png'));
c1 = rgb2gray(imread('c1.png'));
c2 = rgb2gray(imread('c2.png'));
c3 = rgb2gray(imread('c3.png'));
c4 = rgb2gray(imread('c4.png'));
c5 = rgb2gray(imread('c5.png'));

C0 = log(1+abs(fft2(c0)));
C0 = fftshift(C0);
C1 = log(1+abs(fft2(c1)));
C1 = fftshift(C1);
C2 = log(1+abs(fft2(c2)));
C2 = fftshift(C2);
C3 = log(1+abs(fft2(c3)));
C3 = fftshift(C3);
C4 = log(1+abs(fft2(c4)));
C4 = fftshift(C4);
C5 = log(1+abs(fft2(c5)));
C5 = fftshift(C5);

figure(8) % 0 - 2
subplot(3,2,1); imshow(abs(c0), []);
subplot(3,2,2); imshow(C0, []);
subplot(3,2,3); imshow(abs(c1), []);
subplot(3,2,4); imshow(C1, []);
subplot(3,2,5); imshow(abs(c2), []);
subplot(3,2,6); imshow(C2, []);

figure(9) % 3 - 5
subplot(3,2,1); imshow(abs(c3), []);
subplot(3,2,2); imshow(C3, []);
subplot(3,2,3); imshow(abs(c4), []);
subplot(3,2,4); imshow(C4, []);
subplot(3,2,5); imshow(abs(c5), []);
subplot(3,2,6); imshow(C5, []);









