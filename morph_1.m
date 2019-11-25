clear all;
utk = imread('utk.tif');
gt = imread('gt.tif');
figure(1); imshow(utk);
figure(2); imshow(gt);

% compliment
comp_utk = ~utk;
figure(3); imshow(comp_utk);

AorB = utk | gt; % A union B
AandB = utk & gt; % A intersection B
AanddifB = utk & ~gt; % A - B
figure(4); imshow(AorB);
figure(5); imshow(AandB);
figure(6); imshow(AanddifB);

%% dilation
clear all;
A = imread('broken-text.tif');
B = [0 0 1;
     0 1 0;
     1 0 0]; % you can do 3x3 4x4 or whatever you want
 %B2 = 
A2 = imdilate(A, B);
figure(1); imshow(A);
figure(2); imshow(A2);

%% Erosion
clear all;
A = imread('wirebond-mask.tif');
se1 = strel('disk', 10);
A1 = imerode(A, se1);
se2 = strel('disk', 5);
A2 = imerode(A, se2);
se3 = strel('disk', 20); % if the radius bigger there will be more erode
A3 = imerode(A, se3);
figure(1);
subplot(2, 2, 1); imshow(A);
subplot(2, 2, 2); imshow(A1);
subplot(2, 2, 3); imshow(A2);
subplot(2, 2, 4); imshow(A3);

%% Opening and Closing
clear all;
close all;
f = imread('noisy-fingerprint.tif');
se = strel('square', 3);

fo = imopen(f, se);
foc = imclose(fo, se);

figure(1);
subplot(1, 3, 1); imshow(f);
subplot(1, 3, 2); imshow(fo);
subplot(1, 3, 3); imshow(foc);

%% Hit-or-Miss Transformation
% ITP Function: bwhitmiss
clear all;
f = imread('small-squares.tif');
figure(1); imshow(f);

% he want to detect square in image
B1 = strel([0 0 0;
            1 1 0;
            0 1 0]);

B2 = strel([1 1 1;
            0 0 1;
            0 0 1]);
g = bwhitmiss(f, B1, B2);
figure(2); imshow(g, [])

%% Hit-or-Miss 2
% ITP function: bwmorph
clear all;
f = imread('noisy-fingerprint.tif');
se = strel('square', 3);
fo = imopen(f, se);
foc = imclose(fo, se);
g1 = bwmorph(foc, 'thin', 1);
g2 = bwmorph(foc, 'thin', 2);
ginf = bwmorph(foc, 'thin', inf);
figure(1);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(foc);
subplot(2, 2, 3); imshow(g1);
subplot(2, 2, 4); imshow(g2);
figure(2); imshow(ginf)