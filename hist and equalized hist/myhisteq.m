
function[new_hist]=myhisteq(imagein) % input image matrix and return vector of equalized normalized hist
image_double = double(imagein);
figure(1)
subplot(2,1,1)
hist_norm = myhist(image_double); % use function in Q1
newimage = image_double; % copy
cdf = cumsum(hist_norm); % calculate cdf or proportion                        
for i = 1:256
    newimage(find(image_double==(i-1)))=round(cdf(i)*255); % find the proportion of each intensity in 0:255 and set 
end
subplot(2,1,2)
new_hist=myhist(newimage);
title('equlized normalized histogram')
xlabel('intensity')
ylabel('probability')
figure(2)
imshow(newimage,[0,255])
title('Equlized image')
end
