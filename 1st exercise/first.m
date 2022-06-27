clear;
close all;
pkg load image;

#read first image
firstPic = imread('lena512.jpg');
firstPic = mat2gray(double(firstPic));

filAverage = fspecial("average");
firstPic = firstPic - min(firstPic(:));
firstPic = firstPic / max(firstPic(:));

for j  = 1:1:50 #50 repetitions

   ##add noise to original picture
  rel = var(firstPic(:)) / sqrt(10);
  noisepic = imnoise(firstPic, 'gaussian', 0, rel);
  #aapply filter
  mynewimage = filter2(filAverage,(noisepic/j));

  im =  immse(firstPic,mynewimage);
endfor

x = [1:50];
figure;
plot(x,im);
figure;
imshow(noisepic,[]);
figure;
imshow(mynewimage,[]);



