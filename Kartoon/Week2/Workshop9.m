f = imread('lena.jpg');
f = rgb2gray(f);
f(60:170, 60:170) = 255;
imshow(f);