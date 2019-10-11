function[image] = myquantize(image,quant_num) %input image matrix and number of gray levels
quant = 256/quant_num; % calculate how much intensities in each level
for i =0:quant:256 
    image(find(image >=i & image <(i+quant))) = round(i+quant/2); % for each level find all intensities and set as median value
end
imshow(image,[0,255])
title('quantized photo')
 end