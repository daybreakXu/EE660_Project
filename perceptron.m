clc;clear all;close all;
%% import training and test data
load 'matlab.mat';load 'train_label.mat';
x = train_feature; xlabel = train_label;

%% Crossvalidation
p = 0.97;
[Train,Test] = crossvalind('HoldOut',train_label,p);
TraingSample = x(Train,:);
TrainingLabel = xlabel(Train,:)';
TestingSample = x(Test,:);
TestingLabel = xlabel(Test,:)';

%% PCA and check how many dimensions we should use
[COEFF,ProjectedTraining] = pca(TraingSample);
ProjectedTesting = bsxfun(@minus,TestingSample,mean(TraingSample))*COEFF;

for i = 1:5
    [outlabel,k] = multiclass(TraingSample(:,i)',TrainingLabel,...
        TestingSample(:,i)','[''OAA'', 0, ''Perceptron'',[1000]]');
    acc(1,i) = mean(outlabel==TestingLabel);
end