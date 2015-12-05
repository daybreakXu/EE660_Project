clc;clear all;close all;
%% import training and test data
load 'matlab.mat';load 'train_label.mat';
x = train_feature; xlabel = train_label;

%% Crossvalidation
p = 0.9;
[Train,Test] = crossvalind('HoldOut',train_label,p);
TraingSample = x(Train,:);
TrainingLabel = xlabel(Train,:);
TestingSample = x(Test,:);
TestingLabel = xlabel(Test,:);

%% PCA and check how many dimensions we should use
[COEFF,ProjectedTraining] = pca(TraingSample);
ProjectedTesting = bsxfun(@minus,TestingSample,mean(TraingSample))*COEFF;

for i = 1:30
    outlabel = knnclassify(ProjectedTesting(:,1:i),...
        ProjectedTraining(:,1:i),TrainingLabel,5);
    acc(1,i) = mean(outlabel==TestingLabel);
end