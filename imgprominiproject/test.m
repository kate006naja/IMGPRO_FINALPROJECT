clear all;
clc;
%close all;
f1 = imread('356.jpg');
sign1 = ocr(f1);
rectext1 = sign1.Text;
figure(1); 
imshow(f1);
text(200, 350, rectext1, 'BackgroundColor', [1 1 1]);

%% Kong
clear all;
f1 = imread('356.jpg');
sign1 = ocr(f1);
word =  sign1.Words{5}
wordBox = sign1.WordBoundingBoxes(5, :)
name = insertObjectAnnotation(f1, 'rectangle', wordBox, word);
imshow(name);

%% 
clear all;
f1 = imread('100.jpg');
f11 = rgb2gray(f1);
figure(1);
subplot(1,2,1); imshow(f1);
subplot(1,2,2); imshow(f11);

%% test keypad
clear all;
close all;
clc;
I = imread('keypad.jpg');
I = rgb2gray(I);
figure;
imshow(I)
results = ocr(I);
results = ocr(I, 'TextLayout', 'Block');
results.Text

BW = imbinarize(I);
figure(1); imshowpair(I, BW, 'montage');

% Remove Keypad background
Icorrected = imtophat(I, strel('disk', 15));

BW1 = imbinarize(Icorrected);
figure(2); imshowpair(Icorrected, BW1, 'montage')

% Perform morphological reconstruction and show binarized image.
marker = imerode(Icorrected, strel('line',10,0));
Iclean = imreconstruct(marker, Icorrected);

BW2 = imbinarize(Iclean);
figure(3); imshowpair(Iclean, BW2, 'montage');
results = ocr(BW2, 'TextLayout', 'Block');
results.Text

% make regex \d which match any digit
regularExpr = '\d';
% Get Boundibg boxes around text
bboxes = locateText(results, regularExpr, 'UseRegexp', true);
digits = regexp(results.Text, regularExpr, 'match');

% draw boxes around digits
Idigits = insertObjectAnnotation(I, 'rectangle', bboxes, digits);
figure(4); imshow(Idigits);

% use the 'CharacterSet' parameter to constrain OCR
results = ocr(BW2, 'CharacterSet', '0123456789', 'TextLayout', 'Block');
results.Text

% Sort the character confidences.
[sortedConf, sortedIndex] = sort(results.CharacterConfidences, 'descend');

% Keep indices associated with non-NaN confidences values.
indexesNaNsRemoved = sortedIndex( ~isnan(sortedConf) );

% Get the top ten indexes.
topTenIndexes = indexesNaNsRemoved(1:10);

% Select the top ten results.
digits = num2cell(results.Text(topTenIndexes));
bboxes = results.CharacterBoundingBoxes(topTenIndexes, :);

Idigits = insertObjectAnnotation(I,'rectangle',bboxes,digits);

figure(5); 
imshow(Idigits);

% Initialize the blob analysis System object(TM).
blobAnalyzer = vision.BlobAnalysis('MaximumCount',500);

% Run the blob analyzer to find connected components and their statistics.
[area,centroids,roi] = step(blobAnalyzer,BW1);

% Show all the connected regions.
img = insertShape(I,'rectangle',roi);
figure(6);
imshow(img);

areaConstraint = area > 300;
% Keep regions that meet the are constraint.
roi = double(roi(areaConstraint, :));

% Show remaining blobs after applying the area constraint.
img = insertShape(I, 'rectangle', roi);
figure(7); imshow(img);

% Compute the aspect ratio.
width  = roi(:,3);
height = roi(:,4);
aspectRatio = width ./ height;

% An aspect ratio between 0.25 and 1 is typical for individual characters
% as they are usually not very short and wide or very tall and skinny.
roi = roi( aspectRatio > 0.25 & aspectRatio < 1 ,:);

% Show regions after applying the area and aspect ratio constraints.
img = insertShape(I,'rectangle',roi);
figure(8);
imshow(img);

roi(:,1:2) = roi(:,1:2) - 4;
roi(:,3:4) = roi(:,3:4) + 8;
results = ocr(BW1, roi,'TextLayout','Block');

text = deblank( {results.Text} );
img  = insertObjectAnnotation(I,'rectangle',roi,text);

figure(9); 
imshow(img)
