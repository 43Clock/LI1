-- | Este módulo define funções comuns da Tarefa 4 do trabalho prático.
module Tarefa4_2018li1g006 where

import LI11819
import Tarefa0_2018li1g006
import Tarefa1_2018li1g006
import Tarefa2_2018li1g006
import Tarefa3_2018li1g006

-- * Testes
-- | Testes unitários da Tarefa 4.
--
-- Cada teste é um 'Estado'.
testesT4 :: [Estado]
testesT4 = [(Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,1) D 5 2 2),(Jogador (4,4) B 5 2 2)] [(DisparoCanhao 1 (2,1) C),(DisparoCanhao 0 (1,2) C),(DisparoChoque 1 1),(DisparoChoque 1 0)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,1) B 1 2 2),(Jogador (1,4) C 3 2 1)] [(DisparoCanhao 1 (2,1) C),(DisparoCanhao 0 (3,0) E),(DisparoLaser 0 (4,3) C)]),
            (Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (2,1), direcaoJogador = D, vidasJogador = 5, lasersJogador = 1, choquesJogador = 2}], disparosEstado = [DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,2), direcaoDisparo = D}]}),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (3,1) D 5 2 2),(Jogador (3,5) D 5 2 2),(Jogador (4,3) D 5 2 2),(Jogador (2,7) D 5 2 2)] [(DisparoLaser 0 (3,2) B)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (3,1) D 5 2 2),(Jogador (3,5) D 5 2 2),(Jogador (4,3) D 5 2 2),(Jogador (2,7) D 5 2 2)] [(DisparoLaser 0 (3,2) D)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (5,5) C 1 1 1)] [(DisparoCanhao 0 (1,1) D), (DisparoCanhao 0 (1,2) E)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [Jogador (1,1) D 1 1 1] [DisparoCanhao 0 (1,2) D]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [Jogador (1,1) D 5 2 2] [(DisparoCanhao 0 (2,1) C)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (5,5) C 1 1 1)] [(DisparoCanhao 0 (1,1) C), (DisparoCanhao 0 (1,1) E)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (5,5) C 1 1 1)] [(DisparoLaser 0 (2,2) B), (DisparoLaser 0 (4,4) E)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,1) D 3 2 1),(Jogador (3,1) E 1 2 2)] [(DisparoLaser 0 (2,5) E)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Bloco Destrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,1) C 1 1 1)] [(DisparoLaser 0 (1,2) D)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (7,7) C 1 1 1)] [(DisparoLaser 0 (2,2) D),(DisparoCanhao 0 (2,3) B), (DisparoCanhao 0 (1,3) B)]), 
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Destrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,2) D 5 2 2)] [(DisparoCanhao 0 (2,1) C)]),
            (Estado [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]] [(Jogador (1,2) D 5 2 2)] [(DisparoCanhao 0 (2,1) C)]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (2,1) D, DisparoLaser 0 (1,2) B]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (2,1) D, DisparoLaser 0 (1,2) B, DisparoLaser 0 (2,2) B, DisparoLaser 0 (2,3) B]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (2,1) D, DisparoLaser 0 (1,2) B, DisparoLaser 0 (2,2) B, DisparoLaser 0 (2,3) B]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (2,1) D, DisparoLaser 0 (1,2) B, DisparoLaser 0 (2,2) B]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (2,1) D, DisparoLaser 0 (2,2) B]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (2,1) D, DisparoLaser 0 (1,3) B]),
            (Estado (mapaInicial (10,10)) [Jogador (3,3) D 6 1 1] [DisparoLaser 0 (1,2) B, DisparoLaser 0 (2,2) B, DisparoLaser 0 (1,3) B]),
            (Estado (mapaInicial (15,15)) [Jogador (8,8) D 6 1 1] [DisparoCanhao 0 (3,2) E, DisparoCanhao 0 (4,4) D]),
            (Estado (mapaInicial (15,15)) [Jogador (8,8) D 6 1 1] [DisparoCanhao 0 (3,2) C, DisparoCanhao 0 (4,4) B]),
            (Estado (mapaInicial (15,15)) [Jogador (8,8) D 6 1 1] [DisparoCanhao 0 (3,2) D, DisparoCanhao 0 (4,4) E]),
            (Estado (mapaInicial (15,15)) [Jogador (8,8) D 6 1 1] [DisparoCanhao 0 (3,2) B, DisparoCanhao 0 (4,4) C])]
          
-- * Funções principais da Tarefa 4.

-- | Avança o 'Estado' do jogo um 'Tick' de tempo.
--
-- __NB:__ Apenas os 'Disparo's afetam o 'Estado' do jogo com o passar do tempo.
--
-- __NB:__ Deve chamar as funções 'tickChoques', 'tickCanhoes' e 'tickLasers' pela ordem definida.
tick :: Estado -- ^ O 'Estado' anterior.
     -> Estado -- ^ O 'Estado' após um 'Tick'.
tick  = tickChoques . tickCanhoes . tickLasers 

-- | Avança o 'Estado' do jogo um 'Tick' de tempo, considerando apenas os efeitos dos tiros de 'Laser' disparados.
tickLasers :: Estado -- ^ O 'Estado' anterior.
           -> Estado -- ^ O 'Estado' apos todos os tickLasers teram acontecido.
tickLasers (Estado m js []) = (Estado m js [])
tickLasers (Estado m js ((DisparoLaser j (x,y) d):dt)) = tickLasers (Estado (destroiParedeLaser m d (listaDePosicoes (x,y) (verOndePara m (DisparoLaser j (x,y) d)))) (retiraVidas js (jogadoresAtingidos d (listaDePosicoes (x,y) (verOndePara m (DisparoLaser j (x,y) d))) js)) (destroiBalasPosicao (listaDePosicoes (x,y) (verOndePara m (DisparoLaser j (x,y) d))) dt))
tickLasers (Estado m js (dh:dt)) = adiciona dh (tickLasers (Estado m js dt)) 


-- |Vê qual é a posição final de um DisparoLaser, ou seja, quando encontra um Bloco Indestrutivel.
verOndePara :: Mapa    -- ^ O mapa atual do Jogo.
            -> Disparo -- ^ O disparo de laser do qual vai ser retirado a posição final.
            -> Posicao -- ^ A posição final do laser.
verOndePara m (DisparoLaser j (x,y) C) |(encontraPosicaoMatriz (x,y) m == Bloco Indestrutivel) || (encontraPosicaoMatriz (x,y+1) m == Bloco Indestrutivel) = (x,y)
                                       |otherwise = verOndePara m (DisparoLaser j (x-1,y) C)
verOndePara m (DisparoLaser j (x,y) D) |(encontraPosicaoMatriz (x,y+1) m == Bloco Indestrutivel) || (encontraPosicaoMatriz (x+1,y+1) m == Bloco Indestrutivel) = (x,y)
                                       |otherwise = verOndePara m (DisparoLaser j (x,y+1) D)
verOndePara m (DisparoLaser j (x,y) B) |(encontraPosicaoMatriz (x+1,y) m == Bloco Indestrutivel) || (encontraPosicaoMatriz (x+1,y+1) m == Bloco Indestrutivel) = (x,y)
                                       |otherwise = verOndePara m (DisparoLaser j (x+1,y) B)
verOndePara m (DisparoLaser j (x,y) E) |(encontraPosicaoMatriz (x,y) m == Bloco Indestrutivel) || (encontraPosicaoMatriz (x+1,y) m == Bloco Indestrutivel) = (x,y)
                                       |otherwise = verOndePara m (DisparoLaser j (x,y-1) E)


-- |Destroi todas as balas de canhao  por onde um laser passa.
destroiBalasPosicao :: [Posicao] -- ^ A lista de posições por onde o laser passa.
                    -> [Disparo] -- ^ A lista de todos os disparos do qual apanas vai ser comparado as de canhão.
                    -> [Disparo] -- ^ A lista de disparos após seram removidas balas que foram destruidas pelo laser.
destroiBalasPosicao [] d = d
destroiBalasPosicao p ((DisparoCanhao j (x,y) d):r) = if aux (x,y) p then destroiBalasPosicao p r 
                                                              else (DisparoCanhao j (x,y) d):destroiBalasPosicao p r
                                             where aux _ [] = False
                                                   aux (x,y) ((m,n):t) = if (x,y) == (m,n) then True
                                                                                           else aux (x,y) t
destroiBalasPosicao p (h:t) = h:destroiBalasPosicao p t
destroiBalasPosicao _ _ = []


-- |Destroi todos os Blocos Destrutiveis por onde o laser passa.
destroiParedeLaser :: Mapa      -- ^ O mapa atual do jogo.
                   -> Direcao   -- ^ A direção do laser.
                   -> [Posicao] -- ^ Todas as posições por onde o laser passa.
                   -> Mapa      -- ^ O mapa após o laser passar.
destroiParedeLaser m d [] = m
destroiParedeLaser m C [(x,y)] |encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x,y+1) m  == Vazia = m
                               |encontraPosicaoMatriz (x,y) m == Vazia && encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel) = atualizaPosicaoMatriz (x,y+1) Vazia m
                               |encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel) && encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) = atualizaPosicaoMatriz (x,y) Vazia m
destroiParedeLaser m D [(x,y)] |encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y+1) m == Vazia = m
                               |encontraPosicaoMatriz (x,y+1) m == Vazia && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel) = atualizaPosicaoMatriz (x+1,y+1) Vazia m
                               |encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel) && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel) = atualizaPosicaoMatriz (x,y+1) Vazia m
destroiParedeLaser m B [(x,y)] |encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y+1) m == Vazia = m
                               |encontraPosicaoMatriz (x+1,y) m == Vazia && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel) = atualizaPosicaoMatriz (x+1,y+1) Vazia m
                               |encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel) && encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel) = atualizaPosicaoMatriz (x+1,y) Vazia m
destroiParedeLaser m E [(x,y)] |encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y) m == Vazia = m
                               |encontraPosicaoMatriz (x,y) m == Vazia && encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel) = m
                               |encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel) && encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel) = atualizaPosicaoMatriz (x+1,y) Vazia m
                               |encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel) && encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel) = atualizaPosicaoMatriz (x,y) Vazia m
destroiParedeLaser m d ((x,y):t) = case d of
    C -> (atualizaPosicaoMatriz (x,y) Vazia (atualizaPosicaoMatriz (x,y+1) Vazia (destroiParedeLaser m d t)))
    D -> (atualizaPosicaoMatriz (x,y+1) Vazia (atualizaPosicaoMatriz (x+1,y+1) Vazia (destroiParedeLaser m d t)))
    B -> (atualizaPosicaoMatriz (x+1,y) Vazia (atualizaPosicaoMatriz (x+1,y+1) Vazia (destroiParedeLaser m d t)))
    E -> (atualizaPosicaoMatriz (x,y) Vazia (atualizaPosicaoMatriz (x+1,y) Vazia (destroiParedeLaser m d t)))


-- |Cria uma lista de posições ordenada em que o ponto inicial é o inico do laser e o ponto final é o fim do laser. 
listaDePosicoes :: Posicao   -- ^ A posição inicial do Laser.
                -> Posicao   -- ^ A posição final do Laser.
                -> [Posicao] -- ^ Todas as posições por onde o Laser passa.
listaDePosicoes (x,y) (m,n) |x == m && y == n = aux [(m,n)]
                            |x == m && y<n    = aux ((x,y):listaDePosicoes (x,y+1) (m,n))
                            |x == m && y>n    = aux ((m,n):listaDePosicoes (x,y) (m,n+1))
                            |x>m && y == n    = aux ((m,n):listaDePosicoes (x,y) (m+1,n))
                            |x<m && y == n    = aux ((x,y):listaDePosicoes (x+1,y) (m,n))
                            where aux [] = []
                                  aux ((x,y):t) = if x==0 || y==0 then aux t
                                                                  else (x,y):aux t


-- |Compara a lista de posições por onde o laser passou com a lista de Jogadores e indica quais os jogadores que perdem vida.
jogadoresAtingidos :: Direcao   -- ^ A direção do Laser
                   -> [Posicao] -- ^ A lista de posições por onde o Laser passa.
                   -> [Jogador] -- ^ A lista de todos os Jogadores
                   -> [Jogador] -- ^ A lista dos Jogadores atingidos pelo laser.
jogadoresAtingidos D ((x,y):t) ((Jogador (m,n) d v las choq ):r) |v /= 0 && ((m==x-1 && (n==y || n==y+1)) || (m==x && (n==y+1|| n==y)) || (m==x+1 && (n==y || n==y+1)))  = removeRep ((Jogador (m,n) d v las choq):(jogadoresAtingidos D ((x,y):t) r)++(jogadoresAtingidos D t r))
                                                                 |otherwise = removeRep ((jogadoresAtingidos D ((x,y):t) r)++(jogadoresAtingidos D t ((Jogador (m,n) d v las choq ):r)))
jogadoresAtingidos C ((x,y):t) ((Jogador (m,n) d v las choq ):r) |v /= 0 && ((m==x-1 && (n==y || n==y-1 || n==y+1)) || (m==x && (n==y-1 ||n==y+1|| n==y)))               = removeRep ((Jogador (m,n) d v las choq):(jogadoresAtingidos C ((x,y):t) r)++(jogadoresAtingidos C t r))
                                                                 |otherwise = removeRep ((jogadoresAtingidos C ((x,y):t) r)++(jogadoresAtingidos C t ((Jogador (m,n) d v las choq ):r)))
jogadoresAtingidos B ((x,y):t) ((Jogador (m,n) d v las choq ):r) |v /= 0 && ((m==x && (n==y-1 ||n==y+1|| n==y)) || (m==x+1 && (n==y-1 || n==y || n==y+1)))               = removeRep ((Jogador (m,n) d v las choq):(jogadoresAtingidos B ((x,y):t) r)++(jogadoresAtingidos B t r))
                                                                 |otherwise = removeRep ((jogadoresAtingidos B ((x,y):t) r)++(jogadoresAtingidos B t ((Jogador (m,n) d v las choq ):r)))
jogadoresAtingidos E ((x,y):t) ((Jogador (m,n) d v las choq ):r) |v /= 0 && ((m==x-1 && (n==y || n==y-1)) || (m==x && (n==y-1 || n==y)) || (m==x+1 && (n==y-1 || n==y))) = removeRep ((Jogador (m,n) d v las choq):(jogadoresAtingidos E ((x,y):t) r)++(jogadoresAtingidos E t r))
                                                                 |otherwise = removeRep ((jogadoresAtingidos E ((x,y):t) r)++(jogadoresAtingidos E t ((Jogador (m,n) d v las choq ):r)))

jogadoresAtingidos _ _ _ = []

-- |Remove os jogadores que aparecem repetidos numa lista.
removeRep :: [Jogador] -> [Jogador]
removeRep [] = []
removeRep (h:t) = if elem h t then removeRep t
                              else h:removeRep t

-- | Avança o 'Estado' do jogo um 'Tick' de tempo, considerando apenas os efeitos das balas de 'Canhao' disparadas.
tickCanhoes :: Estado -- ^ O 'Estado' anterior.
            -> Estado -- ^ O 'Estado' apos todos os tickCanhao teram acontecido. 
tickCanhoes (Estado m js  []) = Estado m js []
tickCanhoes (Estado m js (dh:dt)) |balaMover m dh && verJogador dh js && cruzarBalas dh dt                       = adiciona (moveDisparo dh) (tickCanhoes (Estado m js dt))
                                  |(balaMover m dh) == False && verJogador dh js && cruzarBalas dh dt            = tickCanhoes (destroiParedeCanhao (Estado m js (dh:dt)) dh)
                                  |balaMover m dh && (verJogador dh js) == False && cruzarBalas dh dt            = tickCanhoes (Estado m (retiraVidas js (jogadorQueAcertou dh js)) dt)
                                  |balaMover m dh && verJogador dh js && (cruzarBalas dh dt) == False            = tickCanhoes (Estado m js (destroiBalas (balasQueCruzou dh dt) dt)) -- !!!!
                                  |(balaMover m dh) == False && (verJogador dh js) == False && cruzarBalas dh dt = tickCanhoes (destroiParedeCanhao (Estado m (retiraVidas js (jogadorQueAcertou dh js)) dt) dh)

-- |Faz um DisparoCanhao avançar uma posição dependendo da sua direção.
moveDisparo :: Disparo -- ^ O disparoCanhao antes de se mover.
            -> Disparo -- ^ O disparoCanhao depois de se mover.
moveDisparo (DisparoCanhao j (x,y) d) |d==C = DisparoCanhao j (x-1,y) C
                                      |d==D = DisparoCanhao j (x,y+1) D
                                      |d==E = DisparoCanhao j (x,y-1) E
                                      |d==B = DisparoCanhao j (x+1,y) B
moveDisparo h = h


-- |Verifica se a bala está à frente de uma parede ou não dependendo da direção. True se ela se pode mover.
balaMover :: Mapa    -- ^ O mapa atual de jogo
          -> Disparo -- ^ O disparoCanhao a comparar.
          -> Bool    -- ^ True se a bala não vai contra uma parede.
balaMover m (DisparoCanhao j (x,y) d) |d == C && (encontraPosicaoMatriz (x,y) m == Vazia) && (encontraPosicaoMatriz (x,y+1) m == Vazia) = True
                                      |d == D && (encontraPosicaoMatriz (x,y+1) m == Vazia) && (encontraPosicaoMatriz (x+1,y+1) m == Vazia) = True
                                      |d == B && (encontraPosicaoMatriz (x+1,y) m == Vazia) && (encontraPosicaoMatriz (x+1,y+1) m == Vazia) = True
                                      |d == E && (encontraPosicaoMatriz (x,y) m == Vazia) && (encontraPosicaoMatriz (x+1,y) m == Vazia) = True
                                      |otherwise = False
balaMover m _ = True


-- |Verifica se a bala está à frente de um jogador ou não dependendo da direção. True não ha jogador na direção da bala.
verJogador :: Disparo   -- ^ O disparoCanhao a comparar.
           -> [Jogador] -- ^ A lista de todos os Jogadores.
           -> Bool      -- ^ True se a bala não atinge nenhum Jogador.
verJogador _ [] = True
verJogador (DisparoCanhao j (x,y) C) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x-1 && (n==y || n==y-1 || n==y+1)) || (m==x && (n==y-1 ||n==y+1|| n==y)))               = False
                                                                       |otherwise = verJogador (DisparoCanhao j (x,y) C) jt
verJogador (DisparoCanhao j (x,y) D) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x-1 && (n==y || n==y+1)) || (m==x && (n==y+1|| n==y)) || (m==x+1 && (n==y || n==y+1)))  = False
                                                                       |otherwise = verJogador (DisparoCanhao j (x,y) D) jt
verJogador (DisparoCanhao j (x,y) B) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x && (n==y-1 ||n==y+1|| n==y)) || (m==x+1 && (n==y-1 || n==y || n==y+1)))               = False
                                                                       |otherwise = verJogador (DisparoCanhao j (x,y) B) jt
verJogador (DisparoCanhao j (x,y) E) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x-1 && (n==y || n==y-1)) || (m==x && (n==y-1 || n==y)) || (m==x+1 && (n==y-1 || n==y))) = False
                                                                       |otherwise = verJogador (DisparoCanhao j (x,y) E) jt 
verJogador _ (h:t) = True


-- |Verifica se existe alguma bala na lista de balas com a mesma posição.
cruzarBalas :: Disparo   -- ^ O disparoCanhao a comparar.
            -> [Disparo] -- ^ A lista de todos os disparos.
            -> Bool      -- ^ True se a bala não cruza com nenhuma outra bala.
cruzarBalas _ [] = True
cruzarBalas (DisparoCanhao j (x,y) d) ((DisparoCanhao j' (m,n) d'):t) |m==x && n==y = False
                                                                      |otherwise = cruzarBalas (DisparoCanhao j (x,y) d) t
cruzarBalas (DisparoCanhao j (x,y) d) (h:t) = cruzarBalas (DisparoCanhao j (x,y) d) t
cruzarBalas b (h:t) = True
 

-- |Caso a função anterior dê False, esta função vai criar uma lista com as balas que o disparoCanhao cruzou.
balasQueCruzou :: Disparo   -- ^ O disparoCanhao a comparar.
               -> [Disparo] -- ^ A lista de todos os disparos
               -> [Disparo] -- ^ A lista dos disparoCanhao que a bala cruzou.
balasQueCruzou (DisparoCanhao j (x,y) d) [] = []
balasQueCruzou (DisparoCanhao j (x,y) d) ((DisparoCanhao j' (m,n) d'):t) |x==m && y==n = (DisparoCanhao j' (m,n) d'): balasQueCruzou (DisparoCanhao j (x,y) d) t
                                                                         |otherwise = balasQueCruzou (DisparoCanhao j (x,y) d) t
balasQueCruzou b (h:t) = balasQueCruzou b t

-- |Remove da lista principal as balas que estavam na lista da função anterior.
destroiBalas :: [Disparo] -> [Disparo] -> [Disparo]
destroiBalas (h:t) [] = []
destroiBalas (h:t) (dh:dt) = if aux dh (h:t) then destroiBalas (h:t) dt
                                             else dh:destroiBalas (h:t) dt
                                           where aux n [] = False
                                                 aux n (h:t) |n == h = True
                                                             |otherwise = aux n t


-- |Esta função vai remover os Blocos Destrutivel que uma bala acerta.
destroiParedeCanhao :: Estado  -- ^ O estado inicial de jogo
                    -> Disparo -- ^ A bala que atingiu uma parede.
                    -> Estado  -- ^ O estado após as alterações que a bala causou.
destroiParedeCanhao (Estado m js ds) (DisparoCanhao j (x,y) C) |(encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel))   && (encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel))   = Estado m js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel))   && (encontraPosicaoMatriz (x,y+1) m == (Vazia))                 = Estado m js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel))     && (encontraPosicaoMatriz (x,y+1) m == (Vazia))                 = Estado (atualizaPosicaoMatriz (x,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == Vazia)                   && (encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel))   = Estado m js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == Vazia)                   && (encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel))     = Estado (atualizaPosicaoMatriz (x,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel))   && (encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel))     = Estado (atualizaPosicaoMatriz (x,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel))     && (encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel))   = Estado (atualizaPosicaoMatriz (x,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) C) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel))     && (encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel))     = Estado ((atualizaPosicaoMatriz (x,y+1) Vazia (atualizaPosicaoMatriz (x,y) Vazia m))) js (removeDisparo (DisparoCanhao j (x,y) D) ds)
destroiParedeCanhao (Estado m js ds) (DisparoCanhao j (x,y) D) |(encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel)) && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel)) = Estado m js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel)) && (encontraPosicaoMatriz (x+1,y+1) m == (Vazia))               = Estado m js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel))   && (encontraPosicaoMatriz (x+1,y+1) m == (Vazia))               = Estado (atualizaPosicaoMatriz (x,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == Vazia)                 && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel)) = Estado m js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == Vazia)                 && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel))   = Estado (atualizaPosicaoMatriz (x+1,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == (Bloco Indestrutivel)) && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel))   = Estado (atualizaPosicaoMatriz (x+1,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel))   && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel)) = Estado (atualizaPosicaoMatriz (x,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) D) ds)
                                                               |(encontraPosicaoMatriz (x,y+1) m == (Bloco Destrutivel))   && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel))   = Estado ((atualizaPosicaoMatriz (x,y+1) Vazia (atualizaPosicaoMatriz (x+1,y+1) Vazia m))) js (removeDisparo (DisparoCanhao j (x,y) D) ds)
destroiParedeCanhao (Estado m js ds) (DisparoCanhao j (x,y) B) |(encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel)) && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel)) = Estado m js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel)) && (encontraPosicaoMatriz (x+1,y+1) m == (Vazia))               = Estado m js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel))   && (encontraPosicaoMatriz (x+1,y+1) m == (Vazia))               = Estado (atualizaPosicaoMatriz (x+1,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == Vazia)                 && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel)) = Estado m js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == Vazia)                 && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel))   = Estado (atualizaPosicaoMatriz (x+1,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel)) && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel))   = Estado (atualizaPosicaoMatriz (x+1,y+1) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel))   && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Indestrutivel)) = Estado (atualizaPosicaoMatriz (x+1,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) B) ds)
                                                               |(encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel))   && (encontraPosicaoMatriz (x+1,y+1) m == (Bloco Destrutivel))   = Estado ((atualizaPosicaoMatriz (x+1,y) Vazia (atualizaPosicaoMatriz (x+1,y+1) Vazia m))) js (removeDisparo (DisparoCanhao j (x,y) B) ds)
destroiParedeCanhao (Estado m js ds) (DisparoCanhao j (x,y) E) |(encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel))   && (encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel))   = Estado m js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel))   && (encontraPosicaoMatriz (x+1,y) m == (Vazia))                 = Estado m js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel))     && (encontraPosicaoMatriz (x+1,y) m == (Vazia))                 = Estado (atualizaPosicaoMatriz (x,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == Vazia)                   && (encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel))   = Estado m js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == Vazia)                   && (encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel))     = Estado (atualizaPosicaoMatriz (x+1,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Indestrutivel))   && (encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel))     = Estado (atualizaPosicaoMatriz (x+1,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel))     && (encontraPosicaoMatriz (x+1,y) m == (Bloco Indestrutivel))   = Estado (atualizaPosicaoMatriz (x,y) Vazia m) js (removeDisparo (DisparoCanhao j (x,y) E) ds)
                                                               |(encontraPosicaoMatriz (x,y) m == (Bloco Destrutivel))     && (encontraPosicaoMatriz (x+1,y) m == (Bloco Destrutivel))     = Estado ((atualizaPosicaoMatriz (x,y) Vazia (atualizaPosicaoMatriz (x+1,y) Vazia m))) js (removeDisparo (DisparoCanhao j (x,y) E) ds)


-- |Verifica quais foram os jogadores que uma bala acertou.
jogadorQueAcertou :: Disparo   -- ^ O disparoCanhao a comparar.
                  -> [Jogador] -- ^ A lista de todos os Jogadores.
                  -> [Jogador] -- ^ A lista de Jogadores que a bala atingiu.
jogadorQueAcertou (DisparoCanhao j (x,y) d) [] = []
jogadorQueAcertou (DisparoCanhao j (x,y) C) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x-1 && (n==y || n==y-1 || n==y+1)) || (m==x && (n==y-1 ||n==y+1|| n==y)))               = (Jogador (m,n) d v las choq):jogadorQueAcertou (DisparoCanhao j (x,y) C) jt
                                                                              |otherwise = jogadorQueAcertou (DisparoCanhao j (x,y) C) jt
jogadorQueAcertou (DisparoCanhao j (x,y) D) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x-1 && (n==y || n==y+1)) || (m==x && (n==y+1|| n==y)) || (m==x+1 && (n==y || n==y+1)))  = (Jogador (m,n) d v las choq):jogadorQueAcertou (DisparoCanhao j (x,y) D) jt
                                                                              |otherwise = jogadorQueAcertou (DisparoCanhao j (x,y) D) jt
jogadorQueAcertou (DisparoCanhao j (x,y) B) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x && (n==y-1 ||n==y+1|| n==y)) || (m==x+1 && (n==y-1 || n==y || n==y+1)))               = (Jogador (m,n) d v las choq):jogadorQueAcertou (DisparoCanhao j (x,y) B) jt
                                                                              |otherwise = jogadorQueAcertou (DisparoCanhao j (x,y) B) jt
jogadorQueAcertou (DisparoCanhao j (x,y) E) ((Jogador (m,n) d v las choq):jt) |v /= 0 && ((m==x-1 && (n==y || n==y-1)) || (m==x && (n==y-1 || n==y)) || (m==x+1 && (n==y-1 || n==y))) = (Jogador (m,n) d v las choq):jogadorQueAcertou (DisparoCanhao j (x,y) E) jt
                                                                              |otherwise = jogadorQueAcertou (DisparoCanhao j (x,y) E) jt

-- |Vai retirar vidas a todos os jogadores atingidos por um disparoCanhao ou disparoLaser.
retiraVidas :: [Jogador] -- ^ Lista de todos os jogadores.
            -> [Jogador] -- ^ Lista dos jogadores atingidos pela bala.
            -> [Jogador] -- ^ Lista de todos os jogadores depois do efeito da bala.
retiraVidas [] js = []
retiraVidas js [] = js
retiraVidas ((Jogador (x,y) d v las choq):r) (h:t) = if aux (Jogador (x,y) d v las choq) (h:t) then (Jogador (x,y) d (v-1) las choq):retiraVidas r (h:t)
                                                                                               else (Jogador (x,y) d v las choq):retiraVidas r (h:t)
                                                   where aux n [] = False
                                                         aux n (h:t) |n==h = True
                                                                     |otherwise = aux n t

-- |Adiciona um disparo a um Estado caso este não tenha sido destruido.                                                                                                                                                                                                                                                                                                                      
adiciona :: Disparo -> Estado -> Estado
adiciona n (Estado m js []) = Estado m js [n]
adiciona n (Estado m js (h:t)) = Estado m js (n:h:t)

-- |Remove um disparo especifico da lista de todos os disparos.
removeDisparo :: Disparo -> [Disparo] -> [Disparo]
removeDisparo _ [] = []
removeDisparo n (h:t) |n == h = t
                      |otherwise = h:removeDisparo n t


-- | Avança o 'Estado' do jogo um 'Tick' de tempo, considerando apenas os efeitos dos campos de 'Choque' disparados.
tickChoques :: Estado -> Estado
tickChoques (Estado m js []) = Estado m js []
tickChoques (Estado m js (dh:dt)) = (Estado m js (alteraChoque (dh:dt)))


-- |Reduz/remove da lista de disparos todos os disparoChoque  presentes nela. 
alteraChoque :: [Disparo] -- ^ A lista de disparos antes do efeito do tempo.
             -> [Disparo] -- ^ A lista de disparos depois do efeito do tempo.
alteraChoque [] = []
alteraChoque ((DisparoChoque j 0):t) = alteraChoque t
alteraChoque ((DisparoChoque j ts):t) = (DisparoChoque j (ts-1)) : alteraChoque t
alteraChoque (h:t) = h: alteraChoque t 
