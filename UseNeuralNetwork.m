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
    
    %Calcul de l'exactitude (accuracy)
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
      figure, plotperform(tr)
    % figure, plottrainstate(tr)
    % figure, ploterrhist(errors)
    % figure, plotregression(target,output)
    view(net);
      switch(algo)
      case 'trainlm'
            algo = 'Levenberg-Marquardt';
      case 'trainbr'
            algo = 'Bayesian';
      case 'trainscg'
            algo = 'Scaled Conjugate Gradient';
      end
    
   %%% Cr�ation de la vue pour les r�sultats %%%
    
    % Cr�ation de l'objet Figure
    figure('units','pixels',...
        'position',[400 50 370 500],...
        'numbertitle','off',...
        'name','Higgs Boson Machine Learning Challenge',...
        'menubar','none',...
        'tag','interface');
    
    uicontrol('Style','text',...
        'String','Valeurs des param�tres :',...
        'FontSize',12,...
        'Position',[80 450 230 30]);
    
    uicontrol('Style','text',...
        'String','Nombre de couches cach�es :',...
        'FontSize',12,...
        'Position',[25 420 250 30]);
    
    uicontrol('Style','text',...
        'String',nbCouches,...
        'FontSize',12,...
        'Position',[255 420 50 30]);
    
    uicontrol('Style','text',...
        'String','Nombre d''it�ration :',...
        'FontSize',12,...
        'Position',[37 400 150 30]);
    
    uicontrol('Style','text',...
        'String',nbEpochs,...
        'FontSize',12,...
        'Position',[250 400 50 30]);
    
    uicontrol('Style','text',...
        'String','R�partition Training/Validation/Test (%) :',...
        'FontSize',12,...
        'Position',[10 360 350 30]);
    
    uicontrol('Style','text',...
        'String',repartition(1),...
        'FontSize',12,...
        'Position',[-50 340 150 30]);
    
    uicontrol('Style','text',...
        'String',repartition(2),...
        'FontSize',12,...
        'Position',[100 340 150 30]);
    
    uicontrol('Style','text',...
        'String',repartition(3),...
        'FontSize',12,...
        'Position',[250 340 150 30]);
    
    uicontrol('Style','text',...
        'String','Algorithme :',...
        'FontSize',12,...
        'Position',[0 300 200 30]);    
    
    uicontrol('Style','text',...
        'String',algo,...
        'FontSize',12,...
        'Position',[150 300 230 30]);
    
    uicontrol('Style','text',...
        'String','Data :',...
        'FontSize',12,...
        'Position',[0 280 200 30]);
    
    uicontrol('Style','text',...
        'String',fileName,...
        'FontSize',12,...
        'Position',[150 280 200 30]);
    
    % R�sulats pour les labels
    uicontrol('Style','text',...
        'String','R�sultats pour les labels :',...
        'FontSize',12,...
        'Position',[65 240 230 30]);
    
    uicontrol('Style','text',...
        'String','Pertinence (Accuracy) label :',...
        'FontSize',12,...
        'Position',[10 200 200 30]);
    
    uicontrol('Style','text',...
        'String',accuracyLabel,...
        'FontSize',12,...
        'Position',[200 200 150 30]); 
    
    uicontrol('Style','text',...
        'String','Taux d''erreur label :',...
        'FontSize',12,...
        'Position',[0 180 200 30]);
    
    uicontrol('Style','text',...
        'String',errorLabel,...
        'FontSize',12,...
        'Position',[200 180 150 30]);
    
    uicontrol('Style','text',...
        'String','Pr�cision label :',...
        'FontSize',12,...
        'Position',[0 160 200 30]);
    
    uicontrol('Style','text',...
        'String',precisionLabel,...
        'FontSize',12,...
        'Position',[200 160 150 30]);
    
    uicontrol('Style','text',...
        'String','Rappel label :',...
        'FontSize',12,...
        'Position',[0 140 200 30]);
    
    uicontrol('Style','text',...
        'String',rappelLabel,...
        'FontSize',12,...
        'Position',[200 140 150 30]);

    % R�sulats pour les poids
    uicontrol('Style','text',...
        'String','R�sultats pour les poids :',...
        'FontSize',12,...
        'Position',[70 90 230 30]);
    
    uicontrol('Style','text',...
        'String','Pertinence (Accuracy) poids :',...
        'FontSize',12,...
        'Position',[10 70 200 30]);
    
    uicontrol('Style','text',...
        'String',accuracyWeight,...
        'FontSize',12,...
        'Position',[230 70 90 30]); 
    
    uicontrol('Style','text',...
        'String','Taux d''erreur poids :',...
        'FontSize',12,...
        'Position',[0 50 200 30]);
    
    uicontrol('Style','text',...
        'String',errorWeight,...
        'FontSize',12,...
        'Position',[200 50 150 30]);
       
       end

