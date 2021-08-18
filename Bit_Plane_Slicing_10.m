%=========================================================================
% 170104003 Dip Chowdhury
% Bit Plane Slicing:
%=========================================================================
clc;
clear;
close all;
I = imread('cameraman.png');

% Find Bitdepth and max no of colors
z = imfinfo('cameraman.png');
k = z.BitDepth;
L = 2^k;

% Save a copy of Original Image
G = I;
% Convert to grayscale 
I = convert_to_grayscale(I);

% Extract the dimension of the grayscale image
[row,col]=size(I);

% For every k, calculate X, where X=2^k
X = zeros(1,k);
for i=1:k
   X(i)  = 2^(i-1);
end

% Calculate the bitwise and operation for every pixel of the image
for i=1:row,
    for j=1:col,
        bp1(i,j)=bitand(I(i,j),X(1));
        bp2(i,j)=bitand(I(i,j),X(2));
        bp3(i,j)=bitand(I(i,j),X(3));
        bp4(i,j)=bitand(I(i,j),X(4));
        bp5(i,j)=bitand(I(i,j),X(5));
        bp6(i,j)=bitand(I(i,j),X(6));
        bp7(i,j)=bitand(I(i,j),X(7));
        bp8(i,j)=bitand(I(i,j),X(8));
    end
end

% Show the output images for every bit position.
figure(1);
subplot(3,4,1);imshow(G);title('Original');      %Show Bitplane 1 
subplot(3,4,5);imshow(bp1);title('Bitplane 1');     %Show Bitplane 2
subplot(3,4,6);imshow(bp2);title('Bitplane 2');     %Show Bitplane 3
subplot(3,4,7);imshow(bp3);title('Bitplane 3');     %Show Bitplane 4
subplot(3,4,8);imshow(bp4);title('Bitplane 4');     %Show Bitplane 5
subplot(3,4,9);imshow(bp5);title('Bitplane 5');     %Show Bitplane 6
subplot(3,4,10);imshow(bp6);title('Bitplane 6');     %Show Bitplane 7
subplot(3,4,11);imshow(bp7);title('Bitplane 7');     %Show Bitplane 8
subplot(3,4,12);imshow(bp8);title('Bitplane 8');     %Show Bitplane 8

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