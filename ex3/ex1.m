function ex1()
    cont = 0;
    vet = [];
    soma_num = 0;
    while true
        x = input("digite um numero: e 0- sair");
        if x == 0
            break;
        else
            [vet,cont,soma_num] = operations(x,cont,vet,soma_num);
        end
    end 
    media = soma_num / cont;
end


function [cont,vet,soma_num] = operations(x,cont,vet,soma_num)
    vet = [vet, x];
    cont = cont +1;
    soma_num = soma_num +x;
end