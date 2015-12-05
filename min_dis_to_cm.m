clc;clear all;close all;
%% import training and test data
load 'train_feature.mat';load 'train_label.mat';
x = train_feature; xlabel = train_label;

%% Crossvalidation
p = 0.5;
[Train,Test] = crossvalind('HoldOut',train_label,p);
TrainingSample = x(Train,:);
TrainingLabel = xlabel(Train,:);
TestingSample = x(Test,:);
TestingLabel = xlabel(Test,:);

nclass = max(unique(TrainingLabel));
feature_dim = size(TrainingSample, 2);
sample_means = zeros(nclass,feature_dim);
for i=1:nclass
    sample_ind = find(TrainingLabel == i);
    % compute sample mean to use as the class prototype.
    sample_means(i,:) = mean(TrainingSample(sample_ind, :),1);
end

%% Random assignment of predicted labels
pred_label = randi([1 2],length(TestingLabel),1);
ind = find(pred_label == TestingLabel);
percent_error = 100*(length(ind) / length(TestingLabel));
disp(['The accuracy with random predicted labels is', ...
    num2str(percent_error),'%']);

%% Error rate on testing set without normalization
dist = pdist2(TestingSample, sample_means);
[~, pred_label] = min(dist, [], 2);
ind = find(pred_label == TestingLabel);
percent_error = 100*(length(ind) / length(TestingLabel));
disp(['The accuracy of data without normalization is ', num2str(percent_error),'%']);

%% feature normalization
load 'matlab.mat';load 'train_label.mat';
x = train_feature; xlabel = train_label;

%% Crossvalidation
p = 0.9;
[Train,Test] = crossvalind('HoldOut',train_label,p);
TrainingSample = x(Train,:);
TrainingLabel = xlabel(Train,:);
TestingSample = x(Test,:);
TestingLabel = xlabel(Test,:);

nclass = max(unique(TrainingLabel));
feature_dim = size(TrainingSample, 2);
sample_means = zeros(nclass,feature_dim);
for i=1:nclass
    sample_ind = find(TrainingLabel == i);
    % compute sample mean to use as the class prototype.
    sample_means(i,:) = mean(TrainingSample(sample_ind, :),1);
end

%% Error rate on testing set with normalization
dist = pdist2(TrainingSample, sample_means);
[~, pred_label] = min(dist, [], 2);
ind = find(pred_label == TrainingLabel);
percent_error = 100*(length(ind) / length(TrainingLabel));
disp(['The accuracy of data without normalization is ', num2str(percent_error),'%']);