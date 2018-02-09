function [ lumWeightmap ] = luminanceWeightmap( im )
 L = mean(im,3);

lumWeightmap = sqrt((1/3) * (im(:, :, 1) - L).^2 + (im(:, :, 2) - L).^2 + (im(:, :, 3) - L).^2);
end
