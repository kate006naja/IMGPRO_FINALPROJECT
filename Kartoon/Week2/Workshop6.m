f = imread('lena.jpg');
f = rgb2gray(f);
f(1:10, 1:end) = 0;
f(1:end, 1:10) = 0;
f(end-10:end, 1:end) = 0;
f(1:end, end-10:end) = 0;
imshow(f)