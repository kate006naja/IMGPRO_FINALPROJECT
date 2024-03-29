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

f = imread('Fig0306(a)(bone-scan-GE).tif');
g1 = c*log(1+double(f));
gs1 = im2uint8(mat2gray(g1));
% more base more white intensity (brightness)!
g2 = c*log2(1+double(f));
gs2 = im2uint8(mat2gray(g2));
g3 = c*log10(1+double(f));
gs3 = im2uint8(mat2gray(g3));

figure(2);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(gs1);
subplot(2,2,3); imshow(gs2);
subplot(2,2,4); imshow(gs3);

%% Constrast-Stretching Transformation
m = 150; % thresholding
E = 15; % Controlling the slope of the function
m = 128;
% eps = constant in MATLAB
G1 = 1./(1+(m./(double(x)+eps)).^5);
G2 = 1./(1+(m./(double(x)+eps)).^10);
G3 = 1./(1+(m./(double(x)+eps)).^E);
G4 = 1./(1+(m./(double(x)+eps)).^20);
figure(3);
plot(x,G1, x,G2, x,G3, x,G4);
legend('E=5', 'E=10', 'E=15', 'E=20');

G1 = 1./(1+(m./(double(f)+eps)).^5);
G2 = 1./(1+(m./(double(f)+eps)).^10);
G3 = 1./(1+(m./(double(f)+eps)).^15);
G4 = 1./(1+(m./(double(f)+eps)).^20);

GS1 = im2uint8(mat2gray(G1));
GS2 = im2uint8(mat2gray(G2));
GS3 = im2uint8(mat2gray(G3));
GS4 = im2uint8(mat2gray(G4));
figure(4);
subplot(2,2,1); imshow(uint8(GS1));
subplot(2,2,2); imshow(uint8(GS2));
subplot(2,2,3); imshow(uint8(GS3));
subplot(2,2,4); imshow(uint8(GS4));