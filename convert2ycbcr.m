function [imageY, imageCb, imageCr] = convert2ycbcr(imageRGB, subimg)
tic
r=imageRGB(:,:,1);
g=imageRGB(:,:,2);
b=imageRGB(:,:,3);

sampling_x=1;
if subimg(3)==0
    sampling_y=2;
    sampling_x=2;
elseif subimg(3)==2 
    sampling_y=2;
else
    sampling_y=1; 
end

imageY=(0.299*r + 0.587*g + 0.114*b);
imageCb= (128- (0.168736*r(1:sampling_x:end,1:sampling_y:end)) -(0.331264*g(1:sampling_x:end,1:sampling_y:end)) +(0.5*b(1:sampling_x:end,1:sampling_y:end) ));
imageCr=(128+(0.5*r(1:sampling_x:end,1:sampling_y:end)) -(0.418688*g(1:sampling_x:end,1:sampling_y:end)) -(0.081312*b(1:sampling_x:end,1:sampling_y:end)))  ;
toc