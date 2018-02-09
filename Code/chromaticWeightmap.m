function [ chromaticWeightmap ] = chromaticWeightmap( im )

hsvImage = rgb2hsv(im);         % Convert the image to HSV space
saturationValue = hsvImage(:,:,2);    % find saturation

% Chromatic weight map = Distnc b/w saturation value and max sat range..
saturationMax = 1 ;
sigma = .3 ;
chromaticWeightmap = exp( -1 * (((saturationValue - saturationMax).^2) / (2*(sigma^2))) );

end



