clear all;
close all;

img = imread('./data/151.jpg');
%warning('off', 'images:initSize:adjustingMag')

% find edge and segment.
edge1 = transform_with(img, 'gray_enhance_canny');
[seg1, seg2] = getSegment(img, edge1);

% segmented to gray.
gray_seg = rgb2gray(seg1);
%gray_seg = adapthisteq(gray_seg);

% se = strel('disk', 5);
% gray_seg = imclose(gray_seg, se);
res = getResult(gray_seg);

figure(),
imshow(img), title('Original');

figure(),
imshow(res{1}), title(res{2}),

