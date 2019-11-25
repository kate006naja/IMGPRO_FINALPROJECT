f = imread('lena.jpg');
% f = rgb2gray(f);
f = im2bw(f, 0.6);
imshow(f);