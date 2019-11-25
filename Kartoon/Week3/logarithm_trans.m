f = imread('pout.tif'); imshow(f);
c = 40;
gc = c * log(1 + double(f));
gc1 = im2uint8(mat2gray(gc));
figure, imshow(uint8(gc)), figure, imshow(gc1);