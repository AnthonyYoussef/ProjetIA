X = ;       %this are the 16 features
y = output;      %and the classification (true / false)

c = cvpartition(y,'k',10);  %create 10-fold cross validation
opts = statset('display','iter'); %show iterations

direction='forward'; %or 'backward' 

[fs,history] = sequentialfs(@PartLDA,X,y,'cv',c,'options',opts,'direction',direction);