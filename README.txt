T1 de Tópicos em Inteligência Artificial
Rafael Munhoz da Cunha Marues


Implementei os casos de borda da geracao da bc.
A bc incial é gerada corretamente, e é escrita
na tela depois de gerada. Acabei nao tratando
casos em que o tabuleiro tem tamanho 0 ou 1, 
nesses casos a bc inicial nao fica certa.

Implementei também a busca. Não tive tempo para testar
muito amplamente, mas nos casos pequenos que testei, tudo
funcionou. Cada vez que um passo é dado no tabuleiro, 
o caminho é escrito na tela. O caminho é uma lista de inteiros,
onde cada inteiro é o índice da casa do tabuleiro pela qual
o jogador passou. Indice = I*N+J+1.
Podem haver erros na minha implementacao, mas acredito que a lógica
esteja correta. 
Uma melhoria a ser feita é melhorar a parada do porgrama. Usar o 
halt. quando encontro um poço ou o ouro não me parece uma solução
elegante.