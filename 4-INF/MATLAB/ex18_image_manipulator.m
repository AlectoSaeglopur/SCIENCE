
%%% Title: IMAGE MANIPULATION WITH MATLAB
%%% Author: Filippo Valmori
%%% Date: 21/03/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.14]

close all
clearvars
clc


%% PARAMETERS

ImageId = 'ex18_image.jpg';                                                         % Input image name and extension
Nbins = 10;                                                                         % Number of bins for grey image equalization (NB: shall be between 1 and 256)
Nclr = 4;                                                                           % Number of colors of indexed-color image (NB: shall be between 1 and 256)
SzK = 37;                                                                           % Laplacian edge filter kerlel size
Sigma = 0.5;                                                                        % Laplacian filter standard deviation



%% PROCESSING

Xrgb = imread(ImageId);                                                             % Load RGB image

Xgrey = rgb2gray(Xrgb);                                                             % Convert RGB to grey-scale image
Xequal = histeq(Xgrey,Nbins);                                                       % Equalize grey-scale image

[Xidx,MapO] = rgb2ind(Xrgb,Nclr);                                                   % Convert RGB to indexed-color image and extract color-map
MapG = MapO;                                                                        % Create green color-map
MapG(:,1) = 0;                                                                      % Remove red tones (R) from color-map
MapG(:,3) = 0;                                                                      % Remove blue tones (R) from color-map
MapV = MapO;                                                                        % Create violet color-map
MapV(:,2) = 0;                                                                      % Remove green tones (R) from color-map

KernL = fspecial('log',SzK,Sigma);                                                  % Get Laplacian of Gaussian kernel for edge filtering
Xedge = filter2(KernL,im2double(Xgrey));                                            % Convert grey-scaled image to double precision and then filter



%% RESULTS

figure('Name','1. COLOR FILTERING','NumberTitle','off')
subplot(2,2,1)
imshow(Xrgb)
title('Original RGB')
subplot(2,2,2)
imshow(Xidx,MapO)
title(sprintf('Color-compressed (%d)',Nclr))
subplot(2,2,3)
imshow(Xidx,MapG)
title('Color-filtered (Green)')
subplot(2,2,4)
imshow(Xidx,MapV)
title('Color-filtered (Violet)')


figure('Name','2. EQUALIZATION','NumberTitle','off')
subplot(2,2,1)
imshow(Xgrey)
title('Gray')
subplot(2,2,2)
imshow(Xequal)
title(sprintf('Equalized-Gray (%d)',Nbins))
subplot(2,2,3)
imhist(Xrgb)
title('Histogram before equalization')
subplot(2,2,4)
imhist(Xequal)
title('Histogram after equalization')

figure('Name','3. EDGE FILTERING','NumberTitle','off')
imshow(Xedge)
title('Laplacian edge-detected')
