clear all;
image = double(imread('scene.ppm'));
[X,Y,Z] = size(image);
image_hsv = rgb2hsv(image);
th_h = 0.2;
th_s = 0.5;
th_v = 128;
image_hsv(:,:,1) = floor((image_hsv(:,:,1)+th_h/2)/th_h)*th_h;
image_hsv(:,:,1) = mod(image_hsv(:,:,1),1);
image_hsv(:,:,2) = floor(image_hsv(:,:,2)/th_s)*th_s;
image_hsv(:,:,3) = floor(image_hsv(:,:,3)/th_v)*th_v+th_v/2;
image = hsv2rgb(image_hsv);
imshow(uint8(image))
figure(2)
imshow('scene.ppm')   

              
