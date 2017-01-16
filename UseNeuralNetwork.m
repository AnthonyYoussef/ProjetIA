function UseNeuralNetwork(fileName,nbCouches,algo,nbEpochs,repartition)
    %data = csvread('Data/SignificantCleanNormalizedEquilibratedEntries.csv',1,0);
    file = strcat('Data/',fileName);
    disp(fileName);
    disp('prout');
    disp(file);
    data = csvread(file,1,0);
  
    %Input attributes
    input = data(:,1:25);
    
      %targets
    W = data(:,26);
    T = data(:,27);
      
    target = [W T];

    input = input';
    target = target';
%     idx = (input(:,1) ~= -999);
%     input_temp = input(idx,:);
%     mean_value = mean(input_temp(:,1));
%     disp(mean_value);
% 
%     for k=1:size(input,1)
%         if(input(k,1)==-999)
%             input(k,1 )=mean_value;
%         end
%     end

    

    % Train the Network
    [net,tr] = createAndTrainNetwork(nbCouches,algo,nbEpochs,repartition,input, target);

    % Test the Network
    output = net(input);
    errors = gsubtract(output,target);
    performance = perform(net,target,output);
    
    
    % View the Network
    view(net);
    output = output';
    target = target';
    
    %Numeric to nominal
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
for k=1:size(res,1)
    if(res(k,2)== 1 && output(k,2)== 1)
        VP = VP+1;
    elseif (res(k,2)== 1 && output(k,2)== 0)
        FP = FP+1;
    elseif (res(k,2)== 0 && output(k,2)== 0)
        VN = VN+1;
    elseif (res(k,2)== 0 && output(k,2)== 1)
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
%     figure, plotperform(tr)
%     figure, plottrainstate(tr)
%     figure, ploterrhist(errors)
%     figure, plotregression(target,output)



end

