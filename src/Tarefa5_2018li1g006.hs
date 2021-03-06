-- | Este módulo define funções comuns da Tarefa 5 do trabalho prático.
module Tarefa5_2018li1g006 where

import LI11819
import Tarefa0_2018li1g006
import Tarefa1_2018li1g006
import Tarefa2_2018li1g006
import Tarefa3_2018li1g006
import Tarefa4_2018li1g006
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Juicy

-- | Função principal da Tarefa 5.
--
-- __NB:__ Esta Tarefa é completamente livre. Deve utilizar a biblioteca <http://hackage.haskell.org/package/gloss gloss> para animar o jogo, e reutilizar __de forma completa__ as funções das tarefas anteriores.

-- * Estado Jogo

estadoInicial :: Estado
estadoInicial = Estado (mapaInicial (15,15) [(Jogador (1,1) D 6 3 3)] [])

escolheEstado :: Event -> Estado -> [Estado] -> Estado
escolheEstado (EventKey (SpecialKey KeySpace) Down _ _) i (h:t) = mudaEstado i (h:t)
escolheEstado _ h t = h

mudaEstado :: Estado -> [Estado] -> Estado
mudaEstado h (x:i:xs) = if h == x then i
                                  else mudaEstado h ((i:xs) ++ [x])

desenhaEstado :: [Picture] -> [Picture] -> [Picture] -> Estado -> Picture
desenhaEstado [v,d,i] [j1,j2,j3,j4] [c1,c2,c3,c4,l1,l2,l3,l4,p1,p2,p3,p4] (Estado m js ds) = desenhaMapa m

desenhaMapa :: Mapa -> [Picture]-> Picture
desenhaMapa [] = []
desenhaMapa ((x:y):t) = undefined 
| (((x == Vazia)= v) || ((x == Bloco Destrutivel)= d) || ((x == Bloco Indestrutivel)= i) )
: (((y == Vazia)= v) || ((y == Bloco Destrutivel)= d) || ((y == Bloco Indestrutivel)= i) )
: desenhaMapa t
|otherwise desenhaMapa t

reageEvento :: Event -> Estado -> Estado
reageEvento (EventKey (SpecialKey KeyUp)    Down _ _) e = jogada 0 (Movimenta C) e
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) e = jogada 0 (Movimenta C) e
reageEvento (EventKey (SpecialKey KeyLeft)  Down _ _) e = jogada 0 (Movimenta C) e
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) e = jogada 0 (Movimenta C) e
reageEvento _ s = s -- ignora qualquer outro evento


reageTempo :: Float -> Estado -> Estado
reageTempo n e = undefined

-- * Estado Gloss

type EstadoGloss = (Estado,Picture)

estadoInicialGloss :: Picture -> EstadoGloss
estadoInicialGloss tank = (estadoInicial,tank)

desenhaEstadoGloos :: EstadoGloss -> Picture
desenhaEstadoGloos ((x,y),tank) = Translate x y tank

reageEventoGloss :: Event -> EstadoGloss -> EstadoGloss
reageEventoGloss ev (e,tank) = (reageEvento ev e,tank)

reageTempoGloss :: Float -> EstadoGloss -> EstadoGloss
reageTempoGloss t (e,tank) = (reageTempo t e,tank)

main :: IO ()
main = do 
	      v <- loadBMP "blocovaz.bmp"
          d <- loadBMP "blocodes.bmp"
          i <- loadBMP "blocoind.bmp"
          j1 <- loadBMP "tank1.bmp"
          j2 <- loadBMP "tank2.bmp"
          j3 <- loadBMP "tank3.bmp"
          j4 <- loadBMP "tank4.bmp"
          ch <- loadBMP "choque.bmp"
          l  <- loadBMP "laser.bmp"
          b  <- loadBMP "bala.bmp"
          play 
               dm                       -- janela onde irá correr o jogo
               (greyN 0.5)              -- côr do fundo da janela
               fr                       -- frame rate
               (estadoInicial tank)     -- estado inicial
               desenhaEstado            -- desenha o estado do jogo
               reageEvento              -- reage a um evento
               reageTempo               -- reage ao passar do tempo -}
fr :: Int
fr = 60

dm :: Display
dm = FullScreen