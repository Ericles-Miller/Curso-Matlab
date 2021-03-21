%mplemente uma função que leia vários números inseridos pelo usuário 
%(utilize zero como critério de parada)e exiba um gráfico com os valores
%inseridos até o momento e o valor acumulado como rótulo do eixo horizontal. 
%O gráfico deve ser atualizado após a inserção de cada número

function ex3()
    vet = [];
    while true
      x = input("Digite um numero:");
      if x == 0
            break;
      else
            vet = [vet, x];
            plot(vet, 'bar');
      end
    end
end