clc;clear all;close all;
%% import training and test data
load 'matlab.mat';load 'train_label.mat';
x = train_feature; xlabel = train_label;

%% Crossvalidation
p = 0.9;
[Train,Test] = crossvalind('HoldOut',train_label,p);
TraininggSample = x(Train,:);
TrainingLabel = xlabel(Train,:);
TestingSample = x(Test,:);
TestingLabel = xlabel(Test,:);

%% PCA and check how many dimensions we should use
[COEFF,ProjectedTraining] = pca(TraininggSample);
ProjectedTesting = bsxfun(@minus,TestingSample,mean(TraininggSample))*COEFF;

nclass = max(unique(TrainingLabel));
feature_dim = size(ProjectedTraining, 2);
sample_means = zeros(nclass,feature_dim);
for i=1:nclass
    sample_ind = find(TrainingLabel == i);
    % compute sample mean to use as the class prototype.
    sample_means(i,:) = mean(ProjectedTraining(sample_ind, :),1);
end

for i = 1:104
    dist = pdist2(ProjectedTesting(:,1:i), sample_means(:,1:i));
    [~, pred_label] = min(dist, [], 2);
    ind = find(pred_label ==TestingLabel);
    acc(1,i) = 100*(length(ind) / length(TestingLabel));
end