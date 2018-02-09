function [ enhancedIm ] = enhanceContrast( im )

luminance= im(:,:,1)*0.299+im(:,:,2)*0.587+im(:,:,3)*0.114;
avgLuminance =mean(luminance(:));
gamma = 2 * (0.5 + avgLuminance);
% Second input= g * (original image components - avg of the image components)
enhancedIm(:,:,1) = gamma * (im(:,:,1) - avgLuminance);
enhancedIm(:,:,2) = gamma * (im(:,:,2) - avgLuminance);
enhancedIm(:,:,3) = gamma * (im(:,:,3) - avgLuminance);
end