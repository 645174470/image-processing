image = imread('flower.pgm');
k = 5;
filt_size = 3;
figure(1)
imshow(image,[0,255])
title('original image')
figure(2)
[result] = myUnsharp(image,5,3);
title(['Result of Unsharp k = ',num2str(k)])
figure(3)
[result] = myLaplacian(image);
title('Result of Laplacian')
conv2()
