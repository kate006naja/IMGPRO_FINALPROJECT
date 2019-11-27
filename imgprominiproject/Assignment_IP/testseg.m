clear all;
close all;

img = imread('./data/312.jpg');
%img = imresize(img, 0.5);

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

figure(2),
subplot(5, 2, 1); imshow(img);
subplot(5, 2, 2); imshow(seg1);
subplot(5, 2, 3); imshow(seg2);
subplot(5, 2, 4); imshow(seg3);
subplot(5, 2, 5); imshow(seg4);
subplot(5, 2, 6); imshow(seg5);
subplot(5, 2, 7); imshow(seg6);
subplot(5, 2, 8); imshow(seg7);
subplot(5, 2, 9); imshow(seg8);
subplot(5, 2, 10); imshow(seg9);
figure(3),
subplot(4, 2, 1); imshow(seg10);
subplot(4, 2, 2); imshow(seg11);
subplot(4, 2, 3); imshow(seg12);
subplot(4, 2, 4); imshow(seg13);
subplot(4, 2, 5); imshow(seg14);
subplot(4, 2, 6); imshow(seg15);
subplot(4, 2, 7); imshow(seg16);
%, seg4 , seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13, seg14, seg15, seg16

%% Testing After we got perfect piece


%% Perfect For every pictures except VOLVO and HAIR
gray = rgb2gray(seg3);
test2 = blockmultithres(gray);

figure(), imshow(test2), title('multi-threshold');


figure(), imshow(gray);

[level, metric] = multithresh(gray);
se = strel('disk', 1, 0);
figure(); imshow(level);
tmp = mat2gray(imerode(imquantize(gray, level), se));

[img_bb, ocr_res] = getBB(tmp);

figure(), imshow(img_bb);

%%
gray = adapthisteq(gray);

test2 = blockmultithres(gray);

figure(), imshow(test2), title('multi-threshold');


figure(), imshow(gray);

[level, metric] = multithresh(gray);
se = strel('disk', 1, 0);
figure(); imshow(level);
tmp = mat2gray(imerode(imquantize(gray, level), se));

[img_bb, ocr_res] = getBB(tmp);

figure(), imshow(img_bb);
%% 
se = strel('disk', 1,0);
gray = rgb2gray(seg3);
gray = adapthisteq(gray);
gray = imopen(imerode(gray, se),se);

gray_imadjust = imadjust(gray);
gray_histeq = histeq(gray);
grayadp = adapthisteq(gray);
figure();
montage([gray,gray_imadjust,gray_histeq,grayadp])
%gray = imbinarize(gray, 0.34);
%figure; imshow(gray);