-- | Este módulo define funções comuns da Tarefa 1 do trabalho prático.
module Tarefa1_2018li1g006 where

import LI11819
import Tarefa0_2018li1g006

-- * Testes

-- | Testes unitários da Tarefa 1.
--
-- Cada teste é uma sequência de 'Instrucoes'.
testesT1 :: [Instrucoes]
testesT1 = [[Desenha,Move D,MudaParede,Desenha,Move D,Move D,MudaTetromino,Move D,Desenha,MudaParede,Move D,Move D,Desenha,MudaTetromino,Move D,Move D,Desenha,Move D,Move D,MudaParede,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Desenha,MudaParede,Move E,Move E,Desenha,Move E,Move E,MudaTetromino,Move E,Desenha,Move E,Move E,MudaParede,Desenha,Move E,Move E,Move E,MudaTetromino,Desenha,Move E,Move E,Move E,MudaParede,Desenha,Move C,Move C,Move C,MudaTetromino,Desenha,MudaParede,Desenha,Move E,Move E,MudaParede,Desenha,MudaTetromino,Move B,Move B,Move E],
            [Roda,Desenha,Move B,MudaParede,Desenha,MudaTetromino,Move D,Move D,Move D,Move D,Move D,Desenha,MudaParede,Move C,Move C,Desenha,MudaTetromino,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,MudaParede,Desenha,Move D,Move D,Move D,MudaTetromino,Move C,Move D,Desenha,Move B,Move B,MudaParede,Desenha,MudaTetromino,Move B,Move B,Move B,Desenha,MudaParede,Move E,Desenha,Move E,Move E,MudaTetromino,Desenha,MudaParede,Move E,Move E,Desenha,Move E,Move E,MudaTetromino,Move E,Desenha,Move E,Move E,MudaParede,Desenha,Move E,Move E,Move E,MudaTetromino,Desenha,Move C,MudaParede,Desenha],
            [Roda,Roda,Desenha,MudaParede,Move D,Desenha,Move D,Move D,MudaTetromino,Move D,Move C,Move D,Desenha,Move D,MudaParede,Move B,Desenha,Move D,MudaTetromino,Move D,Move D,Desenha,MudaParede,Move D,Move C,Desenha,Move D,Move D,MudaTetromino,Move D,Desenha,MudaParede,Move B,Move B,Desenha,MudaTetromino,Move B,Move B,Move B,Desenha,MudaParede,Move E,Move E,Desenha,Move E,Move E,Move E,MudaTetromino,Move B,Desenha,Move E,Move E,Move E,MudaParede,Desenha,Move E,Move E,Move E,MudaTetromino,Desenha,MudaParede,Move E,Move E,Desenha],
            [Roda,Roda,Roda,Desenha,MudaParede,Move B,Desenha,Move E,Move D,Move D,Move D,Move D,Move D,Move D,MudaTetromino,Desenha,MudaParede,Move C,Move D,Desenha,MudaTetromino,Move D,Move D,Move D,Move B,Move D,Desenha,MudaParede,Move D,Move D,Move E,Move B,Desenha,MudaTetromino,Move D,Move D,Move D,Move C,Move D,Desenha,MudaParede,Move B,Move B,Desenha,Move B,Move B,MudaTetromino,Move E,Desenha,Move E,Move E,MudaParede,Desenha,Move E,Move E,MudaTetromino,Move E,Desenha,Move E,Move E,MudaParede,Desenha,Move E,Move E,MudaTetromino,Desenha,Move E,Move E,MudaParede,Desenha,Move E,Move E,Roda,Move E,Move E,Desenha,Roda,Desenha,Roda,Desenha,Roda,Desenha],
            [Roda,Roda,Roda,Roda,Desenha,Move D,MudaParede,Desenha,Move D,Move D,MudaTetromino,Move D,Desenha,MudaParede,Move D,Move D,Desenha,MudaTetromino,Move D,Move D,Desenha,Move D,Move D,MudaParede,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Desenha,MudaParede,Move E,Move E,Desenha,Move E,Move E,MudaTetromino,Move E,Desenha,Move E,Move E,MudaParede,Desenha,Move E,Move E,Move E,MudaTetromino,Desenha,Move E,Move E,Move E,MudaParede,Desenha,Move C,Move C,Move C,MudaTetromino,Desenha,MudaParede,Desenha,Move E,Move E,MudaParede,Desenha,MudaTetromino,Move B,Move B,Move E]]



-- * Funções principais da Tarefa 1.

-- | Aplica uma 'Instrucao' num 'Editor'.
--
--    * 'Move' - move numa dada 'Direcao'.
--
--    * 'MudaTetromino' - seleciona a 'Peca' seguinte (usar a ordem léxica na estrutura de dados),
--       sem alterar os outros parâmetros.
--
--    * 'MudaParede' - muda o tipo de 'Parede'.
--
--    * 'Desenha' - altera o 'Mapa' para incluir o 'Tetromino' atual, sem alterar os outros parâmetros.
instrucao :: Instrucao -- ^ A 'Instrucao' a aplicar.
          -> Editor    -- ^ O 'Editor' anterior.
          -> Editor    -- ^ O 'Editor' resultante após aplicar a 'Instrucao'.
instrucao (Move z) (Editor (x,y) d t par m)  |z == D = (Editor (x,y+1) d t par m)
                                             |z == E = (Editor (x,y-1) d t par m)
                                             |z == C = (Editor (x-1,y) d t par m)
                                             |z == B = (Editor (x+1,y) d t par m)

instrucao Roda (Editor p d t par m) |d == C = (Editor p D t par m) 
                                    |d == D = (Editor p B t par m) 
                                    |d == B = (Editor p E t par m) 
                                    |d == E = (Editor p C t par m) 

instrucao MudaTetromino (Editor p d t par m) |t == I = (Editor p d J par m)
                                             |t == J = (Editor p d L par m)
                                             |t == L = (Editor p d O par m)
                                             |t == O = (Editor p d S par m)
                                             |t == S = (Editor p d T par m)
                                             |t == T = (Editor p d Z par m)
                                             |t == Z = (Editor p d I par m)


instrucao MudaParede (Editor p d t Destrutivel m) = (Editor p d t Indestrutivel m)
instrucao MudaParede (Editor p d t Indestrutivel m) = (Editor p d t Destrutivel m)

instrucao Desenha (Editor (x,y) d I par m) |d == C = (Editor (x,y) d I par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+3,y+1) (Bloco par) m )))))
                                           |d == D = (Editor (x,y) d I par (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+1,y+3) (Bloco par) m )))))
                                           |d == B = (Editor (x,y) d I par (atualizaPosicaoMatriz (x+0,y+2) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+2) (Bloco par) (atualizaPosicaoMatriz (x+3,y+2) (Bloco par) m )))))
                                           |d == E = (Editor (x,y) d I par (atualizaPosicaoMatriz (x+2,y+0) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+3) (Bloco par) m )))))

instrucao Desenha (Editor (x,y) d O par m) = (Editor (x,y) d O par (atualizaPosicaoMatriz (x+0,y+0) (Bloco par) (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) m )))))
                                                                                        
instrucao Desenha (Editor (x,y) d J par m) |d == C = (Editor (x,y) d J par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+0) (Bloco par) m )))))
                                           |d == D = (Editor (x,y) d J par (atualizaPosicaoMatriz (x+0,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) m )))))
                                           |d == B = (Editor (x,y) d J par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+0,y+2) (Bloco par) m )))))
                                           |d == E = (Editor (x,y) d J par (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+2) (Bloco par) m )))))

instrucao Desenha (Editor (x,y) d L par m) |d == C = (Editor (x,y) d L par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+2) (Bloco par) m )))))
                                           |d == D = (Editor (x,y) d L par (atualizaPosicaoMatriz (x+2,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) m )))))
                                           |d == B = (Editor (x,y) d L par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+0,y+0) (Bloco par) m )))))
                                           |d == E = (Editor (x,y) d L par (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+0,y+2) (Bloco par) m )))))

instrucao Desenha (Editor (x,y) d S par m) |d == C = (Editor (x,y) d S par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+0,y+2) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) m )))))
                                           |d == D = (Editor (x,y) d S par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+2) (Bloco par) m )))))
                                           |d == B = (Editor (x,y) d S par (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco  par) (atualizaPosicaoMatriz (x+2,y+0) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) m )))))
                                           |d == E = (Editor (x,y) d S par (atualizaPosicaoMatriz (x+0,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) m )))))

instrucao Desenha (Editor (x,y) d T par m) |d == C = (Editor (x,y) d T par (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) m )))))
                                           |d == D = (Editor (x,y) d T par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) m )))))
                                           |d == B = (Editor (x,y) d T par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) m )))))
                                           |d == E = (Editor (x,y) d T par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) m )))))

instrucao Desenha (Editor (x,y) d Z par m) |d == C = (Editor (x,y) d Z par (atualizaPosicaoMatriz (x+0,y+0) (Bloco par) (atualizaPosicaoMatriz (x+0,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) m )))))
                                           |d == D = (Editor (x,y) d Z par (atualizaPosicaoMatriz (x+0,y+2) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+2) (Bloco par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) m )))))
                                           |d == B = (Editor (x,y) d Z par (atualizaPosicaoMatriz (x+1,y+0) (Bloco par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco  par) (atualizaPosicaoMatriz (x+2,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+2) (Bloco par) m )))))
                                           |d == E = (Editor (x,y) d Z par (atualizaPosicaoMatriz (x+0,y+1) (Bloco par) (atualizaPosicaoMatriz (x+1,y+0) (Bloco  par) (atualizaPosicaoMatriz (x+1,y+1) (Bloco par) (atualizaPosicaoMatriz (x+2,y+0) (Bloco par) m )))))

-- | Aplica uma sequência de 'Instrucoes' num 'Editor'.
--
-- __NB:__ Deve chamar a função 'instrucao'.
instrucoes :: Instrucoes -- ^ As 'Instrucoes' a aplicar.
           -> Editor     -- ^ O 'Editor' anterior.
           -> Editor     -- ^ O 'Editor' resultante após aplicar as 'Instrucoes'.
instrucoes [] (Editor p d t par m) = (Editor p d t par m)

instrucoes (h:hs) (Editor p d t par m) = instrucoes hs (instrucao h (Editor p d t par m))

-- | Cria um 'Mapa' inicial com 'Parede's nas bordas e o resto vazio.
mapaInicial :: Dimensao -- ^ A 'Dimensao' do 'Mapa' a criar.
            -> Mapa     -- ^ O 'Mapa' resultante com a 'Dimensao' dada.
mapaInicial (0,n) = []
mapaInicial (m,0) = []
mapaInicial (1,n) = [replicate n (Bloco Indestrutivel)]
mapaInicial (m,n) = (replicate n (Bloco Indestrutivel)):(mymap (Bloco Indestrutivel) (map ((Bloco Indestrutivel):) (replicate (m-2) (replicate (n-2) (Vazia))))) ++[(replicate n (Bloco Indestrutivel))]
                where mymap _ [] = [] 
                      mymap x (y:ys) = (y++[x]):mymap x ys

-- | Cria um 'Editor' inicial.
--
-- __NB:__ Deve chamar as funções 'mapaInicial', 'dimensaoInicial', e 'posicaoInicial'.
editorInicial :: Instrucoes  -- ^ Uma sequência de 'Instrucoes' de forma a poder calcular a  'dimensaoInicial' e a 'posicaoInicial'.
              -> Editor      -- ^ O 'Editor' inicial, usando a 'Peca' 'I' 'Indestrutivel' voltada para 'C'.
editorInicial is = (Editor (posicaoInicial is) C I Indestrutivel (mapaInicial (dimensaoInicial is))) 

-- | Constrói um 'Mapa' dada uma sequência de 'Instrucoes'.
--
-- __NB:__ Deve chamar as funções 'Instrucoes' e 'editorInicial'.
constroi :: Instrucoes -- ^ Uma sequência de 'Instrucoes' dadas a um 'Editor' para construir um 'Mapa'.
         -> Mapa       -- ^ O 'Mapa' resultante.
constroi is = mapaEditor (instrucoes is (editorInicial is))