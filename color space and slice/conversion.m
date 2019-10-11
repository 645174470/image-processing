[H,S,I]=rgb2hsi(image);
[cmy] = rgb2cmy(image);
function [H,S,I]=rgb2hsi(image)
normaled_image = image/255;
R = normaled_image(:,:,1);
G = normaled_image(:,:,2);
B = normaled_image(:,:,3);
I = (R+B+G)/3;
theta = acos(0.5*(R*2-G-B)./((R-G).^2+(R-B).*(G-B)).^0.5)/(pi)*180;
H = (B>G).*(360-theta)+(B<=G).*theta;
S = 1-3*min(normaled_image,[],3)./(R+G+B);
end
function [cmy] =rgb2cmy(image)
cmy = 1-image/255;
end
% image_hsi = rgb2hsv(image);