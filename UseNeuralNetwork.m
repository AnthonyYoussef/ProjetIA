function UseNeuralNetwork(fileName,folder,nbCouches,algo,nbEpochs,repartition)
    filePath = strcat(folder,fileName);
    data = csvread(filePath,1,0);
    
    %On ne garde que les colonnes qui nous int�ressent
    input = data(:,[2:16 18:19 21 23:26 28:29 31]);
    
    %Attributs � pr�dire
    W = data(:,32);
    T = data(:,33);
      
    target = [W T];

    input = input';
    target = target';
    
    %Entrainement du r�seau de neurones
    [net,tr] = createAndTrainNetwork(nbCouches,algo,nbEpochs,repartition,input, target);

    % Utilisation du r�seau de neurones
    output = net(input);
    errors = gsubtract(output,target);
    performance = perform(net,target,output);
    
    
    % Visualisation du r�seau de neurones
    view(net);
    
    output = output';
    target = target';
    
    %Transformation des donn�es pour correspondre au classe 0/1
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
    % Calcul des Vrais positifs / Faux positifs / Vrais n�gatifs / Faux
    % n�gatifs pour label
    VPl = 0; FPl = 0; VNl = 0; FNl = 0;
    for k=1:size(target,1)
        if(target(k,2)== 1 && output(k,2)== 1)
            VPl = VPl+1;
        elseif (target(k,2)== 1 && output(k,2)== 0)
            FPl = FPl+1;
        elseif (target(k,2)== 0 && output(k,2)== 0)
            VNl = VNl+1;
        elseif (target(k,2)== 0 && output(k,2)== 1)
            FNl = FNl+1;
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
    
    accuracyLabel = correctPredictions/size(output,1)*100;
    accuracyWeight = correctWeight/size(output,1)*100;
    errorLabel = 100-correctPredictions/size(output,1)*100;
    errorWeight = 100-correctWeight/size(output,1)*100;

    fprintf('---------- Neural Network Results----------');
    fprintf('Number of weight correctyl predicted (+/- 0.5): %d\n',correctWeight);
    fprintf('Percentage of weight correctly classified : %d\n',correctWeight/size(output,1)*100);
    fprintf('Number of instances correctly classified (+/- 0.5): %d\n',correctPredictions);
    fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(output,1)*100);
    
    % Pr�cision Label
    precisionLabel = 100*VPl/(VPl+FPl);
    % Rappel Label
    rappelLabel = 100*VPl/(VPl+FNl);
    %fprintf('VP : %d\n',VP);
    %fprintf('FP : %d\n',FP);
    fprintf('Precision en pourcentage : %d\n',precisionLabel);
    fprintf('Rappel en pourcentage : %d\n',rappelLabel);
    
    

    
    % Plots
    % figure, plotperform(tr)
    % figure, plottrainstate(tr)
    % figure, ploterrhist(errors)
    % figure, plotregression(target,output)

    
    
   %%% Cr�ation de la vue pour les r�sultats %%%

% Cr�ation de l'objet Figure
    figure('units','pixels',...
        'position',[250 250 800 400],...
        'numbertitle','off',...
        'name','Higgs Boson Machine Learning Challenge',...
        'menubar','none',...
        'tag','interface');
    
    uicontrol('Style','text',...
        'String','Param�tres :',...
        'FontSize',12,...
        'Position',[0 350 230 30]);
    
    uicontrol('Style','text',...
        'String','Nombre de couches cach�es :',...
        'FontSize',10,...
        'Position',[0 320 230 30]);
    
    uicontrol('Style','text',...
        'String',nbCouches,...
        'FontSize',10,...
        'Position',[210 320 150 30]);
    
    uicontrol('Style','text',...
        'String','Nombre d''it�ration :',...
        'FontSize',10,...
        'Position',[0 300 150 30]);
    
    uicontrol('Style','text',...
        'String',nbEpochs,...
        'FontSize',10,...
        'Position',[210 300 150 30]);
    
    uicontrol('Style','text',...
        'String','R�partition Training/Validation/Test (%) :',...
        'FontSize',10,...
        'Position',[0 260 250 30]);
    
    uicontrol('Style','text',...
        'String',repartition(1),...
        'FontSize',10,...
        'Position',[0 240 150 30]);
    
    uicontrol('Style','text',...
        'String',repartition(2),...
        'FontSize',10,...
        'Position',[150 240 150 30]);
    
    uicontrol('Style','text',...
        'String',repartition(3),...
        'FontSize',10,...
        'Position',[300 240 150 30]);
    
    uicontrol('Style','text',...
        'String','Algorithme d''apprentissage :',...
        'FontSize',10,...
        'Position',[0 200 230 30]);    
    
    uicontrol('Style','text',...
        'String',algo,...
        'FontSize',10,...
        'Position',[200 200 230 30]);
    
    uicontrol('Style','text',...
        'String','Data :',...
        'FontSize',10,...
        'Position',[0 180 200 30]);
    
    uicontrol('Style','text',...
        'String',fileName,...
        'FontSize',10,...
        'Position',[200 180 200 30]);
    
    % R�sulats pour les labels
    uicontrol('Style','text',...
        'String','R�sultats pour les labels :',...
        'FontSize',12,...
        'Position',[0 140 230 30]);
    
    uicontrol('Style','text',...
        'String','Pertinence (Accuracy) label :',...
        'FontSize',10,...
        'Position',[0 100 200 30]);
    
    uicontrol('Style','text',...
        'String',accuracyLabel,...
        'FontSize',12,...
        'Position',[200 100 150 30]); 
    
    uicontrol('Style','text',...
        'String','Taux d''erreur label :',...
        'FontSize',10,...
        'Position',[0 80 200 30]);
    
    uicontrol('Style','text',...
        'String',errorLabel,...
        'FontSize',12,...
        'Position',[200 80 150 30]);
    
    uicontrol('Style','text',...
        'String','Pr�cision label :',...
        'FontSize',10,...
        'Position',[0 60 200 30]);
    
    uicontrol('Style','text',...
        'String',precisionLabel,...
        'FontSize',12,...
        'Position',[200 60 150 30]);
    
    uicontrol('Style','text',...
        'String','rappelLabel :',...
        'FontSize',10,...
        'Position',[0 40 200 30]);
    
    uicontrol('Style','text',...
        'String',rappelLabel,...
        'FontSize',12,...
        'Position',[200 40 150 30]);
    
    
    % R�sulats pour les poids
    uicontrol('Style','text',...
        'String','R�sultats pour les poids :',...
        'FontSize',12,...
        'Position',[400 140 230 30]);
    
    uicontrol('Style','text',...
        'String','Pertinence (Accuracy) poids :',...
        'FontSize',10,...
        'Position',[400 100 200 30]);
    
    uicontrol('Style','text',...
        'String',accuracyWeight,...
        'FontSize',12,...
        'Position',[600 100 150 30]); 
    
    uicontrol('Style','text',...
        'String','Taux d''erreur poids :',...
        'FontSize',10,...
        'Position',[400 80 200 30]);
    
    uicontrol('Style','text',...
        'String',errorWeight,...
        'FontSize',12,...
        'Position',[600 80 150 30]);
    
       end

