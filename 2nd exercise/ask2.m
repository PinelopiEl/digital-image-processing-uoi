clear;
close all;
pkg load signal;
pkg load image;

Image1 = imread("Image1.tif");
Image2 = imread("Image2.tif");
templ = imread("template.tif");



function Imout = func(Image1,templ)
  cc = normxcorr2(templ,Image1);
  [max_cc, imax] = max(cc(:)')
  [ymax,xmax] = ind2sub(size(cc), imax(1))
  Imout = mat2gray(cc);
endfunction


f = func(Image1,templ);
f2 = func(Image2,templ);

figure;imshow(f);
figure;imshow(f2);
