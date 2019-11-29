img = imread('./data/312.jpg');

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

% figure(),
% montage({edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8});

% figure(),
% montage({img, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13, seg14, seg15, seg16});

gray = rgb2gray(seg1);

test2 = blockmultithres(gray);

% figure(), imshow(test2), title('multi-threshold');


starty = 480;
width = 200;
gray = gray(60:220, 1:end);

h = fspecial('prewitt');
se = strel('disk', 1, 0);

test = mat2gray(im2bw(gray, 0.2));

% figure(), imshow(imerode(test, se));

%
width = 200;
gray = rgb2gray(seg1);

cap = gray(60:220, 480:min(y+width, size(gray, 2)));
cap = mat2gray(regiongrowing(im2double(cap), 80, 100, 0.071));
% [img_bb, ocr_res] = getBB(cap);
figure(), imshow(cap);

% for y = 480:10:size(gray, 2)
%     cap = gray(60:220, y:min(y+width, size(gray, 2)));
%     cap = mat2gray(regiongrowing(im2double(cap), 80, 100, 0.071));
%     try
%         [img_bb, ocr_res] = getBB(cap);
%         figure(), imshow(img_bb);
%     catch ME
%         continue
%     end
% end

figure(), imshow(img_bb);
close all;
%%
[level, metric] = multithresh(gray);

tmp = mat2gray(imerode(imfilter(gray, h), se));



[img_bb, ocr_res] = getBB(tmp);

figure(), imshow(img_bb);

bb = ocr_res.WordBoundingBoxes(1, :);
x1 = bb(2);
x2 = bb(4);
y1 = bb(1);
y2 = bb(3);

test = gray(x1-10:x1+x2+10, y1-300:y1+y2+100);

figure(), imshow(test);

[img_bb, ocr_res] = getBB(test);

figure(), imshow(img_bb);