function [ saliencyWeightmap ] = saliencyWeightmap( im )

im = im2double(im);

if(size(im,3) > 1)
    imGray = rgb2gray(im);
else
    imGray = im;
end

kernel_1D = (1/16) * [1, 4, 6, 4, 1];
kernel_2D = kron(kernel_1D, kernel_1D');

I_mean = mean(imGray(:));

I_Whc = conv2(imGray, kernel_2D, 'same');

saliencyWeightmap = abs(I_Whc - I_mean);

end