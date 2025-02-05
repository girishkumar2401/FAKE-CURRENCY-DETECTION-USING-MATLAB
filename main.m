clc;
clear;
close all;
close all hidden;
warning off;

%%
[file,path] = uigetfile('*.*','Select an image');  % Graphics file
img = imread([path,file]);
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

%%

load features
load labels 

SVMModel = fitcecoc(features,labels);
[YPred, s] = predict(SVMModel,img_features);
YPred = cell2mat(YPred); 
msgbox(YPred);

% Split the data into features (X) and labels (Y)
X = features;
Y = labels;

% Split the data into training and testing sets
rng(1); % Set random seed for reproducibility
cv = cvpartition(size(X, 1), 'HoldOut', 0.3); % 70% training, 30% testing
XTrain = X(cv.training,:);
YTrain = Y(cv.training,:);
XTest = X(cv.test,:);
YTest = Y(cv.test,:);

SVMModel = fitcknn(XTrain, YTrain);
YPred = predict(SVMModel, XTest);

% Evaluate the classifier's performance
accuracy = sum(strcmp(YPred, YTest)) / numel(YTest);
fprintf('Accuracy: %.2f%%\n', accuracy * 100);

% Create a confusion matrix
C = confusionmat(YTest, YPred);
figure
confusionchart(C, unique(YTest));
title('confusionchart')

% Calculate precision, recall and Precision
truePositives = C(1,1);
falsePositives = C(2,1);
falseNegatives = C(1,2);

% Calculate Precision
precision = truePositives / (truePositives + falsePositives);
fprintf('Precision: %.2f\n', precision*100);

% Calculate Recall
recall = truePositives / (truePositives + falseNegatives);
fprintf('Recall: %.2f\n', recall*100);

% Calculate F1 score
f1Score = 2 * (precision * recall) / (precision + recall);
fprintf('F1 Score: %.2f\n', f1Score*100);