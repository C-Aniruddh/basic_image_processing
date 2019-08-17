clear all;
close all;
clc;

input_image = imread('Fig0442(a)(characters_test_pattern).tif');
input_image = im2double(input_image);

size_im = size(input_image);

padded_image = padarray(input_image, size_im, 'post');
size_p = size(padded_image);

M = size_im(1);
N = size_im(2);

fft_image = fft2(input_image);
shifted_image = fftshift(fft_image);

do = 460;

K = size_p(1);
L = size_p(2);

n = 2;

for i=1:M
    for j=1:N
        distance = sqrt((i - M/2)^2 + (j - N/2)^2);
        h(i,j) = (1/(1 + (do/distance)^(n*2)));
    end
end

new_image = shifted_image .* h;
shift_new_image = ifftshift(new_image);
inverse_image = real(ifft2(shift_new_image));
inverse_image = im2uint8(inverse_image);
figure;

subplot(2, 2, 1);
imshow(input_image);
title('Input image');

subplot(2, 2, 2);
imshow(shifted_image);
title('Shifted Image');

subplot(2, 2, 3);
imshow(fft_image);
title('FFT Image');

subplot(2, 2, 4);
imshow(inverse_image);
title('Transformed image, d0 = 460');

do_values = [10, 30, 60, 160, 460];

figure;

for d=1:length(do_values)
    for i=1:M
        for j=1:N
            distance = sqrt((i - M/2)^2 + (j - N/2)^2);
            h(i,j) = (1/(1 + (do_values(d)/distance)^(n*2)));
        end
    end
    
    new_image = shifted_image .* h;
    shift_new_image = ifftshift(new_image);
    inverse_image = real(ifft2(shift_new_image));
    inverse_image = im2uint8(inverse_image);

    subplot(2, 3, d);
    imshow(inverse_image);
    title(do_values(d));
end