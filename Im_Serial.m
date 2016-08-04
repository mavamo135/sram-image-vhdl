clear all;close all;clc;
delete(instrfind({'port'},{'COM6'}));
%I = imread('Untitled-1.jpg');
I = imread('batman-en-blanco-y-negro.jpg');
Ib = im2bw(I);
Ib = imresize(Ib, [480 640]);
imshow(Ib);
PS=serial('COM6');
set(PS,'Baudrate',115200); % se configura la velocidad a 9600 Baudios
set(PS,'StopBits',1); % se configura bit de parada a uno
set(PS,'DataBits',8); % se configura que el dato es de 8 bits, debe estar entre 5 y 8
set(PS,'Parity','none'); % se configura sin paridad 
fopen(PS);
k = 1;
for i=1:1:480
    for j=1:8:640
        aux = uint8(Ib(i,j:j+7));
        sal(k) = aux(1)*2^7+aux(2)*2^6+aux(3)*2^5+aux(4)*2^4+aux(5)*2^3+aux(6)*2^2+aux(7)*2^1+aux(8)*2^0;
        k = k+1;
    end
end
for i=1:1:38400
    fwrite(PS,sal(i),'uint8');
    delay(0.001);
end
fclose(PS);