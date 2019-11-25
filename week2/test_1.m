%% converting between image classes and type
f = [-0.5 0.5; 0.75 1.5]
g = im2uint8(f) % in int turn in range 0 -255
g1 = mat2gray(f) % mat2gray(f, [fmin, fmax]);
h = uint8([25 50; 128 200])
g2 = im2double(h)

f = [1 2; 3 4]
g = mat2gray(f)
gb = im2bw(g, 0.6) % threshod turning point to white(or black ??) is 0.6
gb1 = f>2
gbv = islogical(gb)
%% converting between image classes and types
gbd = im2double(gb);
gbd1 = im2double(im2bw(mat2gray(f), 0.6));
gbd2 = double(f>2);
%% Array indexing
v = [1 3 5 7 9];
%% MATRIX
A = [1 2 3; 4 5 6; 7 8 9];
%% lena in matrix indexing test
clear all;
close all;
f = imread('lena.bmp');
fp = f(end:-1:1, :);
figure; imshow(fp)
%[f(start end(up and down), start end(left and right))]
fc = f(100:250, 60:220);
imshow(fc);
fs = f(1:2:end, 1:2:end);
imshow(fs)
plot(f(128, :))
%% Selecting Array Dimensions
A = [1 2 3; 4 5 6; 7 8 9];
k = size(A, 1);
d = ndims(A)
%% m-function
help improd
f = [1 2;3 4];
g = [1 2;2 1];
[p, pmax, pmin, pn] = improd(f, g);