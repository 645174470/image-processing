function [result] = myLaplacian(image)
imagein = double(image);
[M, N] = size(imagein);
conv_image = zeros(M,N,9);   %initial a matrix to store result matrix of every element in kernel 
conv_image(2:M,2:N,1) = imagein(1:M-1,1:N-1);  %The matrix of result of (1,1) in kernel
conv_image(2:M,:,2) = imagein(1:M-1,:);   %The matrix of result of (1,2) in kernel
conv_image(2:M,1:N-1,3) = imagein(1:M-1,2:N);  %The matrix of result of (1,3) in kernel

conv_image(:,2:N,4) = imagein(:,1:N-1);     %The matrix of result of (2,1) in kernel
conv_image(:,1:N-1,6) = imagein(:,2:N);     %The matrix of result of (2,3) in kernel
 
conv_image(1:M-1,2:N,7) = imagein(2:M,1:N-1);   %The matrix of result of (3,1) in kernel 
conv_image(1:M-1,:,8) = imagein(2:M,:);         %The matrix of result of (3,2) in kernel
conv_image(1:M-1,1:N-1,9) = imagein(2:M,2:N);   %The matrix of result of (3,3) in kernel
 
laplacian = 8*imagein - sum(conv_image,3);   %set all -1 and 8 in center kernel
result = uint8(laplacian + imagein);
imshow(result,[0,255])
end
