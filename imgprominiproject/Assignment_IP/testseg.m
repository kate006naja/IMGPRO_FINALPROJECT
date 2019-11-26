clear all;
close all;

img = imread('./data/217_0.jpg');
img = imresize(img, 0.5);

edge1 = transform_with(img, 'gray_enhance_canny');
[seg1, seg2] = getSegment(img, edge1);

edge2 = transform_with(img, 'gray_c_enhance_canny');
[seg3, seg4] = getSegment(img, edge2);

edge3 = transform_with(img, 'gray_canny');
[seg5, seg6] = getSegment(img, edge3);

edge4 = transform_with(img, 'gray_c_canny');
[seg7, seg8] = getSegment(img, edge4);

edge5 = transform_with(img, 'gray_di');
[seg9, seg10] = getSegment(img, edge5);

edge6 = transform_with(img, 'gray_c_di');
[seg11, seg12] = getSegment(img, edge6);

edge7 = transform_with(img, 'gray_di-er');
[seg13, seg14] = getSegment(img, edge7);

edge8 = transform_with(img, 'gray_c_di-er');
[seg15, seg16] = getSegment(img, edge8);

figure(1),
montage([edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8]);

%figure(2),
%subplot(3, 1, 1); montage([ seg1, seg2, seg3, seg4, seg5, seg6]);
%subplot(3, 1, 2); montage([ seg7, seg8, seg9,seg10, seg11]);
%subplot(3, 1, 3); montage([ seg12, seg13, seg14, seg15, seg16]);
%
gray = rgb2gray(seg3);

test2 = blockmultithres(gray);

figure(), imshow(test2), title('multi-threshold');

%%
figure(), imshow(gray);

[level, metric] = multithresh(gray);
se = strel('disk', 1, 0);

tmp = mat2gray(imclose(imquantize(gray, level), se));

[img_bb, ocr_res] = getBB(tmp);

figure(), imshow(img_bb);