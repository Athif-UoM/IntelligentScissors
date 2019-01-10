
global lapm
global sobelmag
global sobeldir
global im
global m
global n
    
im = rgb2gray(imread('face.jpg'));
im = im(100:300,100:300);
[m,n] = size(im);
Hlap = fspecial('laplacian');
lapm = imfilter(im,Hlap);

[sobelmag, sobeldir] = imgradient(im,'sobel');

for each = sobeldir
    if each < 0;
        each = each+360;
    end
end

% figure 
% imshow(lapm)
% 
% figure
% imshow(uint8(sobelmag))
% 
% figure
% imshow(uint8(sobeldir))

% figure
% 

figure
imshow(im)
title('Pick 3-4 Points')

[x,y] = getpts;
x = floor(x);
y = floor(y);


whites = [];

figure
imshow(im)
hold on
plot(x,y,'sb','MarkerSize',10,'LineWidth',1.5);

for i = 1:length(x)-1
    
    start = (x(1)-1)*m +y(1);
    finish = (x(2)-1)*m +y(2);
    line = minline(start,finish);
    whites = [whites,line];
    
    imout = im;
    for each = whites
        imout(each) = 255;
    end
    
    figure
    imshow(imout)
    hold on
    plot([x(1),x(2)],[y(1),y(2)],'sb','MarkerSize',10,'LineWidth',1.5);
    
    x(1) = [];
    y(1) = [];
end
