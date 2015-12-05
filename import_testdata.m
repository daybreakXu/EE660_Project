clc;clear all;close all;
load adult_test.mat;
test_feature = zeros(16281,105);
test_label = zeros(16281,1);

test_feature(:,1) = adult_test.age;
test_feature(:,10) = adult_test.fnlwgt;
test_feature(:,27) = adult_test.education_num;
test_feature(:,62) = adult_test.capital_gain;
test_feature(:,63) = adult_test.capital_loss;
test_feature(:,64) = adult_test.hours_per_week;

for  i = 1:16281
    string = char(adult_test.workclass(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' Private'},
            test_feature(i,2) = 1;
        case {' Self-emp-not-inc'},
            test_feature(i,3) = 1;
        case {' Self-emp-inc'},
            test_feature(i,4) = 1;
        case {' Federal-gov'},
            test_feature(i,5) = 1;
        case {' Local-gov'},
            test_feature(i,6) = 1;
        case {' State-gov'},
            test_feature(i,7) = 1;
        case {' Without-pay'},
            test_feature(i,8) = 1;
        case {' Never-worked'},
            test_feature(i,9) = 1;
    end
    
    string = char(adult_test.education(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' Bachelors'},
            test_feature(i,11) = 1;
        case {' Some-college'},
            test_feature(i,12) = 1;
        case {' 11th'},
            test_feature(i,13) = 1;
        case {' HS-grad'},
            test_feature(i,14) = 1;
        case {' Prof-school'},
            test_feature(i,15) = 1;
        case {' Assoc-acdm'},
            test_feature(i,16) = 1;
        case {' Assoc-voc'},
            test_feature(i,17) = 1;
        case {' 9th'},
            test_feature(i,18) = 1;
        case {' 7th-8th'},
            test_feature(i,19) = 1;
        case {' 12th'},
            test_feature(i,20) = 1;
        case {' Masters'},
            test_feature(i,21) = 1;
        case {' 1st-4th'},
            test_feature(i,22) = 1;
        case {' 10th'},
            test_feature(i,23) = 1;
        case {' 5th-6th'},
            test_feature(i,24) = 1;
        case {' Doctorate'},
            test_feature(i,25) = 1;
        case {' Preschool'},
            test_feature(i,26) = 1;
    end
    
    string = char(adult_test.marital_status(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' Married-civ-spouse'},
            test_feature(i,28) = 1;
        case {' Divorced'},
            test_feature(i,29) = 1;
        case {' Never-married'},
            test_feature(i,30) = 1;
        case {' Separated'},
            test_feature(i,31) = 1;
        case {' Widowed'},
            test_feature(i,32) = 1;
        case {' Married-spouse-absent'},
            test_feature(i,33) = 1;
        case {' Married-AF-spouse'},
            test_feature(i,34) = 1;
    end
    
    string = char(adult_test.occupation(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' Tech-support'},
            test_feature(i,35) = 1;
        case {' Craft-repair'},
            test_feature(i,36) = 1;
        case {' Other-service'},
            test_feature(i,37) = 1;
        case {' Sales'},
            test_feature(i,38) = 1;
        case {' Exec-managerial'},
            test_feature(i,39) = 1;
        case {' Prof-specialty'},
            test_feature(i,40) = 1;
        case {' Handlers-cleaners'},
            test_feature(i,41) = 1;
        case {' Machine-op-inspct'},
            test_feature(i,42) = 1;
        case {' Adm-clerical'},
            test_feature(i,43) = 1;
        case {' Farming-fishing'},
            test_feature(i,44) = 1;
        case {' Transport-moving'},
            test_feature(i,45) = 1;
        case {' Priv-house-serv'},
            test_feature(i,46) = 1;
        case {' Protective-serv'},
            test_feature(i,47) = 1;
        case {' Armed-Forces'},
            test_feature(i,48) = 1;
    end
    
    string = char(adult_test.relationship(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' Wife'},
            test_feature(i,49) = 1;
        case {' Own-child'},
            test_feature(i,50) = 1;
        case {' Husband'},
            test_feature(i,51) = 1;
        case {' Not-in-family'},
            test_feature(i,52) = 1;
        case {' Other-relative'},
            test_feature(i,53) = 1;
        case {' Unmarried'},
            test_feature(i,54) = 1;
    end
    
    string = char(adult_test.race(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' White'},
            test_feature(i,55) = 1;
        case {' Asian-Pac-Islander'},
            test_feature(i,56) = 1;
        case {' Amer-Indian-Eskimo'},
            test_feature(i,57) = 1;
        case {' Other'},
            test_feature(i,58) = 1;
        case {' Black'},
            test_feature(i,59) = 1;
    end
    
    string = char(adult_test.sex(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' Female'},
            test_feature(i,60) = 1;
        case {' Male'},
            test_feature(i,61) = 1;
    end
    
    string = char(adult_test.native_country(i));
    switch (string)
        case {' ?'},
            test_feature(i,:) = 0;
            continue;
        case {' United-States'},
            test_feature(i,65) = 1;
        case {' Cambodia'},
            test_feature(i,66) = 1;
        case {' England'},
            test_feature(i,67) = 1;
        case {' Puerto-Rico'},
            test_feature(i,68) = 1;
        case {' Canada'},
            test_feature(i,69) = 1;
        case {' Germany'},
            test_feature(i,70) = 1;
        case {' Outlying-US(Guam-USVI-etc)'},
            test_feature(i,71) = 1;
        case {' India'},
            test_feature(i,72) = 1;
        case {' Japan'},
            test_feature(i,73) = 1;
        case {' Greece'},
            test_feature(i,74) = 1;
        case {' South'},
            test_feature(i,75) = 1;
        case {' China'},
            test_feature(i,76) = 1;
        case {' Cuba'},
            test_feature(i,77) = 1;
        case {' Iran'},
            test_feature(i,78) = 1;
        case {' Honduras'},
            test_feature(i,79) = 1;
        case {' Philippines'},
            test_feature(i,80) = 1;
        case {' Italy'},
            test_feature(i,81) = 1;
        case {' Poland'},
            test_feature(i,82) = 1;
        case {' Jamaica'},
            test_feature(i,83) = 1;
        case {' Vietnam'},
            test_feature(i,84) = 1;
        case {' Mexico'},
            test_feature(i,85) = 1;
        case {' Portugal'},
            test_feature(i,86) = 1;
        case {' Ireland'},
            test_feature(i,87) = 1;
        case {' France'},
            test_feature(i,88) = 1;
        case {' Dominican-Republic'},
            test_feature(i,89) = 1;
        case {' Laos'},
            test_feature(i,90) = 1;
        case {' Ecuador'},
            test_feature(i,91) = 1;
        case {' Taiwan'},
            test_feature(i,92) = 1;
        case {' Haiti'},
            test_feature(i,93) = 1;
        case {' Columbia'},
            test_feature(i,94) = 1;
        case {' Hungary'},
            test_feature(i,95) = 1;
        case {' Guatemala'},
            test_feature(i,96) = 1;
        case {' Nicaragua'},
            test_feature(i,97) = 1;
        case {' Scotland'},
            test_feature(i,98) = 1;
        case {' Thailand'},
            test_feature(i,99) = 1;
        case {' Yugoslavia'},
            test_feature(i,100) = 1;
        case {' El-Salvador'},
            test_feature(i,101) = 1;
        case {' Trinadad&Tobago'},
            test_feature(i,102) = 1;
        case {' Peru'},
            test_feature(i,103) = 1;
        case {' Hong'},
            test_feature(i,104) = 1;
        case {' Holand-Netherlands'},
            test_feature(i,105) = 1;
    end
    
    string = char(adult_test.class(i));
    switch (string)
        case {'?'},
            test_feature(i,:) = 0;
            continue;
        case {' <=50K.'},
            test_label(i,1) = 1;
        case {' >50K.'},
            test_label(i,1) = 2;
    end
    
end
test_label(test_feature(:,1)==0,:) = [];
test_feature(test_feature(:,1)==0,:) = [];