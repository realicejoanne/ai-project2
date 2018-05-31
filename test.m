function test

clc;
I = rgb2gray(imread('captured.png'));
threshold = graythresh(I);
B =~imbinarize(I,0.35);
C = bwareaopen(B,200);
Iedge = edge(uint8(C));

se = strel('square',3);
Iedge2 = imdilate(Iedge, se); 

Ifill = imfill(Iedge2,'holes');

imwrite(~Ifill, 'inigambar.bmp');

RGB = imread('inigambar.bmp');

%imagesc(RGB)

%[X,map] = rgb2ind(RGB, 256); 
%imwrite(X,map,'captured_hasil.bmp');
%imshow('captured_hasil.bmp');
%error('inigambar');
J = imresize(RGB, [150 150]);
%[X,map] = rgb2ind(J, 256); 
%imwrite(X,map,'captured_hasil.bmp');
%imshow(imread('captured_hasil.bmp'));
imshow(J);
a=im2double(J);
b=reshape(a,1,22500);
c=b';
contoh=c;
global net; 
A=sim(net,contoh);

nama={'a','ba','ha','ro','sa'};
mak=0;
makN = 0;
for i=1:5
    if(makN<A(i))
        mak=i;
        makN = A(i);
    end
end
disp(A);
disp(mak);
nama (mak)

end