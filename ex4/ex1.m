%Implemente uma função que retorne o fatorial de um número N 
%passado como parâmetro e o tempo total de processamento da função.
function ex1(n)
    tic
    fatorial =1;
    while (n ~=1)
        fatorial = fatorial * n;
        n = n-1;
    end
    fprintf("fatorial %d\n",fatorial);
    toc
end