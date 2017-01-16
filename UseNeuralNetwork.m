function UseNeuralNetwork(filePath,nbCouches,algo,nbEpochs,repartition)
    data = csvread(filePath,1,0);
    disp(filePath);
    
    %Attributs d'entrée
    input = data(:,1:25);
    
    %Attributs à prédire
    W = data(:,26);
    T = data(:,27);
      
    target = [W T];

    input = input';
    target = target';
    
    %Entrainement du réseau de neurones
    [net,tr] = createAndTrainNetwork(nbCouches,algo,nbEpochs,repartition,input, target);

    % Utilisation du réseau de neurones
    output = net(input);
    errors = gsubtract(output,target);
    performance = perform(net,target,output);
    
    
    % Visualisation du réseau de neurones
    view(net);
    
    output = output';
    target = target';
    
    %Transformation des données pour correspondre au classe 0/1
    for k=1:size(output,1)
        if(output(k,2)<0.5)
            output(k,2)=0;
        else
            output(k,2)=1;
        end
    end

    correctPredictions = 0;
    correctWeight = 0;
    
    %%% FAIRE CALCUL RAPPEL ET PRECISION
    % Calcul des Vrais positifs / Faux positifs / Vrais négatifs / Faux
    % négatifs
    VP = 0; FP = 0; VN = 0; FN = 0;
    for k=1:size(target,1)
        if(target(k,2)== 1 && output(k,2)== 1)
            VP = VP+1;
        elseif (target(k,2)== 1 && output(k,2)== 0)
            FP = FP+1;
        elseif (target(k,2)== 0 && output(k,2)== 0)
            VN = VN+1;
        elseif (target(k,2)== 0 && output(k,2)== 1)
            FN = FN+1;
        end
    end
    

    %Compare real output values to neural network results
    for k=1:size(output,1)
        if(output(k,2)== target(k,2))
            correctPredictions = correctPredictions+1;
        end
        if(abs((output(k,1) - target(k,1)))<0.5)
            correctWeight = correctWeight+1;
        end
    end

    fprintf('---------- Neural Network Results----------');
    fprintf('Number of weight correctyl predicted (+/- 0.5): %d\n',correctWeight);
    fprintf('Percentage of weight correctly classified : %d\n',correctWeight/size(output,1)*100);
    fprintf('Number of instances correctly classified (+/- 0.5): %d\n',correctPredictions);
    fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(output,1)*100);
    
    % Précision
    precision = 100*VP/(VP+FP);
    % Rappel 
    rappel = 100*VP/(VP+FN);
    %fprintf('VP : %d\n',VP);
    %fprintf('FP : %d\n',FP);
    fprintf('Precision en pourcentage : %d\n',precision);
    fprintf('Rappel en pourcentage : %d\n',rappel);

    % Plots
    % figure, plotperform(tr)
    % figure, plottrainstate(tr)
    % figure, ploterrhist(errors)
    % figure, plotregression(target,output)



end

