consult(busca).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wumpus_simplificado(N, Mapa) :-
    init_bc,
    inicial_BC(0, 0, N), !,
    write_bc,
    busca(0, 0, Mapa, N, [1], Caminho).
