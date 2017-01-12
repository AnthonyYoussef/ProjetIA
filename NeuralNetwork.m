%input = csvread('Data/DeletePriJetNumInf1Entries/DeletePriJetNumInf1Entries.csv',1,0);
input = csvread('Data/DeletePriJetNumInf1Entries/EquilibratedDeletePriJetNumInf1Entries.csv',1,0);

input = input(:,2:33);
idx = (input(:,1) ~= -999);
input_temp = input(idx,:);
mean_value = mean(input_temp(:,1));
disp(mean_value);

for k=1:size(input,1)
    if(input(k,1)==-999)
        input(k,1 )=mean_value;
    end
end

T = input(:,32);
W = input(:,31);
input = input(:,1:30);

target = [W T];

input = input';
target = target';

% Train the Network
[net,tr] = createAndTrainNetwork(10,'trainlm',50,[75 15 15],input, target);
 
% Test the Network
output = net(input);
errors = gsubtract(output,target);
performance = perform(net,target,output);
 
% View the Network
view(net)
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

%Compare real output values to neural network results
for k=1:size(output,1)
    if(output(k,2)== target(k,2))
        correctPredictions = correctPredictions+1;
    end
    if(abs((output(k,1) - target(k,1)))<0.5)
        correctWeight = correctWeight+1;
    end
end

fprintf('---------- LM algorithm results----------');
fprintf('Number of weight correctyl predicted (+/- 0.5): %d\n',correctWeight);
fprintf('Percentage of weight correctly classified : %d\n',correctWeight/size(output,1)*100);
fprintf('Number of instances correctyl classified (+/- 0.5): %d\n',correctPredictions);
fprintf('Percentage of instances correctly classified : %d\n',correctPredictions/size(output,1)*100);

% Plots
figure, plotperform(tr)
figure, plottrainstate(tr)
figure, ploterrhist(errors)
figure, plotregression(target,output)
