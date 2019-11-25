% ex5_01.m

%%
% Generating Spatial Random Noise
clear all;
close all;
clc;
f = imread('lena.bmp');

M = 256;
N = 256;
a = 0.5;
b = 1;

% 0.5 + sqrt(1*log(1-rand(256, 256)));
R = a + sqrt(b*log(1-rand(M, N))); % Rayleigh CDF
figure, imshow(uint8(abs(R)), []); % Noise with a specified Distribution

pause;
%%
clear all;
close all;
clc;
C = [ 0 64;
      0 128;
     32 32;
     64 0;
    128 0;
    -32 32];
[r, R, S] = imnoise3(512, 512, C);
figure, imshow(S, []);
figure, imshow(r, []);

pause;
%%
clear all;
close all;
clc;

C = [0 32;
     0 64;
    16 16;
    32 0;
    64 0;
   -16 16];
[r, R, S] = imnoise3(512, 512, C);
figure, imshow(S, []);
figure, imshow(r, []);

pause;
