
function [result] = myhist(imagein) % input image matrix and output normalized vector
%AA = double(imread('flower.pgm'));
image = double(imagein);
hist = zeros(1,256);
for i =0:255
    mod_image = image - i; % find same intensity in 0:255 and set as 0
    hist(i+1) = sum(sum(mod_image==0)) ;  % count all 0
end
scale = size(image,1)*size(image,2); % calculate total number
result = hist/scale; % normalize
bar([0:255],result) % show photo
title('normalized histogram')
xlabel('intensity')
ylabel('probability')
end

