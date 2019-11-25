f = imread('lena.jpg');
n = fix(size(f,1)/2);
top = f(1:n, :, :);
bottom = f(n+2:end, :, :);

f(1:n, :, :) = bottom;
f(n+2:end, :, :) = top;
imshow(f);
% im=imread('lena.jpg')
% n=fix(size(im,1)/2)
% A=im(1:n,:,:);
% B=im(n+1:end,:,:)
% imshow(A)
% figure
% imshow(B)