clc;
clear all;
close all;

original_image  = uint8([20, 35, 255, 6, 7, 9, 0, 14; 
    45, 30, 26, 30, 42, 55, 90, 96;
    160, 160, 150, 240 36, 50, 49, 76;
    84, 15, 16, 42, 93, 52, 43, 39;
    33, 10, 11, 9, 3, 4, 0, 26;
    42, 2, 1, 0, 1, 1, 3, 135;
    96, 89, 82, 7, 6, 9, 5, 120;
    97, 29, 150, 200, 100, 215, 160, 110]);

figure;
subplot(2, 2, 1);
imshow(original_image);
title('Original Image');

new_r = 1;
new_c = 1;

for i = 1:8
    new_c = 1;
    for j = 1:8
        if(mod(j, 2) == 0)
            new_gray_1(new_r, new_c) = original_image(i, j);
            new_c = new_c + 1;
        end
    end
    if(mod(i, 2) == 0)
        new_r = new_r + 1;
    end
end

subplot(2, 2, 2);
imshow(new_gray_1);
title('Reduced Spatial Resolution Image');

lena_image = imread('lena_color_256.tif');
subplot(2, 2, 3);
imshow(lena_image);
title('Original Lena Image');

new_c_lena = 1;
new_r_lena = 1;

for i = 1:256
    new_c_lena = 1;
    for j = 1:256
        if(mod(j, 8) == 0)
            new_gray_2(new_r_lena, new_c_lena, :) = lena_image(i, j, :);
            new_c_lena = new_c_lena + 1;
        end
    end
    if(mod(i, 8) == 0)
        new_r_lena = new_r_lena + 1;
    end
end

subplot(2, 2, 4);
imshow(new_gray_2);
title('Reduced Resolution Lena Image');
