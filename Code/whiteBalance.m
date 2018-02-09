function [ whiteBalanced ] = whiteBalance( im )
% Using Grayworld assumtion color balancing.....

R_avg = mean(mean(im(:,:,1)));           % Getting the average Of R ,G, B components
G_avg = mean(mean(im(:,:,2)));
B_avg = mean(mean(im(:,:,3)));
RGB_avg = [R_avg G_avg B_avg];

gray_value = (R_avg + G_avg + B_avg)/3  % By Grey world, avg color of the whole image is gray
scaleValue = gray_value./RGB_avg;       % By Grey world, scale value=gray / avg of each color component

whiteBalanced(:,:,1) = scaleValue(1) * im(:,:,1);   % R,G,B components of the new white balanced new image
whiteBalanced(:,:,2) = scaleValue(2) * im(:,:,2);
whiteBalanced(:,:,3) = scaleValue(3) * im(:,:,3);

end