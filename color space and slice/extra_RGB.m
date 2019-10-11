clear all;
image = double(imread('scene.ppm'));
[X,Y,Z] = size(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);
center(1,:) = image(1,1,:);
color = [[255,0,0];[0,0,255];[0,255,0];[255,255,0];[255,165,0];[160,32,240];[128,42,42];[0,0,0]];
distance = 100;
ii = zeros(1,3);
for i = 1:X
    for j = 1:Y
        ii(1,:) = image(i,j,:);
        add=1;
        for c = 1:size(center,1)
            if (sum((center(c,:) - ii).^2))^0.5<distance
                image(i,j,:) = center(c,:)';
                add = 0;
            end
        end
        if add == 1
            center(size(center,1)+1,:) = image(i,j,:);
        end
    end
end
imshow(uint8(image))
figure(2)
imshow('scene.ppm')    

        