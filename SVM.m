clc;clear all;close all;
%% import training and test data
load 'train_feature.mat';load 'train_label.mat';
x = train_feature; xlabel = train_label;

%% Crossvalidation
p = 0.5;
[Train,Test] = crossvalind('HoldOut',train_label,p);
TraingSample = x(Train,:);
TrainingLabel = xlabel(Train,:);
TestingSample = x(Test,:);
TestingLabel = xlabel(Test,:);

%% PCA and check how many dimensions we should use
[COEFF,ProjectedTraining] = pca(TraingSample);
ProjectedTesting = bsxfun(@minus,TestingSample,mean(TraingSample))*COEFF;

i = 7;
model = svmtrain(TrainingLabel,ProjectedTraining(:,1:i),'-t 0 -c 10');
pred = svmpredict(TrainingLabel,ProjectedTraining(:,1:i),model);
acc(1,i) = mean(pred==TrainingLabel);