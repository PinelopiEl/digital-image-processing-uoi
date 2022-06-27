clear;
close all;
pkg load image;

picture = imread('lena512.jpg');
[R,C] = size(picture);

function [Rho,Theta] = PolarCoord(R,C)

  Rho=[];
  Theta=[];
  for x = 1:1:R
    for y = 1:1:C

      Rho(x,y) = sqrt((x-R/2)^2 + (y-C/2)^2);
      Theta(x,y) = atan(y/x);

    endfor
  endfor
endfunction

function Iout = ImageSpecialEffect(picture,Rho,Theta)
  [R,C] = size(picture);
  for x = 1:1:R
    for y = 1:1:C
      myx = (R/2) + Rho(x,y)*cos(Theta(x,y));
      myy = (C/2) + Rho(x,y)*sin(Theta(x,y));

      Iout(x,y) = picture(round(myx),round(myy));

    endfor
  endfor
endfunction


[Rho, Theta] = PolarCoord(R,C);

r1=(Rho.^2)/sqrt(R^2+C^2);
th1=Theta;
pic1 = ImageSpecialEffect(picture,r1,th1);
figure;
imshow(pic1,[]);







