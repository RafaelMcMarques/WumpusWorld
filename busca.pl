consult(inicialbc).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tell bc que ta livre
registra(I, J, N, X) :-
  X =:= 0,
  poco(I, J, N, Ind), MInd is -Ind,
  brisa(I, J, N, Ind2), MInd2 is -Ind2,
  tell_bc([[MInd]]),
  tell_bc([[MInd2]]).

% tell bc que tem brisa
registra(I, J, N, X) :-
  X =:= 1,
  poco(I, J, N, Ind), MInd is -Ind,
  brisa(I, J, N, Ind2),
  tell_bc([[MInd]]),
  tell_bc([[Ind2]]).

% Chegou num poco
registra(I, J, N, X) :-
  X =:= 2,
  write('Perdeu'),
  halt.

% Achou o ouro
registra(I, J, N, X) :-
  X =:= 3,
  write('Ganhou, ouro na pos '),
  indice(I, J, N, Ind),
  write(Ind),
  write('\n'),
  halt.

% verifica se posicao eh segura e nao esta no caminho
pode(I, J, N, Caminho, X) :-
  poco(I, J, N, Ind),
  MInd is -Ind, 
  ask_bc(MInd), % poco nao eh conseq logica da bc
  \+ member(X, Caminho).
  

% tem caminho indo pra cima
busca(I, J, Mapa, N, Caminho0, Caminho) :-
  I < N-1,
  I1 is I+1,
  percebe(I, J, Mapa, X),
  registra(I, J, N, X),
  indice(I1, J, N, Ind),
  pode(I1, J,N, Caminho0, Ind),
  append(Caminho0, [Ind], Caminho),
  write(Caminho),
  write('\n'),
  busca(I1, J, Mapa, N, Caminho, Caminho2).

% tem caminho indo pra baixo
busca(I, J, Mapa, N, Caminho0, Caminho) :-
  I > 0,
  I1 is I-1,
  percebe(I, J, Mapa, X),
  registra(I, J, N, X),
  indice(I1, J, N, Ind),
  pode(I1, J, N, Caminho0, Ind),
  append(Caminho0, [Ind], Caminho),
  write(Caminho),
  write('\n'),
  busca(I1, J, Mapa, N, Caminho, Caminho2).

% tem caminho indo pra esquerda
busca(I, J, Mapa, N, Caminho0, Caminho) :-
  J > 0,
  J1 is J-1,
  percebe(I, J, Mapa, X),
  registra(I, J, N, X),
  indice(I, J1, N, Ind),
  pode(I, J1, N, Caminho0, Ind),
  append(Caminho0,[Ind], Caminho),
  write(Caminho),
  write('\n'),
  busca(I, J1, Mapa, N, Caminho, Caminho2).

% tem caminho indo pra direita
busca(I, J, Mapa, N, Caminho0, Caminho) :-
  J < N-1,
  J1 is J+1,
  percebe(I, J, Mapa, X),
  registra(I, J, N, X),
  indice(I, J1, N, Ind),
  pode(I, J1, N, Caminho0, Ind),
  append(Caminho0, [Ind], Caminho),
  write(Caminho),
  write('\n'),
  busca(I, J1, Mapa, N, Caminho, Caminho2).



