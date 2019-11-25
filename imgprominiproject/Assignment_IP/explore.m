img1 = imread('./data/100.jpg');
img2 = imread('./data/151.jpg');
img3 = imread('./data/217.jpg');
img4 = imread('./data/312.jpg');
img5 = imread('./data/356.jpg');

figure(),
montage({img1, img2, img3, img4, img5})