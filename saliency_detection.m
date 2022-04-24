function sm = saliency_detection(img)

gfrgb = imfilter(img, fspecial('gaussian', 3, 3), 'symmetric', 'conv');     % Read image and blur it with a 3x3 or 5x5 Gaussian filter

cform = makecform('srgb2lab');                                              % Perform sRGB to CIE Lab color space conversion (using D65)
lab = applycform(gfrgb,cform);

% Compute Lab average values (note that in the paper this average is found from the unblurred original image, but the results are quite similar)

l = double(lab(:,:,1)); lm = mean(mean(l));
a = double(lab(:,:,2)); am = mean(mean(a));
b = double(lab(:,:,3)); bm = mean(mean(b));

sm = (l-lm).^2 + (a-am).^2 + (b-bm).^2;                                     % Compute the saliency map and display it.