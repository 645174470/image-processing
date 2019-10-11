image = double(imread('flower.pgm'));
[M,N]= size(image);
% min1 = min(min(image));
% max1 = max(max(image));
scale = 255/8;
image2 = floor(image/scale)+1;
% red(255,0,0)
% blue(0,0,255)
% green(0,255,0)
% yellow(255,255,0)
% orange(255,165,0)
% purple(160,32,240)
% brown(128,42,42)
% black(0,0,0)
color = [[255,0,0];[0,0,255];[0,255,0];[255,255,0];[255,165,0];[160,32,240];[128,42,42];[0,0,0]];
rgb_image = zeros([M,N,3]);
rgb_image(:,:,1) = image2;
for i =1:M
    for j = 1:N
        rgb_image(i,j,:) = color(rgb_image(i,j,1),:);
    end
end
imshow(uint8(rgb_image))
% [X,Y,Z]=find(rgb_image(:,:,1)==2);
% location = find(rgb_image==2);
% x = mod(location,N);
% y = ceil(location/M);
% rgb_image(x,y,:) = [5,5,5];

