f = imread('lena.bmp');

w1 = fspecial('laplacian', 0);
w2 = fspecial('sobel');
w3 = fspecial('prewitt');

sf1 = imfilter(f, w1, 'conv');
sf2 = imfilter(f, w2, 'conv');
sf3 = imfilter(f, w3, 'conv');

figure(7);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(sf1);
subplot(2,2,2); imshow(sf2);
subplot(2,2,2); imshow(sf3);