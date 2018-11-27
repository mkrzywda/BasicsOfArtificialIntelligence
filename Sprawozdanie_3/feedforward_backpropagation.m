close all; clear all; clc;

%dataset
in = [-2.0 -1.8 -1.6 -1.4 -1.2 -1.0 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]
out = [1663.3144032672324 1690.1132374370839 1688.034998342087 1674.099059643066 1686.7210309127113 1732.9225480289258 1776.4412985191298 1786.0418485521361 1779.9521156718527 1803.5731229031892 0 1928.860217750531 1949.5489457731007 1948.9857411333403 1982.511002459129 2065.507872849039 2147.692111352819 2178.4193810575716 2179.078110374434 2220.2957248379535 2326.150912968639 ]
test = zeros(1);

%tworzymy siec z 8 warstwami ukrytymi
net = feedforwardnet(8);

%algorytm wstecznej propagacji
net.trainFcn = 'traingd';

% manipulujemy wspolczynnikiem  0.5 0.1 0.01
%net.trainParam.mu = 0.1;

% manipulujemy wspolczynnikiem uczenia 0.5 0.1 0.01
net.trainParam.lr = 0.1;

% manipulujemy wspolczynnikiem bezwladnośsci 0.0 0.5 1
net.trainParam.mc = 0.5;

net = train(net, in, out);
efect = zeros(size(net));

% genereujemy wyniki dla funkcji rstrigin_3d oraz testujemy dzialanie sieci.
for k = 1:21
    test(k) = rstrigin_3d(in(k));
	efect(k) = sim(net, in(k)); 
end    


function fx = rstrigin_3d(x)
    if x == 0
        fx = 0;
    else
		x1 = x;
        A = 10;
        n = 100;
        dx = (5.12-x)/n;
        
		fx = A * n;

        for i = 1:n
            x = x1 + (i * dx);
            fx = fx + (x^2) - (A * cos(2 * pi * x));
        end
    end
end
