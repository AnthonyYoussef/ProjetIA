function [net,tr] = createAndTrainNetwork(hiddenLayerSize,algorithm,iteration,ratio,input,target)
    % Create a Fitting Network
    net = fitnet(hiddenLayerSize,algorithm);

    % Set up Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = ratio(1);
    net.divideParam.valRatio = ratio(2);
    net.divideParam.testRatio = ratio(3);
    net.trainParam.epochs = iteration;
    
    % Train the Network
    [net,tr] = train(net,input,target);