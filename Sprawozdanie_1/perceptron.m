
%(Tworzenie pojedynczego neuronu o podanych przedziałach wartości.W moim przypadku są to dwa wejścia: pierwsze [0,1] oraz drugie [-2,2] %)
        net=newp([0 1; -2 2],1);
            
%(Tworzenie wektorów wynikowych W (opisuje wartości na wejściach) oraz T (opisuje wartości wynikowe). Otrzymujemy zestaw trzech wektorów które opisuje działanie bramki logicznej, której tablicę prawdy przedstawiłem już wcześniej. %)
              W=[0 0 1 1; 0 1 0 1];
              T=[0 0 0 1];
            
% Inicjujemy sieć perceptronowa w której wartość wag i progów jest losowa.
              net=init(net);
            
%Dokonujemy symulacji przed treningiem
              INPUT=sim(net,W)
            
% Określamy liczbę epok dla której należy wykonać w treningu sieci.
              net.trainParam.epochs=20;
            
% Trenujemy perceptron.
              net=train(net,W,T);
            
% Symulujemy sieć neuronowa dla wartości wcześniej wytrenowanych.
              OUTPUT=sim(net,W)

