clear all;
close all;

%% Logarithm Transformation

x = uint8(1:255);
c = 1;
gp1 = c*log(1+double(x));
gp2 = c*log2(1+double(x));
gp3 = c*log10(1+double(x));
figure(1);
plot(x,gp1, x,gp2, x,gp3);
legend('Natural Log', 'base-2 Log', 'base-10 Log');

f = imread('Fig0303(a)(breast).tif');
g1 = c*log(1+double(f));
gs1 = im2uint8(mat2gray(g1));
g2 = c*log2(1+double(f));
gs2 = im2uint8(mat2gray(g2));
g3 = c*log10(1+double(f));
gs3 = im2uint8(mat2gray(g3));

figure(2);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(gs1);
subplot(2,2,3); imshow(gs2);
subplot(2,2,4); imshow(gs3);

%% Contrast Stretching Transformation
m = 150; % Thresholding
E = 15; % Controlling the slope of the function
m = 128
G0 = 1./(1+(m./(double(x)+eps)).^1);
G1 = 1./(1+(m./(double(x)+eps)).^5);
G2 = 1./(1+(m./(double(x)+eps)).^10);
G3 = 1./(1+(m./(double(x)+eps)).^E);
G4 = 1./(1+(m./(double(x)+eps)).^20);
figure(3);
plot(x,G0, x,G1, x,G2, x,G3, x,G4);
legend('E = 1', 'E = 5', 'E = 10', 'E = 15', 'E = 20');

G0 = 1./(1+(m./(double(f)+eps)).^1);
G1 = 1./(1+(m./(double(f)+eps)).^5);
G2 = 1./(1+(m./(double(f)+eps)).^10);
G3 = 1./(1+(m./(double(f)+eps)).^E);
G4 = 1./(1+(m./(double(f)+eps)).^20);

GS0 = uint8(im2uint8(mat2gray(G0)));
GS1 = uint8(im2uint8(mat2gray(G1)));
GS2 = uint8(im2uint8(mat2gray(G2)));
GS3 = uint8(im2uint8(mat2gray(G3)));
GS4 = uint8(im2uint8(mat2gray(G4)));
figure(4);
subplot(3,2,1); imshow(f);
subplot(3,2,2); imshow(GS0);
subplot(3,2,3); imshow(GS1);
subplot(3,2,4); imshow(GS2);
subplot(3,2,5); imshow(GS3);
subplot(3,2,6); imshow(GS4);