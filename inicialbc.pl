consult(bc).
consult(def).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define a BC inicial recursivamente
inicial_BC(I, J, N) :-
    proximo(I, J, N, I1, J1),
    regras(I, J, N),
    inicial_BC(I1, J1, N).

inicial_BC(I, J, N) :-
    regras(I, J, N).

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% forma elegante de percorrer toda a matriz
proximo(I, J, N, I1, J) :-
    I < N-1,
    I1 is I+1.

proximo(_, J, N, 0, J1) :-
    J < N-1,
    J1 is J+1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inclui na BC as regras do jogo para a posição (I,J)
% meio
regras(I, J, N) :-
    I > 0, I < N-1,
    J > 0, J < N-1,
    I1 is I-1,
    I2 is I+1,
    J1 is J-1,
    J2 is J+1,
    brisa(I, J, N, Ind),  MInd is -Ind,
    poco(I1, J, N, Ind1), MInd1 is -Ind1,
    poco(I2, J, N, Ind2), MInd2 is -Ind2,
    poco(I, J1, N, Ind3), MInd3 is -Ind3,
    poco(I, J2, N, Ind4), MInd4 is -Ind4,
    C = [[MInd, Ind1, Ind2, Ind3, Ind4],
         [Ind, MInd1], [Ind, MInd2],
         [Ind, MInd3], [Ind, MInd4]],
    tell_bc(C).

% canto inferior esquerdo
regras(I, J, N):-
    I =:= 0,
    J =:= 0,
    I2 is I+1,
    J2 is J+1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I2,J,N,Ind2), MInd2 is -Ind2,
    poco(I,J2,N,Ind4), MInd4 is -Ind4,
    C = [[MInd, Ind2, Ind4],
         [Ind, MInd2], [Ind, MInd4]],
    tell_bc(C).

% borda de baixo
regras(I, J, N):-
    I =:= 0,
    J > 0, J < N-1,
    I2 is I+1,
    J1 is J-1,
    J2 is J+1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I2,J,N,Ind2), MInd2 is -Ind2,
    poco(I,J1,N,Ind3), MInd3 is -Ind3,
    poco(I,J2,N,Ind4), MInd4 is -Ind4,
    C = [[MInd, Ind2, Ind3, Ind4],
         [Ind, MInd2], [Ind, MInd3],
         [Ind, MInd4]],
    tell_bc(C).

% canto inferior direito
regras(I, J, N):-
    I =:= 0,
    J =:= N-1,
    I2 is I+1,
    J1 is J-1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I2,J,N,Ind2), MInd2 is -Ind2,
    poco(I,J1,N,Ind3), MInd3 is -Ind3,
    C = [[MInd, Ind2, Ind3],
        [Ind, MInd2], [Ind, MInd3]],
    tell_bc(C).

% borda da direita
regras(I, J, N):-
    I > 0, I < N-1,
    J =:= N-1,
    I1 is I-1,
    I2 is I+1,
    J1 is J-1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I1,J,N,Ind1), MInd1 is -Ind1,
    poco(I2,J,N,Ind2), MInd2 is -Ind2,
    poco(I,J1,N,Ind3), MInd3 is -Ind3,
    C = [[MInd, Ind1, Ind2, Ind3],
         [Ind, MInd1], [Ind, MInd2],
         [Ind, MInd3]],
    tell_bc(C).

% canto superior direito
regras(I, J, N):-
    I =:= N-1,
    J =:= N-1,
    I1 is I-1,
    J1 is J-1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I1,J,N,Ind1), MInd1 is -Ind1,
    poco(I,J1,N,Ind3), MInd3 is -Ind3,
    C = [[MInd, Ind1, Ind3],
         [Ind, MInd1],[Ind, MInd3]],
    tell_bc(C).

% borda de cima
regras(I, J, N):-
    I =:= N-1,
    J > 0, J < N-1,
    I1 is I-1,
    J1 is J-1,
    J2 is J+1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I1,J,N,Ind1), MInd1 is -Ind1,
    poco(I,J1,N,Ind3), MInd3 is -Ind3,
    poco(I,J2,N,Ind4), MInd4 is -Ind4,
    C = [[MInd, Ind1, Ind3, Ind4],
         [Ind, MInd1],[Ind, MInd3],
         [Ind, MInd4]],
    tell_bc(C).

% canto superior esquerdo
regras(I, J, N):-
    I =:= N-1,
    J =:= 0,
    I1 is I-1,
    J2 is J+1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I1,J,N,Ind1), MInd1 is -Ind1,
    poco(I,J2,N,Ind4), MInd4 is -Ind4,
    C = [[MInd, Ind1, Ind4],
         [Ind, MInd1],[Ind, MInd4]],
    tell_bc(C).

% borda esquerda
regras(I, J, N):-
    I > 0, I < N-1,
    J =:= 0,
    I1 is I-1,
    I2 is I+1,
    J2 is J+1,
    brisa(I,J,N,Ind), MInd is -Ind,
    poco(I1,J,N,Ind1), MInd1 is -Ind1,
    poco(I2,J,N,Ind2), MInd2 is -Ind2,
    poco(I,J2,N,Ind4), MInd4 is -Ind4,
    C = [[MInd, Ind1, Ind2, Ind4],
         [Ind, MInd1],[Ind, MInd2],
         [Ind, MInd4]],
    tell_bc(C).

