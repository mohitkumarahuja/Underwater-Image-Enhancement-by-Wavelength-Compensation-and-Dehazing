close all
clear
imga = im2double(imread('apple1.jpg'));
imgb = im2double(imread('orange1.jpg')); % size(imga) = size(imgb)
imga = imresize(imga,[size(imgb,1) size(imgb,2)]);
[M N ~] = size(imga);

v = 230;
level = 5;
limga = genPyr(imga,'lap',level); % the Laplacian pyramid
limgb = genPyr(imgb,'lap',level);

maska = zeros(size(imga));
maska(:,1:v,:) = 1;
maskb = 1-maska;
blurh = fspecial('gauss',30,15); % feather the border
maska = imfilter(maska,blurh,'replicate');
maskb = imfilter(maskb,blurh,'replicate');

limgo = cell(1,level); % the blended pyramid
for p = 1:level
	[Mp Np ~] = size(limga{p});
	maskap = imresize(maska,[Mp Np]);
	maskbp = imresize(maskb,[Mp Np]);
	limgo{p} = limga{p}.*maskap + limgb{p}.*maskbp;
end
imgo = pyrReconstruct(limgo);
figure,imshow(imgo) % blend by pyramid
imgo1 = maska.*imga+maskb.*imgb;
figure,imshow(imgo1) % blend by feathering