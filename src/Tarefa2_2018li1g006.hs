-- | Este módulo define funções comuns da Tarefa 2 do trabalho prático
module Tarefa2_2018li1g006 where

import LI11819
import Tarefa0_2018li1g006
import Tarefa1_2018li1g006

-- * Testes

-- | Testes unitários da Tarefa 2.
--
-- Cada teste é um triplo (/identificador do 'Jogador'/,/'Jogada' a efetuar/,/'Estado' anterior/).
testesT2 :: [(Int,Jogada,Estado)]
testesT2 = [(0,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Movimento Normal
            (0,Movimenta E,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = E, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Movimento contra parede borda
            (0,Movimenta D,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = D, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Movimento contra parede
            (0,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = C, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), -- Muda Direcao
            (1,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), -- Muda direcao com jogador nessa direcao
            (1,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = B, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), -- Movimenta com jogador nessa direcao
            (1,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (4,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = B, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), -- Movimenta em direcao a um jogador
            (1,Movimenta E,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = E, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 5}]}), --Movimento mas paralizado
            (1,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 5}]}), --Muda de direcao paralizado
            (3,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = B, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 5}]}), --Movimento nao paralizado
            (3,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (3,3), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,3), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,6), direcaoJogador = B, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 5}]}), --Movimento paralizado na borda do choque
            (2,Movimenta D,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,4), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 5}]}), --Muda de direcao nao paralizado
            (0,Movimenta B,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (1,4), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 5}]}), --Move usando choque
            (0,Dispara Canhao,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = D, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Disparo Canhao
            (0,Dispara Canhao,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = C, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Disparo Canhao contra parede
            (0,Dispara Laser,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Disparo Laser com balas
            (1,Dispara Laser,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 0, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Disparo Laser sem balas
            (0,Dispara Laser,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = E, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Disparo Laser contra parede
            (2,Dispara Choque,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []}), --Disparo Choque com balas
            (3,Dispara Choque,Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = B, vidasJogador = 2, lasersJogador = 1, choquesJogador = 1},Jogador {posicaoJogador = (7,1), direcaoJogador = D, vidasJogador = 1, lasersJogador = 1, choquesJogador = 2},Jogador {posicaoJogador = (7,7), direcaoJogador = C, vidasJogador = 2, lasersJogador = 2, choquesJogador = 2},Jogador {posicaoJogador = (1,7), direcaoJogador = E, vidasJogador = 3, lasersJogador = 1, choquesJogador = 0}], disparosEstado = []})] --Disparo Choque sem balas
                        

-- * Funções principais da Tarefa 2.


-- | Efetua uma jogada.
--
-- __NB:__ Chama as funcao 'estadoDisparo' ou 'estadoDirecao'.
jogada :: Int -- ^ O identificador do 'Jogador' que efetua a jogada.
       -> Jogada -- ^ A 'Jogada' a efetuar.
       -> Estado -- ^ O 'Estado' anterior.
       -> Estado -- ^ O 'Estado' resultante após o jogador efetuar a jogada.
jogada j (Dispara arma) e = estadoDisparo j arma e  
jogada j (Movimenta dir) e = estadoDirecao j dir e

-- * Funçoes auxiliares geraus da Tarefa 2.


-- | Verifica se as posicoes de todos os jogadores são validas.
--
-- __NB:__ Chama as funçôes 'posInicialValidaJogadorMapa', 'posInicialValidaJogadores' e 'posValidaParedeMapa'. 
posInicialValida :: Mapa      -- ^ O Mapa de jogo.
                 -> [Jogador] -- ^ A lista de todos os Jogadores.
                 -> Bool      -- ^ Verdadeiro caso as posicoes iniciais de todos os jogadores sejam validas.
posInicialValida m [] = True
posInicialValida m (jh:jt) = (posInicialValidaJogadorMapa m (jh:jt)) && (posInicialValidaJogadores (jh:jt)) && (posValidaParedeMapa m (jh:jt))

-- | Verifica se os jogadores não estao nas bordas do mapa.
posInicialValidaJogadorMapa :: Mapa      -- ^ O Mapa de jogo.
                            -> [Jogador] -- ^ A lista de todos os Jogadores.
                            -> Bool      -- ^ Verdadeiro caso todos os jogadores estejam dentro da borda do mapa.
posInicialValidaJogadorMapa m [] = True
posInicialValidaJogadorMapa m ((Jogador (x,y) d v las choq):r) |x>= 1 && x<= ((length m)-3) && y>=1 && y<= ((length (head m))-3) = posInicialValidaJogadorMapa m r
                                                               |otherwise = False

-- |Verifica se os jogadores não estao dentro uns dos outros.
posInicialValidaJogadores :: [Jogador] -- ^ A lista de todos os Jogadores
                          -> Bool      -- ^ Verdadeiro caso nenhum 'Jogador' esteja dentro de outro.
posInicialValidaJogadores [] = True
posInicialValidaJogadores ((Jogador (x,y) d1 v1 l1 c1):(Jogador (m,n) d2 v2 l2 c2):js) |abs(x-m)<2 && abs (y-n)<2 && v1 /=0 && v2/=0 = False
                                                                                       |abs(x-m)<2 && abs (y-n)<2 && (v1 ==0 || v2==0) = posInicialValidaJogadores ((Jogador (x,y) d1 v1 l1 c1):js) && posInicialValidaJogadores ((Jogador (m,n) d2 v2 l2 c2):js)
                                                                                       |otherwise = posInicialValidaJogadores ((Jogador (x,y) d1 v1 l1 c1):js) && posInicialValidaJogadores ((Jogador (m,n) d2 v2 l2 c2):js)
posInicialValidaJogadores (jd) = True

-- |Verifica se os jogadores não estou dentro de uma parede do mapa.
posValidaParedeMapa :: Mapa      -- ^ O Mapa de jogo.
                    -> [Jogador] -- ^ A lista de todos os jogadores.
                    -> Bool      -- ^ Verdadeiro se nenhum Jogador estiver dentro de uma parede.
posValidaParedeMapa m [] = True
posValidaParedeMapa m ((Jogador (x,y) d v las choq):r) |(encontraPosicaoMatriz (x,y) m == Vazia) && (encontraPosicaoMatriz (x+1,y) m == Vazia) && (encontraPosicaoMatriz (x,y+1) m == Vazia) && (encontraPosicaoMatriz (x+1,y+1) m  == Vazia) = posValidaParedeMapa m r
                                                       |otherwise = False

-- |Remove um Jogador da lista de jogadores.
removeJogadorLista :: Jogador   -- ^ O Jogador que se tem de remover da lista.
                   -> [Jogador] -- ^ A lista de todos os jogadores.
                   -> [Jogador] -- ^ A lista resultante de remover o jogador da lista inicial.
removeJogadorLista _ [] = []
removeJogadorLista j (h:t) |j == h = t
                           |otherwise = h:removeJogadorLista j t

-- |Insere, ordenadamente, o Jogador que se tinha removido devolta na lista de Jogadores.
ordenaJogadores :: Int       -- ^ O identificador do 'Jogador' foi removido da lista.
                -> Jogador   -- ^ O 'Jogador' que se tem de inserir na lista.
                -> [Jogador] -- ^ A lista sem o jogador.
                -> [Jogador] -- ^ A lista de todos os jogadores.
ordenaJogadores _ jd [] = [jd]
ordenaJogadores 0 jd (h:t) = (jd:h:t)
ordenaJogadores j jd (h:t) = h:(ordenaJogadores (j-1) jd t)  

-- * Auxiliares para fazer o Dispara arma.


-- |Altera o Estado quando é efetuado o disparo.
--
-- __NB:__ Chama as funções 'posInicialValida', 'ordenaJogadores', 'removeJogadorLista' ,'verificaVidas', 'verificaBalas', 'retiraBalas' e 'fazDisparo'.
estadoDisparo :: Int     -- ^ O identificador do 'Jogador' que efetua a jogada.
              -> Arma    -- ^ A 'Arma' que o jogador vai usar
              -> Estado  -- ^ O 'Estado' anterior.
              -> Estado  -- ^ O 'Estado' resultante após o jogador ter efetuado o Disparo

estadoDisparo j Canhao (Estado m (jh:jt) ds) |posInicialValida m (jh:jt) && verificaVidas ((jh:jt) !! j) = Estado m (jh:jt) (disparo:ds)
                                             |posInicialValida m (jh:jt) && (verificaVidas ((jh:jt) !! j)) == False = Estado m (jh:jt) ds
                                             |otherwise = error "Posicoes invalidas"
                                              where disparo = fazDisparo j ((jh:jt) !! j) Canhao

estadoDisparo j Laser (Estado m (jh:jt) ds) |posInicialValida m (jh:jt) == False = error "Posicoes invalidas"
                                            |posInicialValida m (jh:jt) && verificaBalas ((jh:jt) !! j) Laser && verificaVidas ((jh:jt) !! j) = Estado m (ordenaJogadores j jogador (removeJogadorLista ((jh:jt) !! j) (jh:jt))) (disparo:ds) 
                                            |otherwise = Estado m (jh:jt) ds
                                     where disparo = fazDisparo j ((jh:jt) !! j) Laser
                                           jogador = retiraBalas j ((jh:jt) !! j) Laser

estadoDisparo j Choque (Estado m (jh:jt) ds) |posInicialValida m (jh:jt) == False = error "Posicoes invalidas"
                                             |posInicialValida m (jh:jt) && verificaBalas ((jh:jt) !! j) Choque && verificaVidas ((jh:jt) !! j) = Estado m (ordenaJogadores j jogador (removeJogadorLista ((jh:jt) !! j) (jh:jt))) (disparo:ds)
                                             |otherwise = Estado m (jh:jt) ds
                                     where disparo = fazDisparo j ((jh:jt) !! j) Choque 
                                           jogador = retiraBalas j ((jh:jt) !! j) Choque

-- |Cria um novo 'Disparo' para ser adicionado à lista de Disparos.
fazDisparo :: Int     -- ^ O identificador do 'Jogador' que efetua o 'Disparo'.
           -> Jogador -- ^ O 'Jogador' que faz o 'Disparo'.
           -> Arma    -- ^ A 'Arma' que o 'Jogador' usou para efetuar o 'Disparo'.
           -> Disparo -- ^ O 'Disparo' que o 'Jogador' fez.
fazDisparo j (Jogador (x,y) d v las choq) Canhao |d == C = DisparoCanhao j (x-1,y) C
                                                 |d == D = DisparoCanhao j (x,y+1) D 
                                                 |d == B = DisparoCanhao j (x+1,y) B
                                                 |d == E = DisparoCanhao j (x,y-1) E
fazDisparo j (Jogador (x,y) d v las choq) Laser  |d == C = DisparoLaser j (x-1,y) C
                                                 |d == D = DisparoLaser j (x,y+1) D 
                                                 |d == B = DisparoLaser j (x+1,y) B
                                                 |d == E = DisparoLaser j (x,y-1) E
fazDisparo j (Jogador (x,y) d v las choq) Choque = DisparoChoque j 5

-- |Verifica se o 'Jogador' tem balas de um determinado tipo de 'Arma'.
verificaBalas :: Jogador -- ^ O 'Jogador' que vai ser verificado se tem ou não balas.
              -> Arma -- ^ A 'Arma' que vai ser verificada.
              -> Bool -- ^ Verdadeiro se o 'Jogador' tiver balas.
verificaBalas (Jogador (x,y) d v 0 choq) Laser = False                                              
verificaBalas (Jogador (x,y) d v las 0) Choque = False
verificaBalas (Jogador (x,y) d v las choq) arma = True

-- |Verifica se o 'Jogador' tem Vidas.
verificaVidas :: Jogador -- ^ O 'Jogado' que vai ser verificado.
              -> Bool -- ^ Verdadeiro se o Jogador tiver mais que 0 vidas.
verificaVidas (Jogador (x,y) d v las choq) |v == 0 = False
                                           |v >0 = True
                                           |otherwise = error "Invalid Input"

-- |Remove balas da 'Arma' que o Jogador disparou.
retiraBalas :: Int     -- ^ O identificador do 'Jogador' que vai ser retirado as balas.
            -> Jogador -- ^ O 'Jogador' que vai ser removido balas.
            -> Arma    -- ^ A 'Arma' que vai ser removida balas.
            -> Jogador -- ^ O 'Jogador' após terem sido removidas as balas.
retiraBalas j (Jogador (x,y) d v las choq) Laser = (Jogador (x,y) d v (las-1) choq)
retiraBalas j (Jogador (x,y) d v las choq) Choque = (Jogador (x,y) d v las (choq-1))

-- * Auxiliares para fazer o Mivimenta 'Direcao'

-- |Altera o 'Estado' quando é feito o Movimenta.
--
-- __NB:__ Chama as funções 'posInicialValida', 'ordenaJogadores', 'removeJogadorLista' ,'verificaVidas', 'moveDirecao'.
estadoDirecao :: Int     -- ^ O identificador do 'Jogador' que efetua o Movimenta.
              -> Direcao -- ^ A direção para que se tem de mover. 
              -> Estado  -- ^ O 'Estado' inicial.
              -> Estado  -- ^ O 'Estado' apos ser aplicado o 'Movimenta'

estadoDirecao j df (Estado m (jh:jt) ds) |posInicialValida m (jh:jt) && verificaVidas ((jh:jt) !! j) = Estado m (ordenaJogadores j jogador (removeJogadorLista ((jh:jt) !! j) (jh:jt))) ds 
                                         |posInicialValida m (jh:jt) && verificaVidas ((jh:jt) !! j) == False = Estado m (jh:jt) ds
                                         |otherwise = error "Posicoes invalidas"                                                                                            
                                         where jogador = moveDirecao j (Estado m (jh:jt) ds) ((jh:jt) !! j) df

-- |Ou vai fazer o 'Jogador' mover numa determinada 'Direcao' ou vai rodar o 'Jogador' para uma 'Direcao'.
--
-- __NB:__ Chama as funções 'mover' ou 'mudaDirecao'.
moveDirecao :: Int      -- ^ O identificador do 'Jogador' que efetua o movimento/rotação.
            -> Estado   -- ^ O 'Estado' atual.
            -> Jogador  -- ^ O 'Jogador' que efetua o movimento/rotação.
            -> Direcao  -- ^ A direção para confirma se move ou roda.
            -> Jogador  -- ^ O 'Jogador' apos ter movido/rodado.
moveDirecao j (Estado m js ds) (Jogador (x,y) d v las choq) df |podeMover (Estado m js ds) df (Jogador (x,y) d v las choq) && direcaoMover (Jogador (x,y) d v las choq) df = mover df (Jogador (x,y) d v las choq)
                                                               |podeMover (Estado m js ds) df (Jogador (x,y) d v las choq) && (direcaoMover (Jogador (x,y) d v las choq) df) == False = mudaDirecao (Jogador (x,y) d v las choq) df
                                                               |otherwise = (Jogador (x,y) df v las choq)

-- |Faz um 'Jogador' mover numa 'Direcao'.
mover :: Direcao -- ^ Direção que o 'Jogador' vai mover.  
      -> Jogador -- ^ O Jogador que se vai mover.
      -> Jogador -- ^ O Jogador após se mover.
mover df (Jogador (x,y) d v las choq) |df == C = (Jogador (x-1,y) d v las choq) 
                                      |df == D = (Jogador (x,y+1) d v las choq)
                                      |df == B = (Jogador (x+1,y) d v las choq)
                                      |df == E = (Jogador (x,y-1) d v las choq)

-- |Verifica se um jogador se pode  mover numa determinada direção.
--
-- __NB:__ Chama as funções 'encontraPosicaoMatriz', 'verificaJogadores' e verificaChoque'
podeMover :: Estado  -- ^ O 'Estado' atual, onde está contido o mapa. 
          -> Direcao -- ^ A direção do movimento.
          -> Jogador -- ^ O Jogador que vai efetuar o movimento.
          -> Bool    -- ^ Verdadeiro se o 'Jogador' pode efetuar o movimento.
podeMover (Estado m js ds) C (Jogador (x,y) df v las choq) |((encontraPosicaoMatriz (x-1,y) m /= Vazia) || (encontraPosicaoMatriz (x-1,y+1) m /= Vazia)) = False
                                                           |verificaJogadores (Jogador (x,y) df v las choq) C js  = False
                                                           |verificaChoque (Jogador (x,y) df v las choq) js ds == False = False
                                                           |otherwise = True
podeMover (Estado m js ds) D (Jogador (x,y) df v las choq) |((encontraPosicaoMatriz (x,y+2) m /= Vazia) || (encontraPosicaoMatriz (x+1,y+2) m /= Vazia)) = False  
                                                           |verificaJogadores (Jogador (x,y) df v las choq) D js = False
                                                           |verificaChoque (Jogador (x,y) df v las choq) js ds == False = False
                                                           |otherwise = True
podeMover (Estado m js ds) B (Jogador (x,y) df v las choq) |((encontraPosicaoMatriz (x+2,y) m /= Vazia) || (encontraPosicaoMatriz (x+2,y+1) m /= Vazia)) = False
                                                           |verificaJogadores (Jogador (x,y) df v las choq) B js = False
                                                           |verificaChoque (Jogador (x,y) df v las choq) js ds == False = False
                                                           |otherwise = True
podeMover (Estado m js ds) E (Jogador (x,y) df v las choq) |((encontraPosicaoMatriz (x,y-1) m /= Vazia) || (encontraPosicaoMatriz (x+1,y-1) m /= Vazia)) = False 
                                                           |verificaJogadores (Jogador (x,y) df v las choq)  E js = False
                                                           |verificaChoque (Jogador (x,y) df v las choq) js ds == False = False
                                                           |otherwise = True

-- |Verifica se o 'Jogador' está na direção necessária para efetuar o movimento para outra posição.
direcaoMover :: Jogador -- ^ O Jogador que vai ser verificado.
             -> Direcao -- ^ A direção para comparar com a direção do 'Jogador'.
             -> Bool    -- ^ Verdadeiro se o jogador tem a direção igual ao do movimento.
direcaoMover (Jogador (x,y) d v las choq) df = d == df

-- |Se o jogador não tiver a direção necessária para se mover, ele vai rodar (mudar de direção).
mudaDirecao :: Jogador -- ^ O Jogador antes de mudar de direção. 
            -> Direcao -- ^ A direção para a qual tem de mudar.
            -> Jogador -- ^ O Jogador após ter mudado de direção.
mudaDirecao (Jogador (x,y) d v las choq) df = if d == df then (Jogador (x,y) d v las choq) else (Jogador (x,y) df v las choq) 

-- |Dá uma lista com as posições dos jogadores que dispararam o choque.
--
-- __NB:__ Chama as funções 'retiraPosição' e 'jogadorQueDisparou'.
posicoesJogadores :: [Jogador] -- ^ Lista de todos os jogadores.
                  -> [Disparo] -- ^ Lista de todos os disparos.
                  -> [Posicao] -- ^ Lista das posições dos jogadores com choque ativo.
posicoesJogadores js ds = retiraPosicao (jogadorQueDisparou js ds)

-- |Dado uma lista de Jogadores, junta todas as posições numa lista.
retiraPosicao :: [Jogador] -- ^ Lista dos jogadores.
              -> [Posicao] -- ^ Lista das posições.
retiraPosicao [] = []
retiraPosicao ((Jogador (x,y) d v las choq):r) = (x,y) : retiraPosicao r

-- |Verifica quais jogadores disparam choque.
jogadorQueDisparou :: [Jogador] -- ^ Lista de todos os jogadores.
                   -> [Disparo] -- ^ Lista de todos os disparos.
                   -> [Jogador] -- ^ Lista dos Jogadores que usaram um DisparoChoque
jogadorQueDisparou js [] = []
jogadorQueDisparou js ((DisparoChoque jd ts):t) |jd == 0 = (js !! 0) : jogadorQueDisparou js t
                                                |jd == 1 = (js !! 1) : jogadorQueDisparou js t
                                                |jd == 2 = (js !! 2) : jogadorQueDisparou js t
                                                |jd == 3 = (js !! 3) : jogadorQueDisparou js t
jogadorQueDisparou js (h:t) = jogadorQueDisparou js t
-- |Verifica se um jogador está dentro da area de um choque
areaChoque :: Jogador   -- ^ Jogador que vai ser verificado.
           -> [Posicao] -- ^ Lista das posições centrais dos choques.
           -> Bool      -- ^ Verdadeiro se 'Jogador' estiver dentro da area do choque.
areaChoque (Jogador (m,n) d v las choq) [] = False
areaChoque (Jogador (m,n) d v las choq) ((x,y):r) |(abs(m-x)>3) || (abs(n-y)>3) = areaChoque (Jogador (m,n) d v las choq) r
                                                  |((m==x) && (n==y)) = False
                                                  |otherwise = True

-- |Verifica sem um jogador se pode mover.
--
-- __NB:__ Chama as funções 'areaChoque' e 'posicoesJogadores'.
verificaChoque :: Jogador   -- ^ O Jogador que vai ser verificado.
               -> [Jogador] -- ^ A lista dos jogadores que dispararam o choque.
               -> [Disparo] -- ^ A lista dos disparos.
               -> Bool      -- ^ Verdadeiro se o 'Jogador' pode mexer.
verificaChoque (Jogador (x,y) d v las choq) js ds |areaChoque (Jogador (x,y) d v las choq) (posicoesJogadores js ds) = False
                                                  |otherwise = True

-- |Verifica se na posições para qual o 'Jogador' se mexe tem outro 'Jogador'
verificaJogadores :: Jogador   -- ^ O Jogador para comparar.
                  -> Direcao   -- ^ A direção para o qual se vai mexer.
                  -> [Jogador] -- ^ A lista de todos os Jogadores.
                  -> Bool      -- ^ Falso se nao tiver jogador na posição onde o 'Jogador' pretender ir.
verificaJogadores j _ [] = False
verificaJogadores (Jogador (x,y) d v las choq) B ((Jogador (m,n) d1 v1 las1 choq1):r) |v1 /= 0 && (x+1 == m-1 && (y==n || y==n+1 ||y==n-2)) = True
                                                                                      |otherwise = verificaJogadores (Jogador (x,y) d v las choq) B r
verificaJogadores (Jogador (x,y) d v las choq) C ((Jogador (m,n) d1 v1 las1 choq1):r) |v1 /= 0 && (x-1 == m+1 && (y==n || y==n+1 ||y==n-2)) = True
                                                                                      |otherwise = verificaJogadores (Jogador (x,y) d v las choq) C r
verificaJogadores (Jogador (x,y) d v las choq) E ((Jogador (m,n) d1 v1 las1 choq1):r) |v1 /= 0 && (y-1 == n+1 && (x==m || x==m+1 ||x==m-1)) = True
                                                                                      |otherwise = verificaJogadores (Jogador (x,y) d v las choq) E r
verificaJogadores (Jogador (x,y) d v las choq) D ((Jogador (m,n) d1 v1 las1 choq1):r) |v1 /= 0 && (y+1 == n-1 && (x==m || x==m+1 ||x==m-1)) = True
                                                                                      |otherwise = verificaJogadores (Jogador (x,y) d v las choq) D r