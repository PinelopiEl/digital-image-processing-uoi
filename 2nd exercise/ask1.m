clear;
close all;


Im = imread('lena512.jpg');
figure;
imshow(Im, []);
A= [1/16 ,1/8 ,1/16; 1/8,1/4,1/8; 1/16, 1/8 ,1/16];
B= [1/16 ,1/8 ,1/16; 1/8,1/4,1/8; 1/16, 1/8 ,1/16];

G= conv2(im2double(Im),A,'same');
H = conv2(im2double(Im),B,'same');
S = sqrt(G .^2 + H .^2);

figure;
imshow(S, []);
figure;
imshow(G, []);
figure;
imshow(H, []);
#convolution
f = fspecial("average");
m= imfilter(Im,f,"conv");
m2 = im2double(m);
x = immse(S,m2);

figure;
imshow(m2, []);
