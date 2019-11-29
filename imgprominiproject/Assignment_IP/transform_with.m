function img = transform_with(img, flag)
%TRANSFORM_WITH Summary of this function goes here
%   Detailed explanation goes here
    
    gray = rgb2gray(img);
    
    gray_c = imcomplement(gray);
    
    gray_enh = histeq(gray);
    
    gray_c_enh = histeq(gray_c);
    
    gray_edge = edge(gray, 'Canny', 0.1);
    
    gray_c_edge = edge(gray_c, 'Canny', 0.1);
    
    se = strel('disk',1,0);
    
    switch flag
        
        % enhance canny
        case 'gray_enhance_canny'
            img = edge(gray_enh, 'Canny', 0.1);
        case 'gray_c_enhance_canny'
            img = edge(gray_c_enh, 'Canny', 0.1);
           
        % gray
        case 'gray'
            img = gray;
        case 'gray_c'
            img = gray_c;
        
        % enhance
        case 'gray_enhance'
            img = gray_enh;
        case 'gray_c_enhance'
            img = gray_c_enh;
        
        % edge
        case 'gray_canny'
            img = gray_edge;
        case 'gray_c_canny'
            img = gray_c_edge;
            

        % dilation
        case 'gray_di'
            img = imdilate(gray_edge, se);
        case 'gray_c_di'
            img = imdilate(gray_c_edge, se);
        
        % erode
        case 'gray_er'
            img = imerode(gray_edge, se);
        case 'gray_c_er'
            img = imerode(gray_c_edge, se);
        
        % dilate - erode
        case 'gray_di-er'
            img = imdilate(gray_edge, se) - imerode(gray_edge, se);
        case 'gray_c_di-er'
            img = imdilate(gray_c_edge, se) - imerode(gray_c_edge, se);
    end

end

