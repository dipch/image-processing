% Convert rgb image to grayscale without library function
% 170104003 Dip Chowdhury-
I=imread('input.jpg');
figure;
imshow(I);
% a= rgb2gray(I) %using library function
[row,col,ch]=size(I);
X=uint8(zeros(row,col));
Y=zeros(1,256);

for i=1:row
    for j=1:col
        X(i,j)=(I(i,j,1)+I(i,j,2)+I(i,j,3))/3;
        X(i,j)=uint8(X(i,j));
        temp=X(i,j);
        Y(temp)=Y(temp)+1;   
    end
end
figure;
imshow(X);

%frequency histogram
figure;
bar(Y);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')











% figure;
% imshow(K);

% X=zeros(1,256);
% %Y=zeros(1,256);
% 


%alternate rgb to grayscale
% for i=1:row
%     for j=1:col
%         temp=I(i,j);
%         X(temp)=X(temp)+1;   
%     end
% end
% figure;
% bar(X);
% title('Hist plot')
% xlabel('1 to 256 pixel values')
% ylabel('frequency')
% % 





% 
%         temp = 0;
%         for k=1:ch
%             temp = temp + I(i,j,k);
%         end
%         temp = temp/3;
%         temp = uint8(temp);
%         X(temp)=X(temp)+1;
