close all; clear all; clc;
 
minmax=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
	0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
	0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
	0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
	0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
	0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
	0 1; 0 1; 0 1; 0 1];

count_input= 64;
 
net = newff(minmax, count_input,{'tansig'}, 'trainlm', 'learnh');
 
%column represent emoticons
input  = [ 0 0 0 0;
       	0 0 0 0;
       	1 1 1 1;
       	1 1 1 1;
       	1 1 1 1;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
 	      0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	1 1 1 1;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	1 1 1 1;
       	1 1 1 1;
       	0 0 0 0;
       	1 0 1 0;
       	0 1 1 1;
       	0 1 1 1;
       	1 0 1 0;
       	0 0 0 0;
       	1 1 1 1;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 1;
       	1 1 0 0;
       	1 1 0 0;
       	0 0 0 1;
  	      0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
       	0 0 0 0;
       	1 1 1 1;
            1 1 1 1;
       	1 1 1 1;
       	1 1 1 1;
       	0 0 0 0;
       	0 0 0 0;
       	];
 
%1 succes / 0 fail in emotikon.
output = [ 1 0 0 0   %smile
       	0 1 0 0   %shock
           0 0 1 0   %confuse
       	0 0 0 1]; %sad 
 
%Hebb Learn Parameters
lp.dr = 0.01; %wsp. zapominania
lp.lr = 0.01; %wsp. uczenia
 
%Use Hebb Methods
hebb = learnh( [], input, [], [], output, [], [], [], [], [], lp, []);
heb=hebb';
 
net.trainParam.epochs = 1000
net.trainParam.goal = 0.01;
net = train(net, input, heb);
   		   
%Training Data.
smile = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 1 0 0 1 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];

shock = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 0 1 1 0 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];

confuse = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 1 1 1 1 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
sad = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 0 1 1 0 0 1; 1 0 1 0 0 1 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
 
%TEST.
test = sim(net, smile);
test1 = sim(net, shock);
test2 = sim(net, confuse);
test3 = sim(net, sad);
 
%WRITE VALUE
disp('SMILE ='), disp(test(1));
disp('SHOCK ='), disp(test1(1));
disp('CONFUSE ='), disp(test2(1));
disp('SAD ='), disp(test3(1));
