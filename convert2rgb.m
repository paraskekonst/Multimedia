function imageRGB = convert2rgb(imageY, imageCr, imageCb, subimg)
[M,N]=size(imageY);
if (subimg(2)==2)
   imageCr=imresize(imageCr,[M N],'nearest');
   imageCb=imresize(imageCb,[M N],'nearest');
end

imageCr=double(imageCr)-128;
imageCb=double(imageCb)-128;
imageY=double(imageY);
r=(imageY+1.402*imageCr)  ;
g=(imageY -(0.344136*imageCb) -(0.714136*imageCr)) ;
b=(imageY +(1.772*imageCb));
imageRGB=cat(3,r,g,b);
imageRGB=uint8(imageRGB);
end