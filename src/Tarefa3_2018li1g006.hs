    
{-| 
   Module      : Tarefa3_2018li1g006
   Description : Compressão e descompressão de Estados.
   Copyright   : Luis Carlos da Costa Salazar Martins
                 João Miguel Pinheiro Machado

= Introdução
   
   O objetivo deste tarefa é criar uma função que comprima ('comprime') o 'Estado' do jogo em uma @String@, de modo a que fique o mais comprimida possivel, e outra que reverta o processo, ou seja,
   que a partir da @String@ resultante da compressão, se obetenha o mesmo 'Estado' que se tinha antes de fazer a compressão ('descomprime'). Um dos principais objetivos nesta tarefa era fazer com que a
   taxa de compressão fosse o maior possivel, ou seja, que conseguisemos comprimir um 'Estado' numa string o mais pequena possivel.
      
                  ===Resultado esperado:
                  >>>descomprime (comprime (Estado m js ds))
                  Estado m js ds

= Objetivo e estratégias.

  == Compressão
   O primeiro grande objetivo desta tarefa era conseguir comprimir um 'Estado' numa @String@ o meu pequena possivel, mas de modo a que fosse possivel a __descompressão__. Por isso começamos por dividir
   o @Estado@ em três partes, o mapa , a lista de jogadores e a lista de disparos, em que estas partes eram separadas pelo caracter __|__ cuja sua função nesta tarefa foi apenas essa, para não haver confusões.

   Na parte do mapa, começamos por criar uma função que transforma um mapa numa @String@ e para o efeito, usa-mos uma auxiliares 'auxm1' que transforma cada linha do mapa numa string. Depois com a função
   'comprimeMapa', vai juntar todas essas string com __\\\n__ entre cada uma.

   Na parte da lista de Jogadores, a função 'comprimeJogadores' vai separar cada elemento de um jogador com o caracter __<__, de modo a facilitar a descompressão e tambem de modo a nao misturar cada elemento.
   Depois todos os jogadores foram unidos numa unica string com __\\\n__ entre cada jogador. É de notar tambem os elementos de cada jogador aparecem pela mesma ordem na @String@ comprimida.

   Na parte da lista de Disparos, a função 'comprimeDisparo' vai organizar o DisparoCanhao e o DisparoLaser de modo em que as coordenadas aparecem primeiro. Em todos os três tipos de disparos comprimidos,
   há um caracter que os destingue dos outrou, para tornar a descompressão mais simples. Depois, tal como aconteceu com as outras partes, todos os disparos so unidos numa unica string com __\\\n__ entre cada disparo.

                  ===Resultado geral obtido:
                  >>> comprime (Estado [m1,m2,...,m] [j1,j2,j3,j4] [d1,d2,...,d])
                  "m1\nm2\n...\nm|j1\nj2\nj3\nj4|d1\nd2\n...\nd"

   Um exemplo mais concreto da compressão pode ser visto na documentação da função 'comprime'.

  == Descompressão
   Tal como na compressão, a descompressão está dividida em 3 partes. Então, através do uso da função 'dividecomprime', dividimos o resultado da compressão em três partes. A primeira parte, o mapa, com recurso
   à função lines foi dividida em linha e com o uso da função 'stringToMapa' conseguimos descomprimir o mapa.

   A segunda parte, os jogadores, foi um pouco mais complexa que a primeira. Tivemos de criar uma função ('entreChar') qu econsegui-se ler o que estava entre todos os __<__ para obter a informação de cada jogodor
   e depois com o recurso à função lines e com o uso das funções 'stringToJogador' e 'stringToJogadores' conseguimos descomprimir a lista de Jogadores.  

   A ultima parte foi muito semelhante à segunda pelo que a unica diferença foi que tinhamos de distinguir cada tipo de disparo, dai ter sido usado um caracter diferente para cada disparo.

   Posto isto, com a função descomprime conseguimos juntar todas estar parte num 'Estado', concluindo assim esta tarefa. Todas as funções estão documentadas mais detalhadamente na parte da documentação.


= Conclusão
   
   Com o trabalho realizado nesta tarefa, conseguimos obter os resultados desejados,  em que se comprimissemos um determinado Estado e de seguida o descomprimissemos, obtiamos o mesmo Estado.
   Tambem conseguimos acabar esta Tarefa com uma taxa de compressao de cerca de __90.5%__, ou seja o tamanho comprimido é 90.5 vezes mais pequeno que o tamanho descomprimido, o que consideramos ser uma
   taxa de compressao rezoável, porem com um bocado mais de tempo poderia ser possivel aumentar a taxa de compressão.
   Mas concluindo estámos satisfeitos com os resultados que obtivemos nesta tarefa, pois conseguimos cumprir os objetivos que tinhamos. 
-}


module Tarefa3_2018li1g006 where

import LI11819
import Data.Char
import Tarefa0_2018li1g006
import Tarefa1_2018li1g006
import Tarefa2_2018li1g006

-- * Testes

-- | Testes unitários da Tarefa 3.
--
-- Cada teste é um 'Estado'.
testesT3 :: [Estado]
testesT3 = [(Estado {mapaEstado =[[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}),
            (Estado {mapaEstado =[[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [(DisparoChoque 2 5),(DisparoCanhao 1 (3,1) D),(DisparoLaser 0 (1,6) B),(DisparoCanhao 3 (5,4) C),(DisparoLaser 2 (1,1) E)]}),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]][(Jogador (2,2) D 1 1 1)] [(DisparoCanhao 0 (2,3) D)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (2,2) D 1 1 1),(Jogador (10,10) C 3 4 5)] [(DisparoCanhao 0 (2,3) D)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (2,2) D 1 1 1),(Jogador (8,10) C 3 4 5),(Jogador (6,6) B 3 1 2)] [(DisparoCanhao 0 (6,3) D),(DisparoLaser 2 (10,3) D),(DisparoChoque 1 5)]),
            (Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (2,11), direcaoJogador = D, vidasJogador = 2, lasersJogador = 11, choquesJogador = 0},Jogador {posicaoJogador = (8,18), direcaoJogador = E, vidasJogador = 0, lasersJogador = 2, choquesJogador = 0},Jogador {posicaoJogador = (16,9), direcaoJogador = D, vidasJogador = 1, lasersJogador = 0, choquesJogador = 4},Jogador {posicaoJogador = (9,17), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 4},DisparoLaser {jogadorDisparo = 2, posicaoDisparo = (16,12), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 3, posicaoDisparo = (10,17), direcaoDisparo = B}]}),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,1) B 10 2 3)] [(DisparoCanhao 0 (2,1) B)]),
            (Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (10,4), direcaoJogador = D, vidasJogador = 4, lasersJogador = 1, choquesJogador = 3},Jogador {posicaoJogador = (2,11), direcaoJogador = B, vidasJogador = 3, lasersJogador = 2, choquesJogador = 0},Jogador {posicaoJogador = (2,3), direcaoJogador = E, vidasJogador = 1, lasersJogador = 4, choquesJogador = 2},Jogador {posicaoJogador = (23,125), direcaoJogador = C, vidasJogador = 0, lasersJogador = 2, choquesJogador = 1}], disparosEstado = [DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (23,52), direcaoDisparo = C},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (3,32), direcaoDisparo = B},DisparoCanhao {jogadorDisparo = 2, posicaoDisparo = (1,1), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 3, posicaoDisparo = (312,1), direcaoDisparo = C},DisparoLaser {jogadorDisparo = 0, posicaoDisparo = (23,52), direcaoDisparo = C},DisparoLaser {jogadorDisparo = 1, posicaoDisparo = (3,32), direcaoDisparo = B},DisparoLaser {jogadorDisparo = 2, posicaoDisparo = (1,1), direcaoDisparo = D},DisparoLaser {jogadorDisparo = 3, posicaoDisparo = (312,1), direcaoDisparo = C},DisparoChoque {jogadorDisparo = 2, tempoDisparo = 4}]}),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [] []),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (43,43) B 4 2 1)] []),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [] [(DisparoChoque 3 2)])]

-- * Descrição das funções

-- * Funçoes para o comprimir

{- | A funçao @comprime@, vai comprimir o 'Estado' do jogo usando três funçoes auxiliares, cada uma correspondente a cada parte do Estado. A função 'comprimeMapa' vai transformar o mapa numa @String@, 
     a função 'comprimeJogadores' vai comprimir a lista de Jogadores numa @String@, e a 'comprimeDisparo' vai comprimir a lista de Disparos numa @String@.
     Depois cada uma dessas strings vai ser unida numa unica @String@ em que cada parte vai ser separada pelo caracter __|__ , de  modo a facilitar a descompressão. 
    
    == Exemplo de utilização:
    >>> comprime (Estado (mapaInicial (15,15)) [(Jogador (1,1) D 6 3 3),(Jogador (1,12) B 5 3 3)] [(DisparoCanhao 0 (1,10) D),(DisparoLaser 1 (10,1) B)]) 
    "IIIIIIIIIIIIIII\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\
    nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIIIIIIIIIIIIIII|<1<1<D<6<3<3<\n<1<12<B<5<3<3<|<1<10<K<D<0<\n<10<1<L<B<1<"    
-}
comprime :: Estado -> String
comprime (Estado m js ds) = comprimeMapa m ++ "|" ++ comprimeJogadores js ++ "|" ++ comprimeDisparo ds


{- | A função @comprimeMapa@, com o auxilio da função 'auxm1' vai transformar o mapa numa @Strin@, em que cada do mapa é separado por __\\\n__ , de modo a facilitar a descompressão.
    
    == Exemplo de utilização:
    >>> comprimeMapa (constroi [Desenha,Roda,MudaParede,Move D,Desenha])
    "IIIIIII\nIVIVVVI\nIVDDDDI\nIVIVVVI\nIVIVVVI\nIIIIIII"
-}
comprimeMapa :: Mapa   -- ^ O mapa que vai ser transformado em String.
             -> String -- ^ String com a disposição do mapa.
comprimeMapa [] = []
comprimeMapa [h] = auxm1 h
comprimeMapa (m:ms) = auxm1 m ++ "\n" ++ comprimeMapa ms


{- |A função @auxm1@, que ja foi vista em prática anteriormente , vai pegar em cada peça de uma linha do mapa, e dependendo do seu conteudo vai-lhe atribuir uma letra.
    __I__ se for um @Bloco Indestrutivel@, __D__ se for um @Bloco Destrutivel@ e __V__ se for uma peça @Vazia@.
-}
auxm1 :: [Peca] -- ^ Lista de peças de uma linha do mapa.
      -> String -- ^ Resultado de comprimir.
auxm1 [] = []
auxm1 (m:ms) |m == Bloco Indestrutivel = 'I' : auxm1 ms
             |m == Bloco Destrutivel = 'D' : auxm1 ms
             |m == Vazia = 'V' : auxm1 ms


{- |A função @comprimeJogadores@ vai, a partir de uma lista de Jogadores, criar uma string que separa cada jogador com __\\\n__, para facilitar na descompressão.
    Esta função está estruturada da seguinte forma:

        1. Pega no primeiro Jogador de uma lista.

        2. As coordenadas são as primeiras que aparecem na @String@, seguidas da direção do jogador.

        3. Usa a função 'auxj1' para comprimir os restantes elementos do jogador (vidas, laser e choques).

        4. Todos os elementos referidos anteriormente estão separados pelo caracter __<__, de modo a facilitar a descompressão.

        5. Posteriormente adiciona __\\\n__ à @String@ e repete o processo para os restantes Jogadores.
    
    == Exemplo de utilização:
    >>> comprimeJogadores [(Jogador (1,1) C 6 3 3),(Jogador (10,10) D 10 2 2)]
    "<1<1<C<6<3<3<\n<10<10<D<10<2<2<"
-}
comprimeJogadores :: [Jogador] -- ^ Lista de jogadores e as suas informações vai ser lido buscando a sua posicao, direcao, numero de vidas, lasers e choques.
                  -> String    -- ^ String com a informaçao dos jogadores.
comprimeJogadores [] = []
comprimeJogadores [(Jogador (x,y) d v l c)] = "<" ++(show x) ++ "<"++ (show y) ++ "<" ++ (show d) ++ "<" ++ (auxj1 v l c) 
comprimeJogadores ((Jogador (x,y) d v l c):t) = "<" ++(show x) ++ "<"++ (show y) ++ "<" ++ (show d) ++ "<" ++ (auxj1 v l c) ++ "\n" ++ comprimeJogadores t


{- |A função @auxj1@ é usada exclusivamente para colocar as vidas, as balas de laser, e as balas de choque, em string, como ja foi exemplicado anteriormente. -}
auxj1 :: Int -> Int -> Int -> String
auxj1 v l c = (show v) ++ "<" ++ (show l) ++ "<" ++ (show c) ++ "<"


{- |A função @comprimeDisparo@, juntamente com as funçoes 'comprimeCanhao', 'comprimeLaser' e 'comprimeChoque', vai comprimir a lista de disparos que tem as informacoes 
    do DisparoCanhao (este contem o id do joagdor que disparou , a posicao e a direcao), da DisparoLaser ( que contem a id do joagdor que disparou , a posicao e a direcao)
    e por fim o DisparoChoque (que contem a id do jogador e o numero de ticks), separando cada disparo com __\\\n__, para facilitar na descompressão.
    Esta função está estruturada da seguinte forma:

        1. Pega no primeiro Disparo de uma lista.

        2. Vê que tipo de disparo é e usa uma das funções auxiliares. 

        3. Todos os elementos estão separados pelo caracter __<__, de modo a facilitar a descompressão.

        4. Posteriormente adiciona __\\\n__ à @String@ e repete o processo para os restantes Disparos.
     
    == Exemplo de utilização:
    >>> comprimeDisparo [(DisparoCanhao 0 (10,10) C),(DisparoLaser 1 (12,1) B),(DisparoChoque 2 10)]
    "<10<10<K<C<0<\n<12<1<L<B<1<\nR<2<10<"
-}
comprimeDisparo :: [Disparo] -- ^ Lista de disparos e as suas informações vai ser lido buscando os tipos de disparos assim como os jogadores que efetuaram a posicao deles e as direções ou os ticks.
                -> String    -- ^ String com a informaçao dos disparos.
comprimeDisparo [] = []
comprimeDisparo [(DisparoCanhao j p d)] = comprimeCanhao (DisparoCanhao j p d)
comprimeDisparo [(DisparoLaser j p d)] = comprimeLaser (DisparoLaser j p d)
comprimeDisparo [(DisparoChoque j ts)] = comprimeChoque (DisparoChoque j ts)
comprimeDisparo ((DisparoCanhao j p d):t) = comprimeCanhao (DisparoCanhao j p d) ++ "\n" ++ comprimeDisparo t
comprimeDisparo ((DisparoLaser j p d):t) = comprimeLaser (DisparoLaser j p d) ++ "\n" ++ comprimeDisparo t
comprimeDisparo ((DisparoChoque j ts):t) = comprimeChoque (DisparoChoque j ts) ++ "\n" ++ comprimeDisparo t


{- |A função @comprimeCanhao@, comprime um DisparoCanhao do seguinte modo:

        1. Mete as coordenadas do Disparo em primeiro lugar na lista.

        2. Adiciona a letra __K__ para distinguir dos outros tipos de disparo.

        3. Adiciona o identificador do jogador por fim.

        4. Todos os elementos referidos anteriormente são separados por __<__, para facilitar a descompressão.

-}
comprimeCanhao :: Disparo -- ^ O tipo do Disparo, neste caso DisparoChanhao.
               -> String  -- ^ A string resultante de comprimir o DisparoCanhao .
comprimeCanhao (DisparoCanhao j (x,y) d) = "<" ++(show x) ++ "<"++ (show y) ++ "<" ++ "K" ++ "<" ++ (show d) ++ "<" ++ (show j) ++ "<"


{- |A função @comprimeLaser@, comprime um DisparoLaser do seguinte modo:

        1. Mete as coordenadas do Disparo em primeiro lugar na lista.

        2. Adiciona a letra __L__ para distinguir dos outros tipos de disparo.

        3. Adiciona o identificador do jogador por fim.

        4. Todos os elementos referidos anteriormente são separados por __<__, para facilitar a descompressão.

-}
comprimeLaser :: Disparo -- ^ O tipo do Disparo, neste caso DisparoLaser.
               -> String  -- ^ A string resultante de comprimir o DisparoLaser. 
comprimeLaser (DisparoLaser j (x,y) d) = "<" ++(show x) ++ "<"++ (show y) ++ "<"++ "L" ++ "<" ++ (show d) ++ "<" ++ (show j) ++ "<"


{- |A função @comprimeChoque@, comprime um DisparoChoque do seguinte modo:

        1. Visto que nao tem coordenadas, adiciona a letra __R__ no inico,para distinguir dos outros tipos de disparo.

        2. Adiciona o identificador do jogador e o tempo do choque,nesta ordem.

        3. Todos os elementos referidos anteriormente são separados por __<__, para facilitar a descompressão.
-}
comprimeChoque :: Disparo -- ^ O tipo do Disparo, neste caso DisparoChoque.
               -> String  -- ^ A string resultante de comprimir o DisparoChoque .
comprimeChoque (DisparoChoque j t) = "R" ++ "<" ++ (show j) ++ "<" ++ (show t) ++ "<"


-- * Funções para descomprimir

{- |A função @descomprime@ funciona da seguinte forma:

		1. Para o mapa utiliza a função a funções 'dividecomprime' e 'primeiroLista' para separar a __String__ do mapa do resto da @String@.

		2. Depois utiliza a função lines (pré-definida em Data.Char), para separar todas as linhas do mapa numa lista e depois usar a função 'stringToMapa' para criar o mapa.

		3. Para os Jogadores utiliza a função a funções 'dividecomprime' e 'segundoLista' para separar a __String__ dos Jogadores do resto da @String@.

        4. Depois utiliza a função lines (pré-definida em Data.Char), para separar todas as __strings__ de jogadores numa lista e depois usa a função 'stringToJogadores' para criar a lista de Jogadores.

        5. Para os Disparos utiliza a função a funções 'dividecomprime' e 'ultimoLista' para separar a __String__ dos Disparos do resto da @String@.

        6. Depois utiliza a função lines (pré-definida em Data.Char), para separar todas as __strings__ de disparos numa lista e depois usa a função 'stringToDisparos' para criar a lista de Jogadores.

        7. O resultado final é um Estado

    == Exemplo da utilização
    >>> descomprime "IIIIIIIIIIIIIII\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIVVVVVVVVVVVVVI\nIIIIIIIIIIIIIII|<1<1<D<6<3<3<\n<1<12<B<5<3<3<|<1<10<K<D<0<\n<10<1<L<B<1<"
    Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]],
    jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = D, vidasJogador = 6, lasersJogador = 3, choquesJogador = 3},Jogador {posicaoJogador = (1,12), direcaoJogador = B, vidasJogador = 5, lasersJogador = 3, choquesJogador = 3}], disparosEstado = [DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,10), direcaoDisparo = D},DisparoLaser {jogadorDisparo = 1, posicaoDisparo = (10,1), direcaoDisparo = B}]}
-}
descomprime :: String -> Estado
descomprime l = (Estado (stringToMapa (lines (primeiroLista (dividecomprime l)))) (stringToJogadores (lines (segundoLista (dividecomprime l)))) (stringToDisparos (lines (ultimoLista (dividecomprime l)))))


{- |A função @dividecomprime@,juntamente com as funções 'removedaLista' e 'posicaoNaLista', vai criar uma lista de @String@ com todas as partes de um 'Estado' em cada elemento dessa lista (Mapa,Jogadores,Disparos).
    Esta função, juntamente com as outras vai funcionar do seguinte modo:

        1. Usando a função 'posicaoNaLista' vai ver na @String@ comprimida do @Estado@ em que posições entao os caracteres __|__ e vai devolver uma lista com essas posições.

        2. Usando a função 'removedaLista' e a lista de posições gerada pele função anterior, vai dividir a __String__ do @Estado@ nessas posições, separando-as por cada parte do @Estado@.

        3. O resultado final é do tipo __[Mapa,Jogadores,Disparos]__

    == Exemplo de utilização:
    >>> dividecomprime "IIIIIII\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIIIIIII|<1<1<D<6<3<3<\n<4<4<B<5<3<3<|<1<2<K<D<0<\n<3<4<L<B<1<"
    ["IIIIIII\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIIIIIII","<1<1<D<6<3<3<\n<4<4<B<5<3<3<","<1<2<K<D<0<\n<3<4<L<B<1<"]
-}
dividecomprime :: String   -- ^ String do estado comprimido.
               -> [String] -- ^ Lista de String sendo cada elemento da lista correspondente a compressão de cada parte do Estado ["mapa","jogadores","disparos"].
dividecomprime l = removedaLista (posicaoNaLista '|' l) l


{- |A função @removedaLista@ recebe uma lista de indices e a @String@ do Estado e separa-a de acordo com a lista de indices, removendo os elementos nesses indices.
    
    == Exemplo de utilização:
    >>> removedaLista [55,83] "IIIIIII\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIIIIIII|<1<1<D<6<3<3<\n<4<4<B<5<3<3<|<1<2<K<D<0<\n<3<4<L<B<1<"
    ["IIIIIII\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIIIIIII","<1<1<D<6<3<3<\n<4<4<B<5<3<3<","<1<2<K<D<0<\n<3<4<L<B<1<"]

-}
removedaLista :: [Int]    -- ^ Lista dos indices a seream removidos.
              -> String   -- ^ String do 'Estado' comprimido.
              -> [String] -- ^ Lista de String sendo cada elemento da lista correspondente a compressão de cada parte do Estado ["mapa","jogadores","disparos"].
removedaLista [x,y] l |x==0 && y == 1 && length l == 2 = [[],[],[]] 
                      |x==0 && y == 1 && length l /= 2 = [[],[],(drop 2 l)]
                      |otherwise = (take (x) l): (take (y-x-1) (drop (x+1) l)) :(drop (y+1) l):[]


{- |A função @posicaoNaLista@ procura numa lista um certo caracter e depois cria uma lista com os indices onde esse caracter se encontra.
    
    == Exemplo de utilização:
    >>> posicaoNaLista '|' "IIIIIII\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIVVVVVI\nIIIIIII|<1<1<D<6<3<3<\n<4<4<B<5<3<3<|<1<2<K<D<0<\n<3<4<L<B<1<"
    [55,83] 
-}
posicaoNaLista :: Eq a => a -> [a] -> [Int]
posicaoNaLista n [] = []
posicaoNaLista n l = aux 0 n l
                    where aux _ _ [] = []
                          aux i n (h:t) |n==h = i: aux (i+1) n t
                                        |otherwise = aux (i+1) n t


{- |Recebe uma Lista de @String@ e dá a primeira String dessa lista. Utilizado na funcão 'descomprime'.
-}
primeiroLista :: [String] -- ^ Lista de String sendo cada elemento da lista correspondente a compressão de cada parte do Estado ["mapa","jogadores","disparos"].
              -> String   -- ^ Primeiro elemento da lista anterior ["mapa"].
primeiroLista (h:t) = h

{- |Recebe uma Lista de String e dá a segunda String dessa lista. Utilizado na funcão 'descomprime'.
-}
segundoLista :: [String] -- ^ Lista de String sendo cada elemento da lista correspondente a compressão de cada parte do Estado ["mapa","jogadores","disparos"].
             -> String  -- ^ Segunda elemento da lista anterior ["jogadores"].
segundoLista (h:i:t) = i

{- |Recebe uma Lista de String e dá a ultima String dessa lista. Utilizado na funcão 'descomprime'.
-}
ultimoLista :: [String] -- ^ Lista de String sendo cada elemento da lista correspondente a compressão de cada parte do Estado ["mapa","jogadores","disparos"].
            -> String -- ^ Ultimo elemento da lista anterior ["disparos"].
ultimoLista [h] = h
ultimoLista (h:t) = ultimoLista t


{- |A função @stringToMapa@, juntamente com a 'stringToMapaux', usando a lista de @String@ resultante de usar a função lines (pre-definida em Data.Char) no mapa, ou seja, uma lista em que cada elemento é uma linha do mapa,
    vai, usando a sua auxiliar,  funcionar da seguinte forma:

        1. Pega no primeiro elemento da lista e aplica-lhe a função 'strinToMapaux'
        2. Faz a recursividade para o resto da lista.
        3. O produto final é uma mapa resultante de descomprimir a @String@.

    == Exemplo de utilização
    >>> stringToMapa ["IIIIIII","IVIVVVI","IVDDDDI","IVIVVVI","IVIVVVI","IIIIIII"]
    [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Destrutivel,Bloco Indestrutivel],
    [Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]]
    
    <<mapa.png>>
-}
stringToMapa :: [String] -- ^ String resultante da utilizaçao do lines.
             -> Mapa     -- ^ Mapa descomprimido.
stringToMapa [] = []
stringToMapa ((h:t):r) = stringToMapaux (h:t) : stringToMapa r


{- |A função @stringToMapaux@, utilizada uma __String__ que corresponde a uma linha do mapa e transforma-a numa linha de um mapa, ou seja uma lista de __Peças__.
    Ao percorrer a lista, se encontrar um __I__ transforma num __Bloco Indestrutivel__, se encontrar um __ D __ transforma num __Bloco Destrutivel__ e se encontrar um __V__ transforma numa peça __Vazia__.

    == Exemplo de utilização:
    >>> stringToMapaux "IVDVI"
    [Bloco Indestrutivel,Vazia,Bloco Destrutivel,Vazia,Bloco Indestrutivel]
-}
stringToMapaux :: String -- ^ Uma string da String resultante da utilizaçao do lines.
               -> [Peca] -- ^ Uma das linhas do 'Mapa'.
stringToMapaux [] = []
stringToMapaux (h:t) |h == 'I' = (Bloco Indestrutivel):stringToMapaux t
                     |h == 'D' = (Bloco Destrutivel) :stringToMapaux t
                     |h == 'V' = (Vazia):stringToMapaux t


{- |A função @stringToJogadores@, juntamente com a função 'stringToJogador', descomprime a lista de strings resultante de usar a função lines (pre-definida em Data.Char) na lista de jogadores comprimida.
    Esta função vai criar uma lista de jogadores do seguinte modo:

        1. Pega na primeira string da lista de @String@ e usa a função 'stringToJogador'.

        2. Depois faz a recursivade do resto da lista criando uma lista de Jogadores ordenada.

    == Exemplo de utilização
    >>> stringToJogadores (lines "<1<1<D<6<3<3<\n<4<4<B<5<3<3<")
    [Jogador {posicaoJogador = (1,1), direcaoJogador = D, vidasJogador = 6, lasersJogador = 3, choquesJogador = 3},
    Jogador {posicaoJogador = (4,4), direcaoJogador = B, vidasJogador = 5, lasersJogador = 3, choquesJogador = 3}]
-}
stringToJogadores :: [String]  -- ^ String resultante da utilizaçao do lines.
                  -> [Jogador] -- ^ Lista de Jogadores descomprimida
stringToJogadores [] = []
stringToJogadores (h:t) = stringToJogador h : stringToJogadores t


{- |A função @stringToJogador@ transforma uma __String__ correspondente a um jogador num 'Jogador' do seguinte modo:
        
        1. Um 'Jogador' está dividido em 3 partes: posição, direção e status.

        2. Para a primeira parte, é utilizada a função 'inicioString' que vai corresponder à parte das coordenadas na __String__.
        
        3. Depois vai ser usada a função 'posicaoNaLista' para encontrar os indices onde se encontra o caracter __<__.
        
        4. Com a lista de indices formada, vais ser usada a função 'entreChar' para ver quais são os caracteres correspondentes às coordenadas, criando uma lista onde o primeiro é o __x__ e o segundo é o __y__.
        
        5. Depois vai ser usada a função 'stringToPosicao' com a lista formada anteriormente, criando uma 'Posicao' do tipo (x,y).
        
        6. Para a segunda parte, é utilizado a função 'elemString' para ver qual é o primeiro elemento da __String__ correspondente ao Jogador sem a parte das coordenadas, ou seja, à parte correspondente do uso da funçao 'restoString'.
        
        7. Com esse elemento vai ser usada a função @read@ (pré-definida) para ver qual é a direção que corresponde à @String@ obtida no passo anterior.

        8. Para a terceira parte, e usando novamente a __String__ obtida de ter usado a função 'restoString', vai-se obter o nº de vidas, de lasers e de choques.

        9. Primeiro usa-se as funções 'posicaoNaLista' e 'entreChar' para obter uma lista de @String@ com os 3 status separados.

        10. Por fim usa-se a funçao read no 1º,2º e 3º elemento da lista para se obter o nº de vidas, de lasers e de choques, respetivamente e usando a função 'elemList' para ler os elementos nas posições da lista.

        11. Concluindo, junta-se todos os dados que obtemos anteriormente para formar um 'Jogador'.

    == Exemplo de utilização:
    >>> stringToJogador "<10<10<D<6<10<3<"
    Jogador {posicaoJogador = (10,10), direcaoJogador = D, vidasJogador = 6, lasersJogador = 10, choquesJogador = 3}

-}
stringToJogador :: String  -- ^ Uma string da String resultante da utilizaçao do lines.
                -> Jogador -- ^ Um 'Jogador' resultante da lista de String.
stringToJogador l = Jogador (stringToPosicao (entreChar (posicaoNaLista '<' (inicioString l)) l)) (read (elemString 1 (restoString l):[]) :: Direcao) (read (elemList 1 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Int) (read (elemList 2 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Int) (read (elemList 3 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Int)


{- |A função @stringToDisparos@, juntamente com a função 'stringToDisparo', descomprime a lista de strings resultante de usar a função lines (pre-definida em Data.Char) na lista de disparos comprimida.
	Esta função vai criar uma lista de Disparos do seguinte modo:

		1. Pega na primeiro string da lista de @String@	e usa a função 'stringToDisparo'.

		2. Deposi faz recursividade do resto da lista criando uma lista de Disparos no final.

	== Exemplo de utilização
	>>> stringToDisparos (lines "<1<2<K<D<0<\n<3<4<L<B<1<")
	[DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,2), direcaoDisparo = D},DisparoLaser {jogadorDisparo = 1, posicaoDisparo = (3,4), direcaoDisparo = B}]
-}
stringToDisparos :: [String]  -- ^ Uma String resultante da utilizaçao do lines. 
                 -> [Disparo] -- ^ Lista de Disparos descomprimida
stringToDisparos [] = []
stringToDisparos (h:t) = stringToDisparo h : stringToDisparos t


{- |A função @stringToDisparo@ transforma uma __String__ correspondente a um disparo e transforma-o num disparo do seguinte modo:

		1. Um disparo está dividido em 3 partes : indice do jogador,posicão,direção (2 se for disparo de choque)
		
		2. Para a parte da posição, usamos a função 'inicioString' para pegar na parte correspondente à posição na @String@
		
		3. Depois, com essa parte, usamos as funções 'posicaoNaLista' e 'entreChar' para obter uma lista de @String@ , sendo o primeiro elemento correspondemte a __x__ e o segundo elemento correspondente a __y__.
		
		4. Por fim com a função 'stringToPosicao' transformamos essa lista numa 'Posicao' __(x,y)__.

		5. Para as restantes partes, usamos a função 'restoString' para pegar na parte correspondente ao indice do Jogador e direção.

		6. Para ambos os casos, usam-se as funções 'posicaoNaLista' e 'entreChar' para obter uma lista de @String@, sendo o primeiro elemento correspondente ao indicie do jogador e o segundo a direção (ou no caso do DisparoChoque o tempo).

		7. Caso, usando a função 'elemString', o primero elemento do 'restoString' não seja um __R__, criam-se o DisparoCanhao (caso 'elemString' seja __K__) ou o DisparoLaser (caso 'elemString' seja __L__), usando a função read do 1º ou 2º elemento da lista obtida em 6. e o resultado obtido em 4., colocando por ordem estes elemntos.

		8. Caso contrário, cria-se um DisparoChoque utilizando a função read e 'elemList' nos na lista obtida em 6. e colocando-os nos devidos lugares.

	== Exemplo da utilização
	>>> stringToDisparo "<10<10<K<D<0<"
	DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (10,10), direcaoDisparo = D}
-}
stringToDisparo :: String  -- ^ Uma string da String resultante da utilizaçao do lines.
                -> Disparo -- ^ Um 'Disparo' resultante da lista de String.
stringToDisparo l |(elemString 1 (restoString l)) == 'K' = DisparoCanhao (read (elemList 2 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Int) (stringToPosicao (entreChar (posicaoNaLista '<' (inicioString l)) (inicioString l))) (read (elemList 1 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Direcao)
                  |(elemString 1 (restoString l)) == 'L' = DisparoLaser (read (elemList 2 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Int) (stringToPosicao (entreChar (posicaoNaLista '<' (inicioString l)) (inicioString l))) (read (elemList 1 (entreChar (posicaoNaLista '<' (restoString l)) (restoString l))) :: Direcao)
                  |otherwise = DisparoChoque (read (elemList 1 (entreChar (posicaoNaLista '<' l) l)) :: Int) (read (elemList 2 (entreChar (posicaoNaLista '<' l) l)) :: Int)


{- |A função @entreChar@ recebe uma lista de indices e uma @String@ e criar uma lista de @String@, removendo os elementos correspondentes aos indices e separando as __string__ resultantes.

	== Exemplo da utilização
	>>> entreChar [0,3,6] "<11<11<"
	["11","11"]
-}
entreChar :: [Int] -> String -> [String]
entreChar [x,y,z] l = (take (y-x-1) (drop (x+1) l)) : (take (z-y-1) (drop (y+1) l)) : []
entreChar [x,y,w,z] l = (take (y-x-1) (drop (x+1) l)) : (take (w-y-1) (drop (y+1) l)) : (take (z-w-1) (drop (w+1) l)) : []


{- |A função @stringToPosicao@, recebe uma lista de @String@, sendo o primeiro elemento o __x__ e o segundo o __y__ e com a função read cria uma 'Posicao' __(x,y)__.
	
	== Exemplo da utilização
	>>> stringToPosicao ["11","11"]
	(11,11)
-}
stringToPosicao :: [String] -> Posicao 
stringToPosicao [h,t] = ((read h :: Int),(read t :: Int))


-- |A funçao @inicioStrin@ que vai pegar na parte da __String__ antes de uma das letras.
inicioString :: String -> String
inicioString [] = []
inicioString (h:t) |h == 'K' || h == 'L' ||h == 'R' ||h == 'C' ||h == 'D' ||h == 'B' ||h == 'E' = []
                   |otherwise = h : inicioString t

-- |A função @restoString@ separa do resto da string a posicao comprimida.
restoString :: String -> String
restoString [] = [] 
restoString (h:t) |h == 'K' || h == 'L' ||h == 'R' ||h == 'C' ||h == 'D' ||h == 'B' ||h == 'E' = (h:t)
                  |otherwise = restoString t

-- |A função @elemString@ pega num determinado elemento de uma string (ex : se n == 1, então vai pegar no primeiro elemento de uma String).
elemString :: Int -> String -> Char
elemString 1 (h:t) = h
elemString n (h:t) = elemString (n-1) t 

-- |A  função @elemList@ pega numa determinada __String__ de uma lista de @String@ (ex : se n == 1, então vai pegar na primeira String).
elemList :: Int -> [String] -> String
elemList 1 (h:t) = h
elemList n (h:t) = elemList (n-1) t