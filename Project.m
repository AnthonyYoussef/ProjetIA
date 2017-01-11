M = csvread('training.csv',1,0);
P = M(:,2:33);

disp(size(P));

%Suppression des lignes où l'attribut PRI jet num est inférieur ou égal à 1
idx = ( P(:,23)> 1 );
P(:,23)
P_New = P(idx,:);

disp(size(P));

%Il reste des valeurs manquantes pour le premier attribut "DER mass MMC"
%Beaucoup moins cependant, on passe de 15% à 0.06
missing = sum(P_New(:,1)==-999.0);
disp(missing);

%On peut récupérer la valeur moyenne pour cette colonne(en ne prenant pas en compte les
%lignes avec la valeur -999) et remplacer les valeurs manquantes par cette
%moyenne

idx_bis = (P_New(:,1) ~= -999);
P_New_temp = P_New(idx_bis,:);
mean_value = mean(P_New_temp(:,1));
disp(mean_value);

for k=1:size(P_New,1)
    if(P_New(k,1)==-999)
        P_New(k,1)=mean_value;
    end
end

%Plus de valeurs manquantes dans le jeu de données 
%réduit de 250000 à 72543 lignes
missing = sum(P_New(:)==-999.0);
disp(missing);
%Suppression des colonnes labels (poids et classe -> s/b ~ 
T = P_New(:,32);
W = P_New(:,31);
input = P_New (:,1:30);

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
%Regarder les résultats pour le jeu de données test