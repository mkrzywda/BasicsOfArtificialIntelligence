close all; clear all; clc;
Data = iris_dataset;
size(Data);
plot(Data(1,:),Data(2,:),'g.');
hold on; grid on;
dimensions = [8 8]; 
coverSteps = 100;
initNeighbor = 0;

%topologyFcn = 'gridtop';
topologyFcn = 'hextop';
distanceFcn = 'dist';
net = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
net.trainFcn = 'trainbu';
net.trainParam.epochs = 1000;

[net,tr] = train(net,Data);
y = net(Data);
plotsompos(net,Data);
grid on
