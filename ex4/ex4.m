%Implemente uma função que leia vários números inseridos pelo usuário
%(utilize zero como critério de parada) e salve os valores em um arquivo .MAT. 
%Ao final, a função deve exibir um histograma com os valores salvos


function ex4(input)
    load ('ex4arquivo.mat');
    num = length(vet);
    bar(num);
end
