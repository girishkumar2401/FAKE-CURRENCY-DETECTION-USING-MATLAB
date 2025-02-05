clear ;close all;clc;
srcFiles = dir('Z:\PROJECTS\BUSSINESS PROJECTS\SEP - 2023\Fake Currency Detection with Machine Learning Algorithm and Image Processing\base\CODE\Resized Dataset\Fake\*.png');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('Z:\PROJECTS\BUSSINESS PROJECTS\SEP - 2023\Fake Currency Detection with Machine Learning Algorithm and Image Processing\base\CODE\Resized Dataset\Fake\', srcFiles(i).name);

img = imread(filename);
img = imresize(img, [300 400]);  % Image resize
figure
imshow(img);
title('original image')

gray = rgb2gray(img);
figure
imshow(gray);
title('Gray image')

% Calculate the mean of pixel values
mean_value = mean(gray(:));
% Calculate the squared difference between each pixel and the mean
squared_diff = (double(gray) - mean_value).^2;
% Calculate the mean of squared differences (variance)
variance = mean(squared_diff(:));
% Display the result
fprintf('Variance of the image: %.2f\n', variance);


% Calculate the skewness of pixel intensities
skewness_value = skewness(double(gray(:)));
fprintf('Skewness of the image: %.2f\n', skewness_value);


% Calculate the kurtosis of the image
image_kurtosis = kurtosis(double(gray(:)));
% Display the kurtosis value
fprintf('Kurtosis of the image: %.2f\n', image_kurtosis);


% Compute the histogram of pixel intensities
histogram = imhist(gray);
% Normalize the histogram to get the probability distribution
prob_distribution = histogram / sum(histogram);
% Calculate entropy
entropy_value = -sum(prob_distribution .* log2(prob_distribution + eps));
% Display the entropy value
fprintf('Entropy of the image: %f\n', entropy_value);

img_features = [variance,skewness_value,image_kurtosis,entropy_value];
% fprintf('features of the image: %f\n', img_features);



load features.mat
features(18+i,:) = img_features;
save('features','features')
srcFiles(i).name
end