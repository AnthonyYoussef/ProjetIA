%input = csvread('Data/DeletePriJetNumInf1Entries/DeletePriJetNumInf1Entries.csv',1,0);
input = csvread('Data/DeletePriJetNumInf1Entries/EquilibratedDeletePriJetNumInf1Entries.csv',1,0);

input = input(:,2:33);
idx = (input(:,1) ~= -999);
input_temp = input(idx,:);
mean_value = mean(input_temp(:,1));
disp(mean_value);

for k=1:size(input,1)
    if(input(k,1)==-999)
        input(k,1)=mean_value;
    end
end

T = input(:,32);
W = input(:,31);
input = input(:,1:30);

output = [W T];
res = LMNeuralNetworkFunction(input);

%Numeric to nominal
for k=1:size(res,1)
    if(res(k,2)<0.5)
       res(k,2)=0;
    else
        res(k,2)=1;
    end
end

correctPredictions = 0;
%Compare real output values to neural network results
for k=1:size(res,1)
    if(res(k,2)==output(k,2))
        correctPredictions = correctPredictions+1;
    end
end
fprintf('---------- LM algorithm ----------');
fprintf('Number of instances correctyl classified : %d\n',correctPredictions);
fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(res,1)*100);

res = BayesianNeuralNetworkFunction(input);

%Numeric to nominal
for k=1:size(res,1)
    if(res(k,2)<0.5)
       res(k,2)=0;
    else
        res(k,2)=1;
    end
end

correctPredictions = 0;
%Compare real output values to neural network results
for k=1:size(res,1)
    if(res(k,2)==output(k,2))
        correctPredictions = correctPredictions+1;
    end
end
fprintf('---------- Bayesian regularization algorithm ----------');
fprintf('Number of instances correctyl classified : %d\n',correctPredictions);
fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(res,1)*100);

res = SCGNeuralNetworkFunction(input);

%Numeric to nominal
for k=1:size(res,1)
    if(res(k,2)<0.5)
       res(k,2)=0;
    else
        res(k,2)=1;
    end
end

correctPredictions = 0;
%Compare real output values to neural network results
for k=1:size(res,1)
    if(res(k,2)==output(k,2))
        correctPredictions = correctPredictions+1;
    end
end
fprintf('---------- Scale Conjugate Gradient algorithm ----------');
fprintf('Number of instances correctyl classified : %d\n',correctPredictions);
fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(res,1)*100);

res = ECNeuralNetworkFunction(input);

%Numeric to nominal
for k=1:size(res,1)
    if(res(k,2)<0.5)
       res(k,2)=0;
    else
        res(k,2)=1;
    end
end

correctPredictions = 0;
%Compare real output values to neural network results
for k=1:size(res,1)
    if(res(k,2)==output(k,2))
        correctPredictions = correctPredictions+1;
    end
end
fprintf('---------- LV algorithm (equilibrated classes)----------');
fprintf('Number of instances correctyl classified : %d\n',correctPredictions);
fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(res,1)*100);

%Regarder les résultats pour le jeu de données test

test_input = csvread('TestData/DeletePriJetNumInf1Entries/DeletePriJetNumInf1Entries.csv',1,0);

test_input = test_input(:,2:31);
idx = (test_input(:,1) ~= -999);
input_temp = test_input(idx,:);
mean_value = mean(input_temp(:,1));
disp(mean_value);

for k=1:size(test_input,1)
    if(test_input(k,1)==-999)
        test_input(k,1)=mean_value;
    end
end

test_input = test_input(:,1:30);
res = LMNeuralNetworkFunction(test_input);

%Numeric to nominal
for k=1:size(res,1)
    if(res(k,2)<0.5)
       res(k,2)=0;
    else
        res(k,2)=1;
    end
end

