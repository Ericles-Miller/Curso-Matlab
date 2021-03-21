%Desenvolva uma aplicação de diário eletrônico, com suporte a:
%Cadastro de múltiplas disciplinas ok
%Cadastro de alunos com nomes e notas ok
%Alteração de notas individuais ok
%Exclusão de todos os cadastros
%Gráfico de notas por disciplina, com a média como legenda do eixo horizontal

function trabalhofinalV2()
    %clearvars;
    %close all;
    %n = 0; %alterar para o length contando o numero de cadastros
    %n2 = 0;
    load('dados_alunos.mat','nd','na');
    %mat_cad_disc = [];
    %matAluno = [];
    contNaluno = 0;1
    media = [];
    while true
        clc;
        fprintf("\n1-Cadastro de Disciplina:");
        fprintf("\n2-Cadastro de alunos:");
        fprintf("\n3-Alterar nota de aluno:");
        fprintf("\n4-Excluir todos os cadastros:");
        fprintf("\n5-Mostrar gráfico de médias por disciplina:");
        fprintf("\n0-sair");
        ops = input("\n--");

        switch ops
            case 1
                load ('dados_alunos.mat','nd','matDisc');
                nd = nd + 1;
                prompt = "Nome da disciplina:";
                nomeDisc = input(prompt,'s');
                matDisc = cadastrar_Disciplina(matDisc,nomeDisc,nd);               
                        
            case 2
                load ('dados_alunos.mat','na','matAluno','matDisc');
                na = na + 1;                
                prompt = "\nNome do aluno:"
                nomeAluno = input(prompt,'s');
                matAluno = cadastrar_aluno(nomeAluno,matDisc,na,matAluno);
                
            case 3
                alterar_nota()
            
            case 4
                load('dados_alunos.mat');
                clearvars;
                save('dados_alunos.mat')

            case 5
                load('dados_alunos.mat','na','matAluno','matDisc','media');
                [nlin,ncol] = size (matDisc);
                
                somanotas = 0;
                media = funcgraph(na,matAluno,somanotas,media);  
                creategraph(media);
            case 0
                break;
            
            otherwise
                disp('opção inválida');
        end
    end
end



function matDisc =  cadastrar_Disciplina(mat,nomeDisc,nd)
    matDisc = mat;
    matDisc(nd).nome = nomeDisc;
    matDisc(nd).cod = nd;
    matDisc(nd).nunAlunos = 0;
    save('dados_alunos.mat','matDisc','nd','-append');

end

function dados = buscar_disc(mat)
    load ('dados_alunos.mat','nd','matDisc');
    [nlin,ncol] = size(matDisc);
    for aux=1:ncol
        matDisc(aux)
    end
    ops = input("Digite o código da disciplina:");
    for i=1:ncol
        if ops == i;
            dados = matDisc(i);
        end
    end
end

function [dados,ops] = buscar_aluno(mat)
    load('dados_alunos.mat','matAluno','na');
    [nlin,ncol] = size(matAluno);
    for i=1: ncol
      matAluno(i)
    end
    ops = input("Digite o código do aluno:");
    for i=1:ncol
        if ops == i;
            dados = mat(i);
        end
    end
end

function matAluno = cadastrar_aluno(aluno,mat_disc,na,mat)
    aux = 1;
    matAluno = mat;
    load('dados_alunos.mat','matDisc');
    while true
        fprintf("\nDigite:");
        fprintf("\n1-cadastrar nota");
        fprintf("\n0-Sair")
        ops = input("\n--");
        switch  ops
            case 1
                if aux == 1
                  nota = [];
                  matAluno(na).nomeAluno = aluno;
                  matAluno(na).codAluno = na;
                end
                
                dados = buscar_disc(mat_disc);
                nota(aux).database = dados;
                
                nota(aux).valor = input("\nDigite o valor da nota:");
                matAluno(na).notas(aux) = nota(aux);
                aux = aux +1;
                matDisc(dados.cod).nunAlunos = matDisc(dados.cod).nunAlunos +1;
            case 0
                break;
            
            otherwise
                disp('opção inválida');
        end
    end
    save('dados_alunos.mat','matAluno','na','matDisc','-append');   
end

function alterar_nota()
    aux = 1;
    load('dados_alunos.mat','matAluno','matDisc','na');
    
    [nlin,ncol] = size(matAluno);
    notas_alt = [];
    [dados,a] = buscar_aluno(matAluno);
    while true
       fprintf("\nDigite:");
       fprintf("\n1-Alterar nota");
       fprintf("\n0-Sair")
       x = input("\n--");
       switch x
          case 1
            dad = buscar_disc(matDisc);
            notas_alt(aux).database = dad;
            notas_alt(aux).valor = input("\nDigite a nova nota:");
            matAluno(a).notas(aux) = notas_alt(aux);
            aux = aux + 1;
         
          case 0
            break;
           
         otherwise
           disp('Valor inválido');
       end
    end
    save('dados_alunos.mat','matAluno','nd','-append');
end
function creategraph(media)
    load('dados_alunos.mat');
    subplot(2,2,1);
    bar(media);
    xlabel('Média Disciplinas');
    ylabel('Valor obtido');
end

function media = funcgraph(na,matAluno,somanotas,media)
    load('dados_alunos.mat','matAluno','matDisc','media');
    [nlin,ncol] = size(matAluno);
    for aux=1:ncol
        matDisc(aux)
    end
    a =input("Digite o codigo da disciplina:");

    %aux = buscar_disc(matDisc);
    
    for i=1:ncol
        somanotas = somanotas + matAluno(i).notas(a).valor; 
    end
    media(a) = somanotas/matDisc(a).nunAlunos;    
    save('dados_alunos.mat','media','media','-append');
    
end