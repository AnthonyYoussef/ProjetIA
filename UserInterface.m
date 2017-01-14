%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUT DE LA FONCTION PRINCIPALE%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function app
    
    
    % Cr�ation de l'objet Figure
    figure('units','pixels',...
        'position',[250 250 400 400],...
        'numbertitle','off',...
        'name','Higgs Boson Machine Learning Challenge',...
        'menubar','none',...
        'tag','interface');


    % Cr�ation de l'objet Uicontrol Text r�sultat
    couches = uicontrol('style','edit',...
        'position',[240 355 150 30],...
        'string','0',...
        'FontSize',12,...
        'tag','nbCouches');

    setappdata(0,'couches',couches);


    uicontrol('Style','text',...
        'String','Nombre de couches cach�es :',...
        'FontSize',12,...
        'Position',[0 350 230 30]);


    epochs = uicontrol('style','edit',...
        'position',[240 290 150 30],...
        'string','0',...
        'FontSize',12,...
        'tag','nbEpochs');

    setappdata(0,'epochs',epochs);

    uicontrol('Style','text',...
        'String','Nombre d''it�rations :',...
        'FontSize',12,...
        'Position',[0 285 230 30]);

    uicontrol('Style','text',...
        'String','R�partition Training/Validation/Test (%) :',...
        'FontSize',12,...
        'Position',[10 225 400 30]);

    training =   uicontrol('style','edit',...
        'position',[20 190 100 30],...
        'string','0',...
        'FontSize',12,...
        'tag','TrainingSet');

    setappdata(0,'training',training);

    validation = uicontrol('style','edit',...
        'position',[155 190 100 30],...
        'string','0',...
        'FontSize',12,...
        'tag','ValidationSet');

    setappdata(0,'validation',validation);

    test = uicontrol('style','edit',...
        'position',[290 190 100 30],...
        'string','0',...
        'FontSize',12,...
        'tag','TestSet');

    setappdata(0,'test',test);
    setappdata(0,'fileName','SignificantCleanNormalizedEquilibratedEntries.csv');
    
    uicontrol('Style', 'pushbutton', 'String', 'Load data',...
        'Position', [30 75 120 40],...
        'FontSize',10,...
        'Callback', 'fileName = uigetfile(''*.csv'');setappdata(0,''fileName'',fileName);');

    uicontrol('Style','text',...
        'String','Algorithme d''apprentissage : ',...
        'FontSize',12,...
        'Position',[0 130 220 30]);

    algorithm = uicontrol('Style', 'popup',...
        'String', {'Levenberg-Marquardt','Bayesian','Scaled Conjugate Gradient'},...
        'FontSize',10,...
        'HandleVisibility','off',...
        'tag','algo',...
        'Position', [220 102 160 60]);

    setappdata(0,'algo',algorithm);

    uicontrol('Style', 'pushbutton', 'String', 'Launch training',...
        'Position', [150 20 120 40],...
        'FontSize',10,...
        'Callback', @valider);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIN DE LA FONCTION PRINCIPALE%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUT DE LA FONCTION METTRE A JOUR%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function valider(obj,event)

    %R�cup�ration des param�tres
    algo = getappdata(0,'algo');
    nbCouches = getappdata(0,'couches');
    nbEpochs = getappdata(0,'epochs');
    training = getappdata(0,'training');
    validation = getappdata(0,'validation');
    test = getappdata(0,'test');
    fileName = getappdata(0,'fileName');
    
    %V�rification des valeurs saisies pour les diff�rents param�tres 
    if isempty(nbCouches.String) || ~isinteger(nbCouches.String)
        if(str2num(nbCouches.String)<=0)
            msgbox('Le nombre de couches cach�es doit �tre un nombre positif (valeur par d�faut = 10) )');
            nbCouches = 10;
        else
            nbCouches = str2num(nbCouches.String);
        end
    end


    if isempty(nbEpochs.String) || ~isinteger(nbEpochs.String)
        if(str2num(nbEpochs.String)<=0)
            msgbox('Le nombre d''it�rations doit �tre un nombre positif (valeur par d�faut = 50) )');
            nbEpochs = 50;
        else
            nbEpochs = str2num(nbEpochs.String);
        end
    end

    empty = isempty(training.String)||isempty(validation.String)|| isempty(test.String);
    correctInteger = isinteger(training.String)&& isinteger(validation.String)&& isinteger(test.String);
    if ~empty && correctInteger
        training = str2num(training.Value);
        validation = str2num(validation.Value);
        test = str2num(test.Value);
        
        if (training + validation + test)==100
            repartition = [training validation test];
        else
            repartition = [70 15 15];
        end 
        
    else 
       repartition = [70 15 15]; 
    end
    
    switch(algo.Value)
        case 1
            algo = 'trainlm';
        case 2
            algo = 'trainbr';
        case 3
            algo = 'trainscg';
    end
    
    UseNeuralNetwork(fileName,nbCouches,algo,nbEpochs,repartition);

end



