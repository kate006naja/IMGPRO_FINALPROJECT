%% intensity transformation
I = imread('tire.tif');
J1 = imadjust(I, [], [], 1);
J2 = imadjust(I, [], [], 3);
J3 = imadjust(I, [], [], 0.4);
figure(1);
subplot(2,2,1); imshow(I);
subplot(2,2,2); imshow(J1);
subplot(2,2,3); imshow(J2);
subplot(2,2,4); imshow(J3);

%% logarithm transformation
clear all;
I = imread('tire.tif');
I2 = im2double(I);

% g =c*log(1+double(f))
% c is range of the log function
% uint8 c = 255/log(1+255) but double c =1/log(1+1)
J1 = 1*log(1+I2);
J2 = 2*log(1+I2);
J3 = 5*log(1+I2);
figure();
subplot(2,2,1); imshow(J1);
subplot(2,2,2); imshow(J2);
subplot(2,2,3); imshow(J3);

%% in pdf logarithm trasformation
clear all;
close all;
f = imread('Fig0305(a)(spectrum).tif');
c = 1;
gc = c*log(1+double(f));
gc1 = im2uint8(mat2gray(gc)); % decompress to the full range of the display
figure; imshow(f), figure, imshow(gc1);
%% Contrast stretching transformation
clear all;
close all;
I = imread('tire.jpg');
I2 = im2double(I);

% g = 1./(1 + (m./(double(f) + eps)).^E)
% m = mean2(I2); % mean of matrix (use to calculate in equation)
% or mid line

% we control E by ourself
% E control the slope of the function
%applying m by ourself
c1 = 1./(1 + (0.2./(I2 + eps)).^4);
c2 = 1./(1 + (0.5./(I2 + eps)).^4);
c3 = 1./(1 + (0.7./(I2 + eps)).^4);
figure();
subplot(2,2,1); imshow(I2);
subplot(2,2,2); imshow(c1);
subplot(2,2,3); imshow(c2);
subplot(2,2,4); imshow(c3);