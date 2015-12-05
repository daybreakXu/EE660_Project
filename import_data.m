clc;clear all;close all;
load adult_sample.mat;
train_feature = zeros(32561,105);
train_label = zeros(32561,1);

train_feature(:,1) = sample.age;
train_feature(:,10) = sample.fnlwgt;
train_feature(:,27) = sample.education_num;
train_feature(:,62) = sample.capital_gain;
train_feature(:,63) = sample.capital_loss;
train_feature(:,64) = sample.hours_per_week;

for  i = 1:32561
    string = char(sample.workclass(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' Private'},
            train_feature(i,2) = 1;
        case {' Self-emp-not-inc'},
            train_feature(i,3) = 1;
        case {' Self-emp-inc'},
            train_feature(i,4) = 1;
        case {' Federal-gov'},
            train_feature(i,5) = 1;
        case {' Local-gov'},
            train_feature(i,6) = 1;
        case {' State-gov'},
            train_feature(i,7) = 1;
        case {' Without-pay'},
            train_feature(i,8) = 1;
        case {' Never-worked'},
            train_feature(i,9) = 1;
    end
    
    string = char(sample.education(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' Bachelors'},
            train_feature(i,11) = 1;
        case {' Some-college'},
            train_feature(i,12) = 1;
        case {' 11th'},
            train_feature(i,13) = 1;
        case {' HS-grad'},
            train_feature(i,14) = 1;
        case {' Prof-school'},
            train_feature(i,15) = 1;
        case {' Assoc-acdm'},
            train_feature(i,16) = 1;
        case {' Assoc-voc'},
            train_feature(i,17) = 1;
        case {' 9th'},
            train_feature(i,18) = 1;
        case {' 7th-8th'},
            train_feature(i,19) = 1;
        case {' 12th'},
            train_feature(i,20) = 1;
        case {' Masters'},
            train_feature(i,21) = 1;
        case {' 1st-4th'},
            train_feature(i,22) = 1;
        case {' 10th'},
            train_feature(i,23) = 1;
        case {' 5th-6th'},
            train_feature(i,24) = 1;
        case {' Doctorate'},
            train_feature(i,25) = 1;
        case {' Preschool'},
            train_feature(i,26) = 1;
    end
    
    string = char(sample.marital_status(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' Married-civ-spouse'},
            train_feature(i,28) = 1;
        case {' Divorced'},
            train_feature(i,29) = 1;
        case {' Never-married'},
            train_feature(i,30) = 1;
        case {' Separated'},
            train_feature(i,31) = 1;
        case {' Widowed'},
            train_feature(i,32) = 1;
        case {' Married-spouse-absent'},
            train_feature(i,33) = 1;
        case {' Married-AF-spouse'},
            train_feature(i,34) = 1;
    end
    
    string = char(sample.occupation(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' Tech-support'},
            train_feature(i,35) = 1;
        case {' Craft-repair'},
            train_feature(i,36) = 1;
        case {' Other-service'},
            train_feature(i,37) = 1;
        case {' Sales'},
            train_feature(i,38) = 1;
        case {' Exec-managerial'},
            train_feature(i,39) = 1;
        case {' Prof-specialty'},
            train_feature(i,40) = 1;
        case {' Handlers-cleaners'},
            train_feature(i,41) = 1;
        case {' Machine-op-inspct'},
            train_feature(i,42) = 1;
        case {' Adm-clerical'},
            train_feature(i,43) = 1;
        case {' Farming-fishing'},
            train_feature(i,44) = 1;
        case {' Transport-moving'},
            train_feature(i,45) = 1;
        case {' Priv-house-serv'},
            train_feature(i,46) = 1;
        case {' Protective-serv'},
            train_feature(i,47) = 1;
        case {' Armed-Forces'},
            train_feature(i,48) = 1;
    end
    
    string = char(sample.relationship(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' Wife'},
            train_feature(i,49) = 1;
        case {' Own-child'},
            train_feature(i,50) = 1;
        case {' Husband'},
            train_feature(i,51) = 1;
        case {' Not-in-family'},
            train_feature(i,52) = 1;
        case {' Other-relative'},
            train_feature(i,53) = 1;
        case {' Unmarried'},
            train_feature(i,54) = 1;
    end
    
    string = char(sample.race(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' White'},
            train_feature(i,55) = 1;
        case {' Asian-Pac-Islander'},
            train_feature(i,56) = 1;
        case {' Amer-Indian-Eskimo'},
            train_feature(i,57) = 1;
        case {' Other'},
            train_feature(i,58) = 1;
        case {' Black'},
            train_feature(i,59) = 1;
    end
    
    string = char(sample.sex(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' Female'},
            train_feature(i,60) = 1;
        case {' Male'},
            train_feature(i,61) = 1;
    end
    
    string = char(sample.native_country(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' United-States'},
            train_feature(i,65) = 1;
        case {' Cambodia'},
            train_feature(i,66) = 1;
        case {' England'},
            train_feature(i,67) = 1;
        case {' Puerto-Rico'},
            train_feature(i,68) = 1;
        case {' Canada'},
            train_feature(i,69) = 1;
        case {' Germany'},
            train_feature(i,70) = 1;
        case {' Outlying-US(Guam-USVI-etc)'},
            train_feature(i,71) = 1;
        case {' India'},
            train_feature(i,72) = 1;
        case {' Japan'},
            train_feature(i,73) = 1;
        case {' Greece'},
            train_feature(i,74) = 1;
        case {' South'},
            train_feature(i,75) = 1;
        case {' China'},
            train_feature(i,76) = 1;
        case {' Cuba'},
            train_feature(i,77) = 1;
        case {' Iran'},
            train_feature(i,78) = 1;
        case {' Honduras'},
            train_feature(i,79) = 1;
        case {' Philippines'},
            train_feature(i,80) = 1;
        case {' Italy'},
            train_feature(i,81) = 1;
        case {' Poland'},
            train_feature(i,82) = 1;
        case {' Jamaica'},
            train_feature(i,83) = 1;
        case {' Vietnam'},
            train_feature(i,84) = 1;
        case {' Mexico'},
            train_feature(i,85) = 1;
        case {' Portugal'},
            train_feature(i,86) = 1;
        case {' Ireland'},
            train_feature(i,87) = 1;
        case {' France'},
            train_feature(i,88) = 1;
        case {' Dominican-Republic'},
            train_feature(i,89) = 1;
        case {' Laos'},
            train_feature(i,90) = 1;
        case {' Ecuador'},
            train_feature(i,91) = 1;
        case {' Taiwan'},
            train_feature(i,92) = 1;
        case {' Haiti'},
            train_feature(i,93) = 1;
        case {' Columbia'},
            train_feature(i,94) = 1;
        case {' Hungary'},
            train_feature(i,95) = 1;
        case {' Guatemala'},
            train_feature(i,96) = 1;
        case {' Nicaragua'},
            train_feature(i,97) = 1;
        case {' Scotland'},
            train_feature(i,98) = 1;
        case {' Thailand'},
            train_feature(i,99) = 1;
        case {' Yugoslavia'},
            train_feature(i,100) = 1;
        case {' El-Salvador'},
            train_feature(i,101) = 1;
        case {' Trinadad&Tobago'},
            train_feature(i,102) = 1;
        case {' Peru'},
            train_feature(i,103) = 1;
        case {' Hong'},
            train_feature(i,104) = 1;
        case {' Holand-Netherlands'},
            train_feature(i,105) = 1;
    end
    
    string = char(sample.class(i));
    switch (string)
        case {' ?'},
            train_feature(i,:) = 0;
            continue;
        case {' <=50K'},
            train_label(i,1) = 1;
        case {' >50K'},
            train_label(i,1) = 2;
    end
    
end
train_label(train_feature(:,1)==0,:) = [];
train_feature(train_feature(:,1)==0,:) = [];

train_samples = size(train_label,1);

feature_mean = mean(train_feature,1);
feature_std = std(train_feature,0,1);
train_feature = (train_feature - repmat(feature_mean,train_samples,1))./...
    repmat(feature_std,train_samples,1);

train_feature(:,9) = [];
s1 = sum(train_label==2);