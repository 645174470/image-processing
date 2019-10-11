load('odd_rows.mat');
load('even_rows.mat');  %load image
%even_channel = even_corrupted_channel + mean(odd_channel,2);
even_channel = even_corrupted_channel + abs(even_corrupted_channel(:,1));
% Add absolute values of first column because background should be all 0
% and the difference is corruption.
A = zeros (size(even_channel,1)*2,size(even_channel,2)); % initailize matrix
A(1:2:(size(A,1)-1),:)=odd_channel; % import odd rows 
A(2:2:size(A,1),:)=even_channel; %import even rows

%plot
figure(1)
imshow(odd_channel,[0,255]);
title('odd rows')
figure(2)
imshow(even_corrupted_channel,[0,255]);
title('even corrupted rows')
figure(3)
imshow(even_channel,[0,255]);
title('even rows')
figure(4)
imshow(A,[0,255]);
title('reconstructed brain')