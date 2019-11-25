f = imread('circuit.tif');
nonsf1 = ordfilt2(f, 1, ones(3));
nonsf2 = ordfilt2(f, 5, ones(3));
nonsf3 = ordfilt2(f, 9, ones(3));

figure(4);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(nonsf1);
subplot(2,2,3); imshow(nonsf2);
subplot(2,2,4); imshow(nonsf3);

fn = imnoise(f, 'salt & pepper', 0.2);
mf3 = ordfilt2(fn, 5, ones(3));
mf5 = ordfilt2(fn, 13, ones(5));

mf6 = medfilt2(fn, [5 5], 'symmetric');

figure(5);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(fn);
subplot(2,2,3); imshow(mf3);
subplot(2,2,4); imshow(mf5);

figure(6); imshow(mf6);