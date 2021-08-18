I=imread('cameraman.png');
figure;
imshow(I);
%I=im2double(I);
%s=L-1-r
X=255-I;

%alternative
% for i=1:row
%     for j=1:col
%         X(i,j)=255-I(i,j);
%     end
% end

figure;
imshow(X);
figure;
plot(I,X,'.-r');
