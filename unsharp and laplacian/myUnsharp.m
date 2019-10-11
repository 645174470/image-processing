function [result] = myUnsharp(image,k,filt_size)
imagein = double(image);
[M, N] = size(imagein);
pad_size = floor(filt_size/2);  %calculate padding scale for both odd and even size
m = M+2*pad_size;   %calculate size of padded matrix 
n = N+2*pad_size;   %calculate size of padded matrix
new_image = zeros(m,n);   %intialize new_image
new_image(pad_size+1:pad_size+M,pad_size+1:pad_size+N) = imagein;   % result of zero padding
mean_result = zeros(M,N);  % initialize mean result
for i = 1:M
    for j = 1:N
        mean_result(i,j) = mean(mean(new_image(i:i+filt_size-1,j:j+filt_size-1)));  %calculate each pixel respectivelly
    end
end
unsharp_result = imagein + k * (imagein - mean_result); %Get result 
result = uint8(unsharp_result);
imshow(result,[0,255]);
end