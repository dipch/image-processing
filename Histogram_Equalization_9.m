%=========================================================================
% 170104003 Dip Chowdhury
% Histogram Equalization:
%=========================================================================
clc;
clear all;
close all;
I = imread('cameraman.png');
B = imread('test.jpg');
% Find Bitdepth and max no of colors
z = imfinfo('cameraman.png');
q = z.BitDepth;
L = 2^q;

z = imfinfo('cameraman.png');
q = z.BitDepth;
L1 = 2^q;
% Save a copy of Original Image
G = I;
V = B;
% Convert to grayscale 
I = convert_to_grayscale(I);
B = convert_to_grayscale(B);

% Equalize Histogram
[non_hist_eq_image, hist_eq_image, hist_input, hist_output] = equalize_histogram(I, L);
[non_hist_eq_image1, hist_eq_image1, hist_input1, hist_output1] = equalize_histogram(B, L1);

%Show Image and Histogram
% builtin = imhist(R)
subplot(4,3,2), imshow(non_hist_eq_image), title('Input Image');
subplot(4,3,3), imshow(hist_eq_image), title('Output Image');
subplot(4,3,5), bar(hist_input), title('Histogram of Input Image'), xlabel('pixel values'),ylabel('frequency');
subplot(4,3,6), bar(hist_output), title('Histogram of Output Image'), xlabel('pixel values'),ylabel('frequency');

subplot(4,3,7), imshow(V), title('Bonus RGB Image');
subplot(4,3,8), imshow(non_hist_eq_image1), title('Input Image');
subplot(4,3,9), imshow(hist_eq_image1), title('Output Image');
subplot(4,3,11), bar(hist_input1), title('Histogram of Input Image'), xlabel('pixel values'),ylabel('frequency');
subplot(4,3,12), bar(hist_output1), title('Histogram of Output Image'), xlabel('pixel values'),ylabel('frequency');






%=========================================================================
% Function for Histogram Equalization
function [non_hist_eq_image, hist_eq_image, hist_input, hist_output] = equalize_histogram(input_image, max_no_of_colors)
    non_hist_eq_image = input_image;
    % rowXcol of input image
    [row,col]=size(input_image);
    % Histogram manually
    hist_input = create_histogram(input_image, max_no_of_colors);
    % Total no of pixels in input image
    TNOP = row*col;
    % Calculate Probabillity Distribution Function 
    % PDF = no of pixels for each level/ total no of pixels
    PDF = hist_input/TNOP;
    % Compute Cumulative Distribution Function CDF=Cumulative sum of PDF
    %CDF2 = cumsum(PDF)   %using builtin func
    temp = 0;
    for i=1:max_no_of_colors
        temp = temp + PDF(i);
        CDF(i) = temp;
    end
    % (L-1)CDF % L=Bitdepth 
    % Store Highest possible intensity value = ((2^bitdepth) -1)
    S = (max_no_of_colors-1)*CDF;
    %Round float value to int value
    S = round(S);
    % Map to output image
    hist_eq_image = uint8(zeros(row, col));
    for i=1:row
        for j=1:col
            hist_eq_image(i,j)=S(input_image(i,j)+1);
        end
    end
    % Create Histogram 
    hist_output = create_histogram(hist_eq_image, max_no_of_colors);
end

%=========================================================================
% Function for Histogram (manually)
function count = create_histogram(input_image, max_no_of_colors)
    count=zeros(1,max_no_of_colors);
    for i=0:max_no_of_colors-1
        count(i+1)=sum(sum(input_image==i));
    end
end

%=========================================================================
% Function for Converting RGB image to Grayscale (if necessary)
function I = convert_to_grayscale(input_image)
    if(size(input_image,3)>1)
        I = rgb2gray(input_image);
        %disp('Converted to grayscale image');
    else
        I = input_image;
    end
end