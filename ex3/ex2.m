function ex2(x)
    if x ==1
        fprintf('O fatorial de %d e:%d\n',x,fatorial);
    else
        fatorial = x * fat(x-1);
    end
end