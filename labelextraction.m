clear all;close all;clc;
srcFiles = dir('Z:\PROJECTS\BUSSINESS PROJECTS\SEP - 2023\New folder\base\CODE\Resized Dataset\Fake\*.png');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
filename = strcat('Z:\PROJECTS\BUSSINESS PROJECTS\SEP - 2023\New folder\base\CODE\Resized Dataset\Fake\',srcFiles(i).name);

load labels.mat
labels(18+i,:) = {'Fake'};
save('labels','labels')
srcFiles(i).name
end