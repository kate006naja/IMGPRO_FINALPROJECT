%% 1
%1.1
clear all;
close all;
f1 = imread('lena.bmp');
%1.2
imwrite(f1, 'lena_jung.jpg');
%1.3
f2 = imread('lena_jung.jpg') ;
imwrite(f2,'lena_jung5.jpg', 'quality',5);
%1.4;
f3 = imread('lena.jpg');
f3 = rgb2gray(f3);
imwrite(f3,'lena_jung_gray.jpg');
%1.5
f4 = fliplr(f3);
imwrite(f4, 'lena_flip1.jpg');
f4 = fliplr(f4);
imwrite(f4, 'lena_flip2.jpg');

%% 4
clear all;
close all;
f = imread('lena.bmp');
fs = f(128-128/2:128+128/2, 128-128/2:128+128/2);
imshow(fs);

%% 5
clear all;
close all;
f = imread('lena.bmp');
fs = imrotate(f, 90);
imshow(fs);

%% 6 
clear all;
close all;
f = imread('lena.bmp');
f(1:5, 1:end) = 0;
f(1:end, 1:5) = 0;
f(end-5:end, 1:end) = 0;
f(1:end, end-5:end) = 0;
imshow(f);

%% 7
clear all;
close all;
f = imread('lena.bmp');
bot = f(end/2:end, 1:end);
top = f(1:end/2, 1:end);
new = [bot;top];
imshow(new);

%% 8
f = imread('lena.bmp');
le_t = f(1:end/2, 1:end/2);
le_b = f(end/2:end, 1:end/2);
ri_t = f(1:end/2, end/2:end);
ri_b = f(end/2:end, end/2:end);
bot = f(end/2:end, 1:end);
top = f(1:end/2, 1:end);
new = [ri_b le_b; ri_t le_t];
imshow(new);

%% 9 
f = imread('lena.bmp');
f(end/4: (end/4)*3, end/4:(end/4)*3) = 255;
imshow(f);

%% 10
f = imread('lena.bmp');
fz = imbinarize(f, 0.6);
imshow(fz);