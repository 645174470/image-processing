image = double(imread('scene.ppm'));
[X,Y,Z] = size(image);
normaled_image = image/255;
R = normaled_image(:,:,1);
G = normaled_image(:,:,2);
B = normaled_image(:,:,3);
I = (R+B+G)/3;
theta = acos(0.5*(R*2-G-B)./((R-G).^2+(R-B).*(G-B)).^0.5)/(pi)*180;
H = (B>G).*(360-theta)+(B<=G).*theta;
S = 1-3*min(normaled_image,[],3)./(R+G+B);
th_h = 30;
th_s = 0.2;
th_i = 0.3;
H = floor((H+th_h/2)/th_h)*th_h;
H = mod(H,360);
S = floor(S/th_s)*th_s;
% S = ones(X,Y);
I = ceil(I/th_i)*th_i;
for i = 1:X
    for j = 1:Y
        if H(i,j)<120
            R(i,j) = I(i,j)*(1+S(i,j)*cos(H(i,j))/cos(60-H(i,j)));
            B(i,j) = I(i,j)*(1-S(i,j));
            G(i,j) = 3*I(i,j)-(R(i,j)+B(i,j));
        elseif H(i,j)<240
            H(i,j) = H(i,j)-120;
            G(i,j) = I(i,j)*(1+S(i,j)*cos(H(i,j))/cos(60-H(i,j)));
            R(i,j) = I(i,j)*(1-S(i,j));
            B(i,j) = 3*I(i,j)-(R(i,j)+B(i,j));
        else
            H(i,j) = H(i,j)-240;
            B(i,j) = I(i,j)*(1+S(i,j)*cos(H(i,j))/cos(60-H(i,j)));
            G(i,j) = I(i,j)*(1-S(i,j));
            R(i,j) = 3*I(i,j)-(R(i,j)+B(i,j));
        end
    end
end
image(:,:,1) = R*255;
image(:,:,2) = G*255;
image(:,:,3) = B*255;
imshow(uint8(image))
