f = imread('circbw.tif');
w = [0.1 0.1 0.1;
    0.1 0.2 0.1;
    0.1 0.1 0.1];
afterfilter = conv2(double(f), w);
figure(1);
subplot(1,2,1); imshow(f);
subplot(1,2,2); imshow(uint8(afterfilter));

lowresult1 = imfilter(double(f), w, 'conv', 'replicate');
lowresult2 = imfilter(double(f), w, 'corr', 'replicate');

figure(2);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(lowresult1);
subplot(2,2,3); imshow(lowresult2);

hw = [1 1 1;
    1 -8 1;
    1 1 1];

hiresult = imfilter(double(f), hw, 'conv', 'replicate');

figure;
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(uint8(lowresult1));
subplot(2,2,3); imshow(hiresult);

white(1:50, 1:50) = 1;
black(1:50, 1:50) = 0;
blkwht = [black white; white black];

w5 = ones(5);
result1 = imfilter(double(blkwht), w5, 'conv');
result2 = imfilter(double(blkwht), w5, 'conv', 'replicate');
result3 = imfilter(double(blkwht), w5, 'conv', 'symmetric');
result4 = imfilter(double(blkwht), w5, 'conv', 'circular');

figure(3);
subplot(2,3,1); imshow(blkwht);
subplot(2,3,2); imshow(im2uint8(mat2gray(result1)));
subplot(2,3,3); imshow(im2uint8(mat2gray(result2)));
subplot(2,3,4); imshow(im2uint8(mat2gray(result3)));
subplot(2,3,5); imshow(im2uint8(mat2gray(result4)));

