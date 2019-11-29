img = imread('./data/151.jpg');

% find edge and segment.
edge1 = transform_with(img, 'gray_enhance_canny');
[seg1, seg2] = getSegment(img, edge1);

% segmented to gray.
gray_seg = rgb2gray(img);

res = getResult(gray_seg);

figure(),
imshow(img), title('Original');

figure(),
imshow(res{1}), title(res{2}),

