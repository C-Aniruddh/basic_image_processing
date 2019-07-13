clc;
clear all;
close all;

input_image = imread('lena_gray_256.tif');

for i = 1:256
    for j = 1:256
        inverted_image(i, j) =  255 - input_image(i, j);
    end
end

figure;
subplot(2, 3, 1);
imshow(input_image);
title('Original Image');

subplot(2, 3, 2);
imshow(inverted_image);
title('Inverted Image');

for i = 1:256
    for j = 1:256
        if(input_image(i, j) > 128)
            threshold_image(i, j) =  255;
        else
            threshold_image(i, j) =  0;
        end
    end
end

subplot(2, 3, 3);
imshow(threshold_image);
title('Threshold Image');


for i = 1:256
    for j = 1:256
        if(input_image(i, j) > 100 && input_image(i, j) < 200)
            sliced_image(i, j) =  255;
        else
            sliced_image(i, j) =  0;
        end
    end
end

sliced_im = uint8(sliced_image);
subplot(2, 3, 4);
imshow(sliced_im);
title('Without background');

for i = 1:256
    for j = 1:256
        if(input_image(i, j) > 100 && input_image(i, j) < 200)
            sliced_image_bg(i, j) =  255;
        else
            sliced_image_bg(i, j) =  input_image(i, j);
        end
    end
end

sliced_im_bg = uint8(sliced_image_bg);
subplot(2, 3, 5);
imshow(sliced_im_bg);
title('With background');
