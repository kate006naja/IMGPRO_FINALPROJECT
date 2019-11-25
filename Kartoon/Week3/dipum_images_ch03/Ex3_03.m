% clear all;
% close all;
% 
% f = imread('pollen.tif');
% imshow(f);
% figure, imhist(f)
% ylim('auto')
% g = histeq(f, 256);
% figure, imshow(g)
% figure, imhist(g)
% ylim('auto')
% 
% hnorm = imhist(f)./numel(f);
% cdf = cumsum(hnorm);
% x = linspace(0,1,256);
% figure, plot(x, cdf)
% axis([0 1 0 1])
% set(gca, 'xtick', 0:0.2:1)
% set(gca, 'ytick', 0:0.2:1)
% xlabel('Input intensity values', 'fontsize', 9)
% ylabel('Output intensity values', 'fontsize', 9)
% text(0.18, 0.5, 'Transformation function', 'fontsize', 9)

clear all;
close all;

f = imread('Moonphobos.tif');
imshow(f);
figure, imhist(f)
ylim('auto')
g = histeq(f, 256);
figure, imshow(g)
figure, imhist(g)
ylim('auto')

p = manualhist
plot(1:256, p);
g1 = histeq(f, p);
figure, imshow(g1);
figure, imhist(g1);
