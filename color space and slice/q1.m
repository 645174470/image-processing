image = imread('interfere.pgm');
[M,N] = size(image);
dft = fftshift(fft2(image));
centerx = 1+floor(M/2);
centery = 1+floor(N/2);

s = log(1+abs(dft));
mesh(s)
pad_s = zeros([M+2,N+2]);
pad_s(2:M+1,2:N+1) = s;
dif_s = zeros([M,N]);
for i = 1:M
    for j = 1:N
        dif_s(i,j)  = abs(pad_s(i,j+1) +pad_s(i+1,j)+pad_s(i+1,j+2)+pad_s(i+2,j+1)-4*pad_s(i+1,j+1));
    end
end
location = find(dif_s==max(max(dif_s)));
x1 = mod(location,N);
y1 = ceil(location/M);
x2 = centerx*2-x1;
y2 = centery*2-y1;
% dft(x1,y1) = (dft(x1+1,y1)+dft(x1-1,y1)+dft(x1,y1+1)+dft(x1,y1-1))/4;
% dft(x2,y2) = (dft(x2+1,y2)+dft(x2-1,y2)+dft(x2,y2+1)+dft(x2,y2-1))/4;
dft(x1,y1) = (sum(sum(dft(x1-1:x1+1,y1-1:y1+1)))-dft(x1,y1))/8;
dft(x2,y2) = (sum(sum(dft(x2-1:x2+1,y2-1:y2+1)))-dft(x2,y2))/8;
mesh(log(1+abs(dft)))
result = ifft2(dft);
imshow(uint8(result),[0,255])
