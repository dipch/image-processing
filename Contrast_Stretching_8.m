% 170104003 Dip Chowdhury-
clc;
clear all;
close all;
I = imread('cameraman.png');
[row,col]=size(I);
G = I;

% Convert to Grayscale (if necessary)
if(size(I,3)>1)
    I=rgb2gray(I);
    disp('Converted to grayscale image');
end


% Convert from uint8 to double
I = im2double(I);

% Find minimum, maximum value of the input image and store
A = min(I(:));
B = max(I(:));

% Store the difference of min and max 
D = B-A;

% Find bitdepth of input image
z = imfinfo('cameraman.png');
q = z.BitDepth;



% Stretching
R = ((I-A)*q)/D;

% Convert to uint8
R = uint8(R);


% Histogram manually
X=zeros(1,256);
for i=1:row
    for j=1:col
        temp=G(i,j);
        X(temp)=X(temp)+1;   
    end
end

% stretched_Image = imadjust(I, stretchlim(I, [0.05, 0.95]),[]);
subplot(2,2,1), imshow(G), title('Original Image');
subplot(2,2,2), imshow(R), title('Strethced Image');
subplot(2,2,3), imhist(G), title('Histogram of Original Image'), xlabel('pixel values'),ylabel('frequency');
%subplot(2,2,4), imhist(R), title('Histogram of Stretched Image');
subplot(2,2,4), bar(X), title('Histogram of Stretched Image'), xlabel('1 to 256 pixel values'),ylabel('frequency');

% x = 1900:10:2000;
% y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
% bar(x,y)
%bar width
% y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
% bar(y,0.4)
%color
% y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
% bar(y,'r')
% color
% y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
% bar(y,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)