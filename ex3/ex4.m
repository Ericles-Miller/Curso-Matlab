function ex4 ()
  N = [];
  f = [];
  for n=1:5
      N(n)= 30 + randi(70,n,1);
      F(n)= 0.3 +0.7 * rand(n,1);
   end
   aprove(N,F);
end
function aprove(N,F)
  for i=1: 5
    if N(i) >=70 && f(i)>=0.75;
        fprintf('O aluno foi aprovado:');
    else
        fprintf("O aluno foi reprovado por faltas ou presenca");
    end   
   end 
end