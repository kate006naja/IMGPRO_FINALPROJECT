f = imread('lena.jpg');
imwrite(f, 'lena_jung.jpg');
imwrite(f, 'lena_jung_q.jpg', 'quality', 5);
i = rgb2gray(imread('lena_jung.jpg'));
il = fliplr(i);
imwrite(il, 'lena_5.jpg');