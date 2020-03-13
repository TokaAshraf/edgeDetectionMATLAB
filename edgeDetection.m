I= imread('cameraman.tif');
imshow(I);
hsize = 3;
sigma = 0.01;
h = fspecial('gaussian', hsize, sigma);
filteredImage =  imfilter(I,h);
%% first derivative edge detector
hx=[-0.5 0 0.5 ; -0.5 0 0.5 ; -0.5 0 0.5];
hy=[-0.5 -0.5 -0.5 ; 0 0 0  ;0.5 0.5 0.5];
Gx = imfilter(I ,hx );
%figure;
%imshow(Gx);
Gy= imfilter(I , hy);
%figure;
%imshow(Gy);
edgeDetectedImage = Gx + Gy ;
figure;
imshow(edgeDetectedImage);
%imwrite(edgeDetectedImage , 'D:\3_term2_CE\ComputerVision\firstDerivative2.png');

% second method 
%derivative of gaussian filter
hder = conv2(h , [1 -1]);
edgeDetectedImage5 = imfilter(I , hder);
figure;
imshow(edgeDetectedImage5);
%imwrite(edgeDetectedImage5 , 'D:\3_term2_CE\ComputerVision\firstDerivative1.png');
%% Laplacian of Gaussian "second derivative edge detector"
h2 = [0 1 0 ; 1 -4 1 ; 0 1 0];
edgeDetectedImage2 = imfilter(I , h2);
figure;
imshow(edgeDetectedImage2);
%imwrite(edgeDetectedImage2 , 'D:\3_term2_CE\ComputerVision\secondDerivative1.png');

%another method
Gx2 = imfilter(Gx , hx);
Gy2 = imfilter(Gy , hy);
edgeDetectedImage3 = Gx2 + Gy2 ;
figure;
imshow(edgeDetectedImage3);
%imwrite(edgeDetectedImage3 , 'D:\3_term2_CE\ComputerVision\secondDerivative3.png');

%third method 
%second derivative of gaussian filter
hder2 = conv2(hder , [1 -1]);
edgeDetectedImage6 = imfilter(I , hder2);
figure;
imshow(edgeDetectedImage6);
%imwrite(edgeDetectedImage6 , 'D:\3_term2_CE\ComputerVision\secondDerivative2.png');

%% Canny edge detector
edgeDetectedImage4 = edge(I , 'canny');
figure;
imshow(edgeDetectedImage4);
%imwrite(edgeDetectedImage4 , 'D:\3_term2_CE\ComputerVision\Canny.png');
