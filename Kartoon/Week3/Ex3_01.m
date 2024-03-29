clear all;

x = uint8(1:255);
y1 = imadjust(x, [0 0.5], [0 1], 0.25);
y2 = imadjust(x, [0 0.5], [0 1], 0.50);
y3 = imadjust(x, [0 0.5], [0 1], 0.75);
y4 = imadjust(x, [0 0.5], [0 1], 5);

plot(x,y1,x,y2,x,y3,x,y4);
legend('gamma = 0.25', 'gamma = 0.50', 'gamma = 0.75', 'gamma = 1.00');

f = imread('pout.tif');
f1 = imadjust(f, [0 0.5], [0 1], 0.25);
f2 = imadjust(f, [0 0.5], [0 1], 0.50);
f3 = imadjust(f, [0 0.5], [0 1], 0.75);
f4 = imadjust(f, [0 0.5], [0 1], 5);

figure(2);
subplot(2,2,1); imshow(f1);
subplot(2,2,2); imshow(f2);
subplot(2,2,3); imshow(f3);
subplot(2,2,4); imshow(f4);
