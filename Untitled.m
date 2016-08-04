clear all;close all;clc;
I = imread('Untitled-1.jpg');
Ib = im2bw(I);
Ib = imresize(Ib, [480 640]);
for i=1:1:480
    for j=1:16:640
        aux = Ib(i,j:j+15);
        I1(i,j:j+15) = aux;
    end
end