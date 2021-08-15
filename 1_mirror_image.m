% Assignment 1
% Dip Chowdhury
%====================================================================================
% without using loop
% 1. Import Picture
I= imread('input.jpg');
figure;
imshow(I);
%====================================
% 2. Create a mirror image
[row, col, cha] = size(I);
[r, c, ch] = size(I);
K= uint8(ones(row,col,cha));
K= uint8(ones(row,col,cha));
K(1:row,1:col,:)= I(1:row, col:-1:1, :);
figure;
imshow(K);
%====================================
% 3. Merge the two images
J= uint8(ones(row,col*2,cha));
J(1:row, 1:col,:)=K(:,:,:);
J(1:row,col+1:col*2,:)=I(:,:,:);
figure;
imshow(J);
imwrite(J, 'output.jpg')



%==================================================================================
% Alternate Method using loop
I= imread('input.jpg');
%figure;
%imshow(I);
[row, col, cha] = size(I);
[r, c, ch] = size(I);
K= uint8(ones(row,col*2,cha));
for m=1:row
    for n=1:400
        for o=1:cha 
            K(m,n,o)=I(m,n,o);
        end
    end
end
for m=1:row
    c=400;
    for n=401:800
        for o=1:cha 
            K(m,n,o)=I(m,c,o);
        end
        c=c-1;
    end
end
%figure;
%imshow(K);
%===============================



