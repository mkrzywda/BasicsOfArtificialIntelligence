close all; clear all; clc;
       %A B C D E F G H I J K L N O P R S T U Y
iData= [0 1 0 1 1 1 0 1 1 1 1 1 1 0 1 1 0 1 1 1;
        1 1 1 1 1 1 1 0 0 1 0 0 0 1 1 1 1 1 0 0;
        1 1 1 1 1 1 1 0 0 1 0 0 0 1 1 1 1 1 0 1;
        0 0 1 0 1 1 1 1 0 1 1 0 1 0 0 0 1 0 1 0;
        1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 0 1 1;
        0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0;
        0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1;
        1 1 0 1 0 0 0 1 0 1 0 0 1 1 1 1 0 0 1 0;
        1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 0 0 1 0;
        1 1 0 0 1 1 0 1 0 0 1 0 0 0 1 1 1 1 0 1;
        1 1 0 0 1 1 1 1 0 0 0 0 1 0 1 1 1 0 0 0;
        1 0 0 1 0 0 1 1 0 1 0 0 1 1 0 0 0 0 1 0;
        1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 0 0 1 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
        0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0;
        1 1 0 1 0 0 1 1 0 1 0 0 1 1 0 0 1 0 1 0;
        1 1 1 1 1 1 0 1 1 0 1 1 1 0 1 1 1 0 0 0;
        0 1 1 1 1 0 1 0 0 0 0 1 0 1 0 0 1 1 1 1;
        0 1 1 1 1 0 1 0 0 0 0 1 0 1 0 0 1 0 1 0;
        1 0 1 0 1 0 1 1 0 1 1 1 1 0 0 1 0 0 0 0;
        ];
    

dimensions = [4 5];
coverSteps = 100;
initNeighbor = 1;
topologyFcn = 'gridtop';
%topologyFcn = 'hextop';
distanceFcn = 'dist';
dim=dimensions;
covS=coverSteps;
inNeig=initNeighbor;
tpF=topologyFcn;
dsF=distanceFcn;
net = selforgmap(dim,covS,inNeig,tpF,dsF);
net.trainFcn = 'trainbu';
% Liczba epok(max)
net.trainParam.epochs = 2000;
[net,tr] = train(net,iData);
y = net(iData);
plotsompos(net,iData);
grid on
