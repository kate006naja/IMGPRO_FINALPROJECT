img = imread('./data/312.jpg');

gray = rgb2gray(img);

[level, metric] = multithresh(gray);
se = strel('disk', 1, 0);

tmp = mat2gray(imerode(imquantize(gray, level), se));

figure(), imshow(tmp);

[img_bb, ocr_res] = getBB(tmp);

figure(), imshow(img_bb)

tmp2 = blockmultithres(gray);

figure(),
imshow(im2bw(tmp2));

