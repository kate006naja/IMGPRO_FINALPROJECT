function [img_bb, ocrResults] = getBB(img)
%GETBB Summary of this function goes here
%   Detailed explanation goes here
    ocrResults = ocr(img);

    img_bb = insertObjectAnnotation(img, 'rectangle', ...
                               ocrResults.WordBoundingBoxes, ...
                               ocrResults.WordConfidences);
end

