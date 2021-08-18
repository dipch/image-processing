I=imread('cameraman.png');
figure;
imshow(I);
% a= rgb2gray(I)
[row,col]=size(I);
X=zeros(1,256);
Y=zeros(1,256);

for i=1:row
    for j=1:col
        temp=I(i,j);
        X(temp)=X(temp)+1;   
    end
end
figure;
bar(X);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')
% 

Z=uint8(zeros(row,col));
for i=1:row
    for j=1:col
        Z(i,j)=255-I(i,j); %or vect y=255-i without loop
    end
end
figure;
imshow(Z);
figure;
plot(I,Z,'.-k');
