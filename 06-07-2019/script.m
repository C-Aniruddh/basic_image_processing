clc;
clear all;
close all;

X = imread('lena_color_512.tif');

figure;

% Original Image
subplot(4, 2, 1);
imshow(X);
title('Original Image');

% Gray image
subplot(4, 2, 2);
gray_image = rgb2gray(X);
imshow(gray_image);
title('Gray Image');

% Red image
subplot(4, 2, 3);
red_image = X(:,:,1);
imshow(red_image);
title('Red Image');

% Green image
subplot(4, 2, 4);
green_image = X(:,:,2);
imshow(green_image);
title('Green Image');

% Blue image
subplot(4, 2, 5);
blue_image = X(:,:,3);
imshow(blue_image);
title('Blue Image');

subplot(4, 2, 6);
new_gray = 0.3*X(:,:,1) + 0.59*X(:,:,2) + 0.11*X(:,:,3);
imshow(new_gray);
title('Grayscale');

for i = 1:512
    for j = 1:512
        new_gray_1(i, j, :) =  0.3*X(i,j,1) + 0.59*X(i,j,2) + 0.11*X(i,j,3);
    end
end

imshow(new_gray_1);
title('Grayscale New');

% Cropped image
subplot(4, 2, 7);
cropped_image = X(100:400,100:400,:);
imshow(cropped_image);
title('Cropped Image');
