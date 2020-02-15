{-| 
   Module      : Tarefa6_2018li1g006
   Description : Implementação do bot.
   Copyright   : Luis Carlos da Costa Salazar Martins
                 João Miguel Pinheiro Machado

  = Introdução
    O objetivo deste tarefa é criar um bot que faça o papel dum jogador, que seja capaz de fazer as suas próprias decisões. Para esta Tarefa temos o objetivo de fazer com que o bot,
    consiga distinguir diversas situações de perigo e fazer com que reaja de maneira diferentes, dependendo da situação da perigo. Um dos desafios grandes desafios nesta Tarefa é 
    conseguir fazer com que o bot reaga a varias situações de perigo ao mesmo tempo, sendo por isso necessário ele ter uma maior prioridade para certos tipos de perigo.
    Caso este não esteja em perigo, simplesmente andará pelo mapa a tentar fazer pontos destruindo blocos ou atacando outros jogadores. 

  = Objetivo e estratégias.
    Para a realização desta tarefa tentamos dividir o bot em 4 partes, cada uma deles relacionada com o meio envolvente ao bot. Estas 4 partes são:

        * Ver se existe alguma bala de canhão que irá atingir o bot e, por consequente, tentar se desviar/destruir a bala.

        * Andar pelo mapa livremente e quando encontra um enimigo à sua frente, o __bot__ tenta disparar contra ele.

        * Ver se existe algum Bloco Destrutivel em alguma das direções e tentar destruir esses blocos com recurso ao laser ou ao canhão.

        * Ver se existe algum enimigo dentro da area do choque do meu jogador e , consequentemente, paraliza-lo e tentar destrui-lo.

    Para a parte de desviar/destruir a bala pensamos da seguinte forma: Se houver alguma bala a vir na direção do __bot__ e o eçe estiver a apontar para ela, o bot vai disparar o Canhão para destruir a bala,
    se não ele vai simplesmente se desviar para onde puder, verificando para todas as direções se há ou não uma parede, jogador e se , depois de se mover, fica seguro ou nao.
    Com a função 'matrixBalas' o bot vai vericar se alguma das balas de Canhão está a vir na direção ele, e dependendo da direção dessa bala vai-se desviar para um lugar diferente.
    O funcionamento da 'matrixBalas' assim como as auxiliares que a completam estão descritos na documentação mais detalhadamente.

    Para a 2ª parte, pensamos da seguinte forma: o bot ao andar verifica sempre se está a apontar para um enimgo e se este não está protegido por uma parede, caso tal ele dispara Lasers (enquanto os tiver)
    e Canhões. Caso não esteja a apontar para nenhum enimigo, ele anda pelo mapa verificando sempre se para todas as direções há ou não uma parede, jogador e se , depois de se mover, fica seguro ou nao, e,
    neste caso, não vai poder andar para trás a menos que não haja outra opção. Esta opção de não andar para trás foi criada com o objetivo de evitar que o bot, em certos mapas, anda-se sempre no mesmo sito
    para trás e para a frente, indefinidamente.
    O funcionamento da 'tryToKill' assim como as auxiliares que a completam estão descritos na documentação mais detalhadamente.

    Para a 3ª parte, ou seja de destruir os Blocos Destrutiveis, distinguimos 2 funções diferentes: uma função que verficia se há pares de blocos e outra que verifica se à pelo menos um
    bloco. A razão desta destinção é tentar poupar o maximo de lasers possiveis, pois se so houver 1 Bloco Destrutivel separado de todos os outros, não era rentavel gastar um laser que
    podiaria ser usado para destruir varios. Para isso foram criadas as funções 'blocosInSight' para verificar os blocos que estão aos pares e a função 'rightNextToMe' que verifica só os
    que estão mesmo à beira do jogador e tem pelo menos 1 Bloco Destrutivel. O funcionamento destas duas funções, tal como as suas auxiliares é explicado na documentação mais detalhadamente.

    Para a ultima parte, tinhamos como objetivo turnar o __bo__ um pouco mais @agressivo@ quando alguem entrava na área 3x3 à sua volta. Então fizemos com que ele usa-se o choque, se ja não o tinha ativo
    e fizemos tambem com que ele tenta-se atacar o enimigo mais agressivamente, procurando mesmo onde ele está, com recurso à função 'tryToKill2' que é uma variação mais "agressiva" da 'tryTokill', cujo
    seu funionamento é explicado na documentação.

    Concluido assim as funções auxiliares passamos à função principal 'bot'. Para criar as condições na ordem em que se apresentam, começamos por pensar no que era o mais importante o bot fazer, e chegamos
    à conclusão:

        * 1º Verifica se tem balas a ir na direção dele.

        * 2º Verifica se há pares de Blocos Destrutives

        * 3º Verifica se há pelo menos um Bloco Destrutivel ao seu lado.

        * 4º Verifica se há algum jogar demasiado perto

        * Caso tudo falhe, o bot vai simplesmente andar pelo mapa.

  === Resultado final da função 'bot'
    @
    bot j (Estado m js ds) |not(balasNaMinhaDirecao (js !! j) ds) && estouProtegido js m (js!!j) ds == False = matrixBalas js m (js !! j) ds
                           |blocosInSight m (js!!j) (whereAreBlocos m (js!!j)) = getThemFreePoints m (js!!j) ds js
                           |rightNextToMe m (js!!j) = disparaToBlocos2 (js!!j) (rightNextToMeWhere m (js !! j))
                           |toCloseL (js!!j) (filtraMortos js) = u2Close4Me m (js!!j) js ds
                           |otherwise = tryToKill m (js !! j) (quemFocar (js !! j) (tiraDaLista (js!!j) js)) ds js
    @


  = Conclusão
  Com a tarefa concluida e após alguns testes, conseguimos obter os resultados que estavamos à procura. O __bot__ é capaz de distinguir diferentes situações de perigo e é capaz de reagir de formas diferentes.
  O __bot__ o bot tambem consegue identificar situações que lhe são benéficas como por exemplo, ver onde estão blocos destrutiveis para ganhar pontos.
  Concluimos assim que o bot à capaz de fazer as suas próprias decisões, mas que ainda era possivel fazer com que ele fizesse coisas mais completas com um bocado mais de tempo. Apesar de tudo estamos 
  satisfeitos com os resultados que obtivemos.

-} 


module Tarefa6_2018li1g006 where

import LI11819
import Tarefa4_2018li1g006
import Tarefa3_2018li1g006
import Tarefa2_2018li1g006
import Tarefa1_2018li1g006
import Tarefa0_2018li1g006

-- * Funções principais da Tarefa 6.

-- | Define um ro'bot' capaz de jogar autonomamente o jogo.
bot :: Int          -- ^ O identificador do 'Jogador' associado ao ro'bot'.
    -> Estado       -- ^ O 'Estado' para o qual o ro'bot' deve tomar uma decisão.
    -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar pelo ro'bot'.
bot j (Estado m js ds) |not(balasNaMinhaDirecao (js !! j) ds) && estouProtegido js m (js!!j) ds == False = matrixBalas js m (js !! j) ds
                       |blocosInSight m (js!!j) (whereAreBlocos m (js!!j)) = getThemFreePoints m (js!!j) ds js
                       |rightNextToMe m (js!!j) = disparaToBlocos2 (js!!j) (rightNextToMeWhere m (js !! j))
                       |toCloseL (js!!j) (filtraMortos js) = u2Close4Me m (js!!j) js ds
                       |otherwise = tryToKill m (js !! j) (quemFocar (js !! j) (tiraDaLista (js!!j) js)) ds js

-- * Funções usadas para desviar uma bala.

{- |A função @matrixBalas@ testa se tem alguma bala de canhao a vir em direção do bot, e vais testar as seguintes condições para todas as balas:

          * Se tiver uma bala e vir na posição central do bot, ele tenta destruir a bala.
          
          * Se tiver uma bala e vir para uma das posições laterais do bot, ele simplesmente tenta deviar-se dela através da função 'whereToDodge'.
-}
matrixBalas :: [Jogador]     -- ^ A lista de todos os jogadores usada na função 'wheroToDodge'
            -> Mapa          -- ^ O mapa de atual do Jogo
            -> Jogador       -- ^ O meu Jogador
            -> [Disparo]     -- ^ A lista de todos os disparos em curso
            -> Maybe Jogada  -- ^ Uma possivel 'Jogada' a efetuar
matrixBalas js m j [] = Nothing
matrixBalas js mp (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) C ):t) |x<m && n == y && d == B = Just (Dispara Canhao)
                                                                              |balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) C) = whereToDodge (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) C):t)) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)
                                                                              |otherwise = matrixBalas js mp (Jogador (x,y) d v las choq) t

matrixBalas js mp (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) B ):t) |x>m && n == y && d == C = Just (Dispara Canhao)
                                                                              |balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) B) = whereToDodge (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) B):t)) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)
                                                                              |otherwise = matrixBalas js mp (Jogador (x,y) d v las choq) t 

matrixBalas js mp (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) E ):t) |y<n && m == x && d == D = Just (Dispara Canhao)
                                                                              |balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) E) = whereToDodge (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) E):t)) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)
                                                                              |otherwise = matrixBalas js mp (Jogador (x,y) d v las choq) t

matrixBalas js mp (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) D ):t) |y>n && m == x && d == E = Just (Dispara Canhao)
                                                                              |balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) D) = whereToDodge (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) D):t)) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)
                                                                              |otherwise = matrixBalas js mp (Jogador (x,y) d v las choq) t
matrixBalas js mp j (h:t) = matrixBalas js mp j t


{- |A função @balaNaMinhaDirecao@ verfica se há alguma bala de canhão a vir para a minha direção e que acabe por antingir o bot.
    Caso uma bala vá atingir o bot o output é True

  == Exemplo de utilização
  >>> balaNaMinhaDirecao (Jogador (5,1) C 5 2 2) (DisparoCanhao 1 (1,1) B)
  True
-}
balaNaMinhaDirecao :: Jogador -- ^ O meu bot
                   -> Disparo -- ^ A bala de canhao a testar
                   -> Bool    -- ^ True caso a bala atinja o bot, False caso contrário
balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) C) |x<m && (n==y ||n==y+1||n==y-1) = True
                                                                          |otherwise = False
balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) D) |y>n && (m==x ||m==x+1||m==x-1) = True
                                                                          |otherwise = False
balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) B) |x>m && (n==y ||n==y+1||n==y-1) = True
                                                                          |otherwise = False
balaNaMinhaDirecao (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) E) |y<n && (m==x ||m==x+1||m==x-1) = True
                                                                          |otherwise = False


{- |A função @balasNaMinhaDirecao@ verifica se tem alguma bala ou laser a vir na minha direção.
    Esta função é usada posteriormente em 'balaNaPosicao' para verificar se é seguror mover numda dada direção.
    Esta função funcionda de modo identico à 'balaNaMinhaDirecao'.
-}
balasNaMinhaDirecao :: Jogador   -- ^ O meu bot
                    -> [Disparo] -- ^ A lista de todos os disparos em curso
                    -> Bool      -- ^ True caso o não haja balas na minha direção, False caso contrário.
balasNaMinhaDirecao (Jogador (x,y) d v las choq) [] = True
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) C):t) |x<m && (n==y ||n==y+1||n==y-1) = False
                                                                               |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) D):t) |y>n && (m==x ||m==x+1||m==x-1) = False
                                                                               |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) B):t) |x>m && (n==y ||n==y+1||n==y-1) = False
                                                                               |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoCanhao j (m,n) E):t) |y<n && (m==x ||m==x+1||m==x-1) = False
                                                                               |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoLaser j (m,n) C):t) |x<m && (n==y ||n==y+1||n==y-1) = False
                                                                              |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoLaser j (m,n) D):t) |y>n && (m==x ||m==x+1||m==x-1) = False
                                                                              |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoLaser j (m,n) B):t) |x>m && (n==y ||n==y+1||n==y-1) = False
                                                                              |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao (Jogador (x,y) d v las choq) ((DisparoLaser j (m,n) E):t) |y<n && (m==x ||m==x+1||m==x-1) = False
                                                                              |otherwise = balasNaMinhaDirecao (Jogador (x,y) d v las choq) t
balasNaMinhaDirecao k (h:t) = balasNaMinhaDirecao k t


{-|A função @whereToDodge@ funciona em conjunto com a função 'tryToRun' recebe 3 listas de __Bool__ com 4 elementos cada, onde cada elemento representa uma __direção__.
   O 1º elemento corresponde para __Cima__, o 2º __Direita__, o 3º __Baixo__, e o 4º __Esquerd__a, sendo que __True__ é possivel/seguro mover numa direção.
   Após receber estas 3 listas de Bool, e usando uma auxiliar, criar uma lista resultante de atribuir um nº (1->C,2->D...) quando os elementos do mesmo indice são todos True.
   Caso a lista seja Vazia passa-se para o uso da 'tryToRun'. Caso não seja vazia, o bot vai-se mover de acordo com o primeiro elemento da lista criada.
   Nesta função, a primeira lista representa a função 'naoTemParede', a segunda 'balaNaPosicao' e a terceira 'jogadorNaPosicao'. 

   == Exemplo de utilização:
   >>> whereToDodge [True,True,True,True] [False,True,True,True] [True,True,False,True]
   Just (Movimenta D)
-}
whereToDodge :: [Bool]        -- ^ Lista gerada por 'naoTemParede'
             -> [Bool]        -- ^ Lista gerada por 'balaNaPosicao'
             -> [Bool]        -- ^ Lista gerada por 'jogadorNaPosicao'
             -> Maybe Jogada  -- ^ Uma possivel 'Jogada' a efetuar.
whereToDodge [False,False,False,False] _ _ = Nothing
whereToDodge _ _ [False,False,False,False] = Nothing
whereToDodge [True,True,True,False] [False,False,False,True] _ = Just (Movimenta D)
whereToDodge [True,False,True,True] [False,True,False,False] _ = Just (Movimenta E)
whereToDodge h t s |comparaLista h t s == [] = tryToRun h s 
                   |head (comparaLista h t s) == 1 = Just (Movimenta C)
                   |head (comparaLista h t s) == 2 = Just (Movimenta D)
                   |head (comparaLista h t s) == 3 = Just (Movimenta B)
                   |head (comparaLista h t s) == 4 = Just (Movimenta E)
                   where comparaLista h t s = aux 1 h t s
                         aux n [] [] [] = []
                         aux n (h:t) (x:y) (z:w) |n<5 && h == x && x == z = n:aux (n+1) t y w
                                                 |n<5 && (h/= x || h/= z || x/=z) = aux (n+1) t y w
                                                 |otherwise = []


{- |A função @tryToRun@ funciona de modo identico à função 'whereToDogde', mas é o caso em que a segunda lista seja toda __False__.
    Logo, nesta função, a primeira lista representa a função 'naoTemParede', a segunda 'jogadorNaPosicao'.

    == Exemplo de utilização:
    >>> tryToRun [True,True,False,False] [False,True,True,False]
    Just (Movimenta D)
-}
tryToRun :: [Bool]        -- ^ Lista gerada por 'naoTemParede'
         -> [Bool]        -- ^ Lista gerada por 'jogadorNaPosicao'
         -> Maybe Jogada  -- ^ Uma possivel 'Jogada' a efetuar.
tryToRun h s |head (comparaLista h s) == 1 = Just (Movimenta C)
             |head (comparaLista h s) == 2 = Just (Movimenta D)
             |head (comparaLista h s) == 3 = Just (Movimenta B)
             |head (comparaLista h s) == 4 = Just (Movimenta E)
              where comparaLista h s = aux 1 h s
                    aux n (h:t) (x:y) |n<5 && h == x = n:aux (n+1) t y
                                      |otherwise = aux (n+1) t  y


{- |A função @naoTemParede@ cria um lista de __Bool__ com 4 elementos, dependendo de haver ou não um Bloco Indestrestrutivel/Destrutivel ao lado do __bot__.
    O 1º elemento corresponde para __Cima__, o 2º __Direita__, o 3º __Baixo__, e o 4º __Esquerda__, sendo que __True__ é possivel mover numa direção ser ir contra uma parede.

    == Exemplo de utilização:
    >>> naoTemParede (mapaInicial (5,5)) (Jogador (1,1) D 4 2 2)
    [False,True,True,False]
-}
naoTemParede :: Mapa    -- ^ Mapa atual do Jogo.
             -> Jogador -- ^ O meu bot.
             -> [Bool]  -- ^ Lista de bool de 4 elementos, onde True equivale a ser possivel mover nessa direção ([C,D,B,E]).
naoTemParede m (Jogador (x,y) d v las choq) = [(encontraPosicaoMatriz (x-1,y) m == Vazia && encontraPosicaoMatriz (x-1,y+1) m == Vazia),(encontraPosicaoMatriz (x,y+2) m == Vazia && encontraPosicaoMatriz (x+1,y+2) m == Vazia),(encontraPosicaoMatriz (x+2,y) m == Vazia && encontraPosicaoMatriz (x+2,y+1) m == Vazia),(encontraPosicaoMatriz (x,y-1) m == Vazia && encontraPosicaoMatriz (x+1,y-1) m == Vazia)]


{- |A função @balaNaPosicao@ cria um lista de __Bool__ com 4 elementos, dependendo de haver ou não uma bala 2 casas adjacentes ao __bot__ em cada direção.
    O 1º elemento corresponde para __Cima__, o 2º __Direita__, o 3º __Baixo__, e o 4º __Esquerda__, sendo que __True__ é possivel mover numa direção sem ser atingido.

    == Exemplo de utilização:
    >>> balaNaPosicao (Jogador (1,1) D 4 2 2) [(DisparoCanhao 1 (1,5) E)]
    [True,False,True,False]
-}
balaNaPosicao :: Jogador   -- ^ O meu bot.
              -> [Disparo] -- ^ A lista de todos os disparos em curso.
              -> [Bool]    -- ^ Lista de bool de 4 elementos, onde True equivale a ser possivel mover nessa direção ([C,D,B,E]).
balaNaPosicao (Jogador (x,y) d v las choq) ds = map (`balasNaMinhaDirecao` ds) [(Jogador (x-2,y) d v las choq),(Jogador (x,y+2) d v las choq),(Jogador (x+2,y) d v las choq),(Jogador (x,y-2) d v las choq)]


{- |A função @jogadorNaPosicao@ cria um lista de __Bool__ com 4 elementos, dependendo de haver ou não um jogador adjacentes ao __bot__ em cada direção.
    O 1º elemento corresponde para __Cima__, o 2º __Direita__, o 3º __Baixo__, e o 4º __Esquerda__, sendo que __True__ é possivel mover numa direção sem ir contra outro Jogador.

    == Exemplo de utilização:
    >>> jogadorNaPosicao (Jogador (1,1) D 4 2 2) [(Jogador (1,1) D 4 2 2),(Jogador (1,3) D 4 2 2),(Jogador (4,1) D 4 2 2)]
    [True,False,True,True]
-}
jogadorNaPosicao :: Jogador   -- ^ O meu bot.
                 -> [Jogador] -- ^ A lista de todos os Jogadores.
                 -> [Bool]    -- ^ Lista de bool de 4 elementos, onde True equivale a ser possivel mover nessa direção ([C,D,B,E]).
jogadorNaPosicao (Jogador (x,y) d v las choq) js = [not(verificaJogadores (Jogador (x,y) d v las choq) C js),not(verificaJogadores (Jogador (x,y) d v las choq) D js),not(verificaJogadores (Jogador (x,y) d v las choq) B js),not(verificaJogadores (Jogador (x,y) d v las choq) E js)]


{- |A função @estouProtegido@ funtamente com a função 'acerta' vai verficiar se o jogador está protegido por alguma parede ou noutro Jogador, ou seja,
    caso a bala vá na sua direção ele não é atingido porque tem uma parede a proteger.

    == Exemplo de utilização
    >>> estouProtegido [] (constroi [Roda,Move B,Desenha]) (Jogador (4,1) D 5 2 2) [(DisparoCanhao 1 (1,1) B)]
    True
-}
estouProtegido :: [Jogador]  -- ^ A lista de todos os jogadores.
               -> Mapa      -- ^ O mapa atual de Jogo.
               -> Jogador   -- ^ O meu Bot.
               -> [Disparo] -- ^ A lista de Disparos em curso.
               -> Bool      -- ^ True se o meu bot está protegido por parede ou outro Jogador.
estouProtegido js mp jd [] = True
estouProtegido js mp jd ((DisparoCanhao j (x,y) C):t) |acerta js mp jd (DisparoCanhao j (x,y) C) = False
                                                      |otherwise = estouProtegido js mp jd t
estouProtegido js mp jd ((DisparoCanhao j (x,y) D):t) |acerta js mp jd (DisparoCanhao j (x,y) D) = False
                                                      |otherwise = estouProtegido js mp jd t
estouProtegido js mp jd ((DisparoCanhao j (x,y) B):t) |acerta js mp jd (DisparoCanhao j (x,y) B) = False
                                                      |otherwise = estouProtegido js mp jd t
estouProtegido js mp jd ((DisparoCanhao j (x,y) E):t) |acerta js mp jd (DisparoCanhao j (x,y) E) = False
                                                      |otherwise = estouProtegido js mp jd t
estouProtegido js mp jd (h:t) = estouProtegido js mp jd t


{- |A função @acerta@ verifica se uma bala acerta ou nao no Bot com auxilio das funções 'posicaoFinal', 'listaDePosicoes' e 'verOndePara'.
-}
acerta :: [Jogador] -- ^ A lista de todos os jogadores.
       -> Mapa      -- ^ O mapa atual de Jogo.
       -> Jogador   -- ^ O meu Bot.
       -> Disparo   -- ^ O disparo a comparar.
       -> Bool      -- ^ True se o meu bot é atingido por uma bala ou laser.
acerta js mp (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) C) = posicaoFinal mp js (DisparoCanhao j (m,n) C) == (x+1,y) || posicaoFinal mp js (DisparoCanhao j (m,n) C) == (x+1,y-1) || posicaoFinal mp js (DisparoCanhao j (m,n) C) == (x+1,y+1)
acerta js mp (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) D) = posicaoFinal mp js (DisparoCanhao j (m,n) D) == (x,y-1) || posicaoFinal mp js (DisparoCanhao j (m,n) D) == (x+1,y-1) || posicaoFinal mp js (DisparoCanhao j (m,n) D) == (x-1,y-1)
acerta js mp (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) B) = posicaoFinal mp js (DisparoCanhao j (m,n) B) == (x-1,y) || posicaoFinal mp js (DisparoCanhao j (m,n) B) == (x-1,y-1) || posicaoFinal mp js (DisparoCanhao j (m,n) B) == (x-1,y+1)
acerta js mp (Jogador (x,y) d v las choq) (DisparoCanhao j (m,n) E) = posicaoFinal mp js (DisparoCanhao j (m,n) E) == (x,y+1) || posicaoFinal mp js (DisparoCanhao j (m,n) E) == (x+1,y+1) || posicaoFinal mp js (DisparoCanhao j (m,n) E) == (x-1,y+1)
acerta js mp (Jogador (x,y) d v las choq) (DisparoLaser j (m,n) dr) = let a = listaDePosicoes (m,n) (verOndePara mp (DisparoLaser j (m,n) dr))
                                                                      in elem (x,y) a ||elem (x,y+1) a||elem (x,y-1) a||elem (x+1,y) a||elem (x+1,y+1) a||elem (x+1,y-1) a||elem (x-1,y) a ||elem (x-1,y+1) a||elem (x-1,y-1) a


{- |A função @posicaoFinal@ verifica qual é a posição final de uma bala. É usada para ver se uma bala atinge ou nao o bot.
-}
posicaoFinal :: Mapa      -- ^ O mapa atual de Jogo.
             -> [Jogador] -- ^ A lista de todos os Jogadores.
             -> Disparo   -- ^ O disparo do qual vai ser retirada a posicao final.
             -> Posicao   -- ^ A posicao final da bala.
posicaoFinal mp js (DisparoCanhao j (x,y) C) |encontraPosicaoMatriz (x,y) mp == Vazia && encontraPosicaoMatriz (x,y+1) mp == Vazia && verJogador (DisparoCanhao j (x,y) C) js = posicaoFinal mp js (DisparoCanhao j (x-1,y) C)
                                             |otherwise = (x,y)
posicaoFinal mp js (DisparoCanhao j (x,y) D) |encontraPosicaoMatriz (x,y+1) mp == Vazia && encontraPosicaoMatriz (x+1,y+1) mp == Vazia && verJogador (DisparoCanhao j (x,y) D) js  = posicaoFinal mp js (DisparoCanhao j (x,y+1) D)
                                             |otherwise = (x,y)
posicaoFinal mp js (DisparoCanhao j (x,y) B) |encontraPosicaoMatriz (x+1,y) mp == Vazia && encontraPosicaoMatriz (x+1,y+1) mp == Vazia && verJogador (DisparoCanhao j (x,y) B) js = posicaoFinal mp js (DisparoCanhao j (x+1,y) B)
                                             |otherwise = (x,y)
posicaoFinal mp js (DisparoCanhao j (x,y) E) |encontraPosicaoMatriz (x,y) mp == Vazia && encontraPosicaoMatriz (x+1,y) mp == Vazia && verJogador (DisparoCanhao j (x,y) E) js  = posicaoFinal mp js (DisparoCanhao j (x,y-1) E)
                                             |otherwise = (x,y)



-- * Funçoes relaciondas com o movimento pelo mapa e o ataque a outros jogadores


{- |A função @tryToKill@ é a função principal deste secção. O objetivo desta função é verificar se existe algum enimigo para onde o meu bot está a apontar, e se for o caso,
    ele vai disparar laser (enquanto estiverem disponiveis) e balas para os atingir.
    Esta função usa como auxiliares as funções 'alinhado' , 'inSight' e 'apontar' e caso o enimigo não esteja visivel/vivo o bot simplesmente andará pelo mapa com recurso à função 'justMove'

-}
tryToKill :: Mapa         -- ^ O Mapa atual do jogo
          -> Jogador      -- ^ O meu jogador
          -> Jogador      -- ^ O jogador a focar
          -> [Disparo]    -- ^ A lista de todos os disparor
          -> [Jogador]    -- ^ A lista de todos os jogadores
          -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar
tryToKill mp j1@(Jogador (x,y) d v las choq) j2@(Jogador (m,n) d' v' las' choq') ds js |v'/=0 && las>0 && alinhado j1 j2 && inSight mp j1 j2 && apontar j1 j2 = Just (Dispara Laser)
                                                                                       |v'/=0 && alinhado j1 j2 && inSight mp j1 j2 && apontar j1 j2 = Just (Dispara Canhao)
                                                                                       |v'/=0 && alinhado j1 j2 && inSight mp j1 j2 && apontar j1 j2 == False = alinha j1 j2
                                                                                       |v'/= 0 && inSight mp j1 j2 == False = justMove j1 (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ds) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)
                                                                                       |otherwise = justMove j1 (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ds) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)


{- |A função @alinhado@ verifica o bot está ou nao alinhado com outro Jogador, ou seja, se o bot disparar o disparo tem de chegar ao inimigo, contando que este fique parado.
    
    == Exemplo de utilização:
    >>> alinhado (Jogador (1,1) D 5 2 2) (Jogador (5,2) B 2 3 1)
    True
-}
alinhado :: Jogador  -- ^ O meu bot.
         -> Jogador  -- ^ O enimigo que o bot está a focar.
         -> Bool     -- ^ True se o bot está linhado com o enimigo.
alinhado j1@(Jogador (x,y) d v las choq) j2@(Jogador (m,n) d' v' las' choq') |x<m && (n==y-1 || n==y || n == y+1) = True
                                                                             |x>m && (n==y-1 || n==y || n == y+1) = True
                                                                             |n<y && (m==x-1 || m==x || m == x+1) = True
                                                                             |n>y && (m==x-1 || m==x || m == x+1) = True
                                                                             |otherwise = False


{- |A função @apontar@, verifica se o __bot__ está virado para o lado certo, ou seja, se está virado para o inimigo.
      
      == Exemplo de utilização
      >>> apontar (Jogador (1,1) C 5 2 2) (Jogador (5,2) B 2 3 1)
      False
-}
apontar :: Jogador  -- ^ O meu bot.
        -> Jogador  -- ^ O enimigo que o bot está a focar.
        -> Bool     -- ^ True se o bot está a apontar para o enimigo.
apontar j1@(Jogador (x,y) d v las choq) j2@(Jogador (m,n) d' v' las' choq') |alinhado j1 j2 && x<m && d == B = True
                                                                            |alinhado j1 j2 && x>m && d == C = True
                                                                            |alinhado j1 j2 && y<n && d == D = True
                                                                            |alinhado j1 j2 && y>n && d == E = True
                                                                            |otherwise = False


-- |A função @alinha@ apenas faz com que o bot aponte para o inimigo
alinha :: Jogador       -- ^ O meu bot.
       -> Jogador       -- ^ O enimigo que o bot está a focar.
       -> Maybe Jogada  -- ^ Uma possível 'Jogada' a efetuar.
alinha j1@(Jogador (x,y) d v las choq) j2@(Jogador (m,n) d' v' las' choq') |x<m = Just (Movimenta B)
                                                                           |x>m = Just (Movimenta C)
                                                                           |y<n = Just (Movimenta D)
                                                                           |y>n = Just (Movimenta E)
                                                                           |otherwise = Nothing


{- |A função inSight vai verificar se, quando o jogador disparar, a bala chega ao inimigo sem bater numa parede e se a bala defacto chega a um inimgo.
-}
inSight :: Mapa     -- ^ O mapa atual do jogo.
        -> Jogador  -- ^ O meu bot.
        -> Jogador  -- ^ O enimigo que o bot está a focar.
        -> Bool     -- ^ True se o bot está a apontar para o enimigo e a bala chega até ele.
inSight mp j1@(Jogador (x,y) C v las choq) j2@(Jogador (m,n) d' v' las' choq') |x == m && (n==y-1||n==y||n==y+1) = True
                                                                               |encontraPosicaoMatriz (x,y) mp == Vazia && encontraPosicaoMatriz (x,y+1) mp == Vazia = inSight mp (Jogador (x-1,y) C v las choq) j2 
                                                                               |otherwise = False
inSight mp j1@(Jogador (x,y) D v las choq) j2@(Jogador (m,n) d' v' las' choq') |y == n && (m==x-1||m==x||m==x+1) = True
                                                                               |encontraPosicaoMatriz (x,y+1) mp == Vazia && encontraPosicaoMatriz (x+1,y+1) mp == Vazia = inSight mp (Jogador (x,y+1) D v las choq) j2 
                                                                               |otherwise = False
inSight mp j1@(Jogador (x,y) B v las choq) j2@(Jogador (m,n) d' v' las' choq') |x == m && (n==y-1||n==y||n==y+1) = True
                                                                               |encontraPosicaoMatriz (x+1,y) mp == Vazia && encontraPosicaoMatriz (x+1,y+1) mp == Vazia = inSight mp (Jogador (x+1,y) B v las choq) j2 
                                                                               |otherwise = False
inSight mp j1@(Jogador (x,y) E v las choq) j2@(Jogador (m,n) d' v' las' choq') |y == n && (n==x-1||m==x||m==x+1) = True
                                                                               |encontraPosicaoMatriz (x,y) mp == Vazia && encontraPosicaoMatriz (x+1,y) mp == Vazia = inSight mp (Jogador (x,y-1) E v las choq) j2 
                                                                               |otherwise = False


{- |A função @justMove@ é uma variação da função 'whereToDodge', a unica diferença reside na função auxiliar 'tryToRuns' e também tem um argumento a mais.
    A diferença entre esta função e a 'whereToDogde' é que esta função nao permite ao bot andar para trás, a menos que estritamente necessário, ou seja,
    se o bot estiver virado para cima, ele não pode ir para baixo, exceto se for a unica opção de movimento.
     
     == Exemplo de utilização:
     >>> justMove (Jogador (2,2) B 5 2 2) [True,False,True,True] [False,True,True,True] [True,True,False,True]
     Just (Movimenta E)
-}
justMove :: Jogador       -- ^ O meu bot.
         -> [Bool]        -- ^ Lista gerada por 'naoTemParede'.
         -> [Bool]        -- ^ Lista gerada por 'balaNaPosicao'.
         -> [Bool]        -- ^ Lista gerada por 'jogadorNaPosicao'.
         -> Maybe Jogada  -- ^ Uma possivel 'Jogada' a efetuar.
justMove js [False,False,False,False] _ _ = Nothing
justMove js _ _ [False,False,False,False] = Nothing
justMove js h t s |comparaLista h t s == [] = tryToRuns js h s
                  |otherwise = whereToGo js (comparaLista h t s)
                   where comparaLista h t s = aux 1 h t s
                         aux n [] [] [] = []
                         aux n (h:t) (x:y) (z:w) |n<5 && h == x && x == z = n:aux (n+1) t y w
                                                 |n<5 && (h/= x || h/= z || x/=z) = aux (n+1) t y w
                                                 |otherwise = []


-- |A função @tryToRuns@ funciona de modo identico à função 'justMove', mas é o caso em que a segunda lista seja toda __False__.
tryToRuns :: Jogador       -- ^ O meu bot.
          -> [Bool]        -- ^ Lista gerada por 'naoTemParede'.
          -> [Bool]        -- ^ Lista gerada por 'jogadorNaPosicao'.
          -> Maybe Jogada  -- ^ Uma possivel 'Jogada' a efetuar.
tryToRuns js h s = whereToGo js (comparaLista h s)
               where comparaLista h s = aux 1 h s
                     aux n (h:t) (x:y) |n<5 && h == x = n:aux (n+1) t y
                                       |otherwise = aux (n+1) t  y      
                     aux n _ _ = []


{- |A função @whereToGo@ é a  função que não permite ao bot andar para trás a menos que seja extritamente necessário.
    Recebe um jogador e uma lista de int que corresponde às possibilidades de movimento. O 1 é para __Cima__ , o 2 é para a __Direita__ , o 3 é para __Baixo__ e o 4 é para a __Esquerda__.
   
   == Exemplo da utilização
   >>> whereToGo (Jogador (1,1) C 5 2 2) [3]
   Just (Movimenta B) 
   
   >>> whereToGo (Jogador (1,1) C 5 2 2) [3,4]
   Just (Movimenta E)
-}
whereToGo :: Jogador      -- ^ O meu bot.
          -> [Int]        -- ^ Uma lista que corresponde às possibilidades de movimento.
          -> Maybe Jogada -- ^ Uma possivel 'Jogada' a efetuar.
whereToGo js (h:t) = let a = aux js (h:t)
                     in move js a 
                      where aux j [] = []
                            aux j [a] = [a]
                            aux j@(Jogador p C v las choq) (h:t) |h == 3 = aux j t
                                                                 |otherwise = h:aux j t
                            aux j@(Jogador p D v las choq) (h:t) |h == 4 = aux j t
                                                                 |otherwise = h:aux j t
                            aux j@(Jogador p B v las choq) (h:t) |h == 1 = aux j t
                                                                 |otherwise = h:aux j t
                            aux j@(Jogador p E v las choq) (h:t) |h == 2 = aux j t
                                                                 |otherwise = h:aux j t
                            move j@(Jogador x d v las choq) h = case d of
                                C -> if elem 1 h then Just (Movimenta C) else mover h
                                D -> if elem 2 h then Just (Movimenta D) else mover h
                                B -> if elem 3 h then Just (Movimenta B) else mover h
                                E -> if elem 4 h then Just (Movimenta E) else mover h
                            mover  h |head h == 1 = Just (Movimenta C)
                                     |head h == 2 = Just (Movimenta D)
                                     |head h == 3 = Just (Movimenta B)
                                     |head h == 4 = Just (Movimenta E)


-- |O objetivo desta função é apenas, da lista de jogadores, escolher o que está mais perto do bot.
quemFocar :: Jogador   -- ^ O meu Bot.
          -> [Jogador] -- ^ A lista de todos os jogadores.
          -> Jogador   -- ^ O jogador que o bot vai focar.
quemFocar j [h] = h
quemFocar j1@(Jogador (x,y) d v las choq) ((Jogador (m,n) d1 v1 las1 choq1):(Jogador (m1,n1) d2 v2 las2 choq2):t) |v1 == 0 = quemFocar j1 ((Jogador (m1,n1) d2 v2 las2 choq2):t)
                                                                                                                  |(abs(m-x) + abs (n-y)) < (abs(x-m1) + abs(y-n1)) = quemFocar j1 ((Jogador (m,n) d1 v1 las1 choq1):t)
                                                                                                                  |otherwise = quemFocar j1 ((Jogador (m1,n1) d2 v2 las2 choq2):t)

-- |Serve apenas para retirar o bot da lista de Jogadores.
tiraDaLista :: Jogador -> [Jogador] -> [Jogador]
tiraDaLista j (h:t) = if j == h then t else h:tiraDaLista j t

 
-- * Funções relacionadas com a destruicão de Blocos Destrutiveis.

{- |A função @getThemFreePoints@, juntamente com as suas auxiliares, vai verifica se para alguma das dirções existe Blocos Indestrutives, mas so no caso de estes virem aos pares.
    Caso aconteça isso, o jogador vai destrui-los com recurso ao canhao ou ao laser, se não houver blocos o __bot__ vai andar pelo mapa com recurso à função 'justMove'.
-}
getThemFreePoints :: Mapa -> Jogador -> [Disparo] -> [Jogador] -> Maybe Jogada
getThemFreePoints mp j@(Jogador (x,y) d v las choq) ds js |blocosInSight mp j (whereAreBlocos mp j) = disparaToBlocos j (whereAreBlocos mp j)
                                                          |otherwise = justMove j (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ds) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)


-- |Esta função apenas verifica se há blocos em alguma das direções em relação ao bot.
blocosInSight :: Mapa -> Jogador -> [Bool] -> Bool
blocosInSight m j [False,False,False,False] = False
blocosInSight m j _ = True


{- |A função @whereAreBlocos@ verifica se há pares de Blocos Destrutiveis para cada um dos lados do bot, e criar uma lista de __Bool__ que contem a informação de onde estão os Blocos Destrutiveis.
    Na lista criada, o 1º elemento corresponde para __Cima__, o 2º __Direita__, o 3º __Baixo__, e o 4º __Esquerd__a, sendo que __True__ corresponde a existir pares de bloco numa determinada direção.
    
    == Exemplo na utilização:
    >>> whereAreBlocos (constroi [Roda,Move B,MudaParede,Desenha]) (Jogador (4,1) D 5 2 2)    
    [True,False,False,False]
-}  
whereAreBlocos :: Mapa    -- ^ O mapa atual de jogo.
               -> Jogador -- ^ O meu bot.
               -> [Bool]  -- ^ A lista que indica onde estão os blocos destrutiveis.
whereAreBlocos mp j@(Jogador (x,y) d v las choq) = map (naDirecao j) [C,D,B,E]
                                                 where naDirecao (Jogador (x,y) d v las choq) C |(encontraPosicaoMatriz (x-1,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp == Bloco Destrutivel) = True
                                                                                                |(encontraPosicaoMatriz (x-1,y) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x-1,y) mp == Vazia) && (encontraPosicaoMatriz (x-1,y+1) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x-1,y) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp == Vazia) = False
                                                                                                |otherwise = naDirecao (Jogador (x-1,y) d v las choq) C
                                                       naDirecao (Jogador (x,y) d v las choq) D |(encontraPosicaoMatriz (x,y+2) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp == Bloco Destrutivel) = True
                                                                                                |(encontraPosicaoMatriz (x,y+2) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x,y+2) mp == Vazia) && (encontraPosicaoMatriz (x+1,y+2) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x,y+2) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp == Vazia) = False
                                                                                                |otherwise = naDirecao (Jogador (x,y+1) d v las choq) D
                                                       naDirecao (Jogador (x,y) d v las choq) B |(encontraPosicaoMatriz (x+2,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp == Bloco Destrutivel) = True
                                                                                                |(encontraPosicaoMatriz (x+2,y) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x+2,y) mp == Vazia) && (encontraPosicaoMatriz (x+2,y+1) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x+2,y) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp == Vazia) = False
                                                                                                |otherwise = naDirecao (Jogador (x+1,y) d v las choq) B
                                                       naDirecao (Jogador (x,y) d v las choq) E |(encontraPosicaoMatriz (x,y-1) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp == Bloco Destrutivel) = True
                                                                                                |(encontraPosicaoMatriz (x,y-1) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x,y-1) mp == Vazia) && (encontraPosicaoMatriz (x+1,y-1) mp == Bloco Indestrutivel) = False
                                                                                                |(encontraPosicaoMatriz (x,y-1) mp == Bloco Indestrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp == Vazia) = False
                                                                                                |otherwise = naDirecao (Jogador (x,y-1) d v las choq) E


-- |A função @disparaToBlocos@ faz com que o bot dispare laser ou balas quando os blocos destrutiveis não estao colados ao bot, ou seja, quando há pelo menos um espaço vazio entre o bot e os blocos destrutiveis
disparaToBlocos :: Jogador -> [Bool] -> Maybe Jogada
disparaToBlocos j@(Jogador (x,y) dr v las choq) [a,b,c,d] |las > 0 && a == True && dr==C = Just (Dispara Laser)
                                                          |a == True && dr==C = Just (Dispara Canhao)
                                                          |a == True && dr/=C = Just (Movimenta C)
                                                          |las > 0 && b == True && dr==D = Just (Dispara Laser) 
                                                          |b == True && dr==D = Just (Dispara Canhao)
                                                          |b == True && dr/=D = Just (Movimenta D)
                                                          |las > 0 && c == True && dr==B = Just (Dispara Laser)
                                                          |c == True && dr==B = Just (Dispara Canhao)
                                                          |c == True && dr/=B = Just (Movimenta B)
                                                          |las > 0 && d == True && dr==E = Just (Dispara Laser)
                                                          |d == True && dr==E = Just (Dispara Canhao)
                                                          |d == True && dr/=E = Just (Movimenta E)
                                                          |otherwise = Nothing


-- |A função @disparaToBlocos2@ faz com que o __bot__ dispare apenas balas quando os blocos estão adjacentes a si, não gastando assim lasers.
disparaToBlocos2 :: Jogador -> [Bool] -> Maybe Jogada
disparaToBlocos2 j@(Jogador (x,y) dr v las choq) [a,b,c,d] |a == True && dr==C = Just (Dispara Canhao)
                                                           |a == True && dr/=C = Just (Movimenta C)
                                                           |b == True && dr==D = Just (Dispara Canhao)
                                                           |b == True && dr/=D = Just (Movimenta D)
                                                           |c == True && dr==B = Just (Dispara Canhao)
                                                           |c == True && dr/=B = Just (Movimenta B)
                                                           |d == True && dr==E = Just (Dispara Canhao)
                                                           |d == True && dr/=E = Just (Movimenta E)
                                                           |otherwise = Nothing


-- |Esta função apenas verifica se há blocos em alguma das direções em relação ao __bot__ e que estejam adjacentes a este.
rightNextToMe :: Mapa -> Jogador -> Bool
rightNextToMe mp (Jogador (x,y) d v las choq) = ((encontraPosicaoMatriz (x-1,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x-1,y) mp == Vazia) && (encontraPosicaoMatriz (x-1,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x-1,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp) == Vazia) ||
                                                ((encontraPosicaoMatriz (x,y+2) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y+2) mp == Vazia) && (encontraPosicaoMatriz (x+1,y+2) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y+2) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp) == Vazia) ||
                                                ((encontraPosicaoMatriz (x+2,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x+2,y) mp == Vazia) && (encontraPosicaoMatriz (x+2,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x+2,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp) == Vazia) ||
                                                ((encontraPosicaoMatriz (x,y-1) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y-1) mp == Vazia) && (encontraPosicaoMatriz (x+1,y-1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y-1) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp) == Vazia)


{- |A função @rightNextToMeWhere@ verifica se há Blocos Destrutiveis adjacentes ao bot para cada um dos lados, e criar uma lista de __Bool__ que contem a informação de onde estão os Blocos Destrutiveis.
    Na lista criada, o 1º elemento corresponde para __Cima__, o 2º __Direita__, o 3º __Baixo__, e o 4º __Esquerd__a, sendo que __True__ corresponde a existir pares de bloco numa determinada direção.
    
    == Exemplo na utilização:
    >>> rightNextToMeWhere (constroi [Roda,Move B,MudaParede,Desenha]) (Jogador (4,1) D 5 2 2)    
    [True,False,False,False]
-}
rightNextToMeWhere :: Mapa -> Jogador -> [Bool]
rightNextToMeWhere mp (Jogador (x,y) d v las choq) = [((encontraPosicaoMatriz (x-1,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x-1,y) mp == Vazia) && (encontraPosicaoMatriz (x-1,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x-1,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x-1,y+1) mp) == Vazia), 
                                                      ((encontraPosicaoMatriz (x,y+2) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y+2) mp == Vazia) && (encontraPosicaoMatriz (x+1,y+2) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y+2) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y+2) mp) == Vazia),
                                                      ((encontraPosicaoMatriz (x+2,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x+2,y) mp == Vazia) && (encontraPosicaoMatriz (x+2,y+1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x+2,y) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+2,y+1) mp) == Vazia),
                                                      ((encontraPosicaoMatriz (x,y-1) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y-1) mp == Vazia) && (encontraPosicaoMatriz (x+1,y-1) mp) == Bloco Destrutivel) || ((encontraPosicaoMatriz (x,y-1) mp == Bloco Destrutivel) && (encontraPosicaoMatriz (x+1,y-1) mp) == Vazia)]


-- * Funções para quando há um jogador inimigo perto.

{- |A função @u2Close4Me@, juntamente com as auxiliares, verficia-se existe algum enimigo a uma distancia pequena do __bot__. Se existir, o __bot__ usa o choque e tenta destrui-lo.
-}
u2Close4Me :: Mapa -> Jogador -> [Jogador] -> [Disparo] -> Maybe Jogada
u2Close4Me mp j@(Jogador (x,y) d v las choq) js ds |toCloseL j (filtraMortos js) && (tenhoChoqueAtivo (whoIsMe j js) ds) = tryToKill2 mp j (toClose j js) ds js
                                                   |choq > 0 && toCloseL j (filtraMortos js) && (tenhoChoqueAtivo (whoIsMe j js) ds) == False = Just (Dispara Choque)
                                                   |choq == 0 && toCloseL j (filtraMortos js) = tryToKill2 mp j (toClose j js) ds js
                                                   |otherwise = justMove j (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ds) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)


-- |A função @toCloseL@ verifica se na lista de jogadores há algum inimigo que esteja na area que o choque afeta.
toCloseL :: Jogador -> [Jogador] -> Bool
toCloseL j [] = False
toCloseL j@(Jogador (x,y) d v las choq) ((Jogador (m,n) d' v' l' c'):t) |(x==m && y == n) = toCloseL j t
                                                                        |abs(m-x)<=3 && abs(y-n) <=3 = True
                                                                        |otherwise = toCloseL j t


-- |A função @toClose@ é usada quando a função 'toCloseL' dá True. Esta função vê qual é o jogador que está demasiado perto do __bot__ para ser usado na função 'u2Close4Me'.
toClose :: Jogador -> [Jogador] -> Jogador
toClose j [h] = h
toClose j@(Jogador (x,y) d v las choq) ((Jogador (m,n) d' v' l' c'):t) |(x==m && y == n) = toClose j t
                                                                       |abs(m-x)<=3 && abs(y-n) <=3 = (Jogador (m,n) d' v' l' c')
                                                                       |otherwise = toClose j t

-- |Esta função apenas remove os jogadores mortos da lista de jogadores, para tornar a aplicação das outras funções mais facil.
filtraMortos :: [Jogador] -> [Jogador]
filtraMortos [] = []
filtraMortos ((Jogador p d v las choq):t) = if v == 0 then filtraMortos t
                                                      else (Jogador p d v las choq):filtraMortos t

-- |Esta função vai ser usada para verificar se o __bot__ tem algum choque ativo na função 'u2Close4Me'
whoIsMe :: Jogador -> [Jogador] -> Int
whoIsMe j t = aux j t 0
             where aux j (h:t) n = if j == h then n else aux j t (n+1)


-- |Esta função verifica se o indice do __bot__ corresponde ao indice de algum dos __choques__ da lista de disparos.
tenhoChoqueAtivo :: Int -> [Disparo] -> Bool
tenhoChoqueAtivo _ [] = False
tenhoChoqueAtivo n ((DisparoChoque j ts):t) = if n == j then True else tenhoChoqueAtivo n t
tenhoChoqueAtivo n (h:t) = tenhoChoqueAtivo n t

-- |A função @tryToKill2@ é uma variação da 'tryToKill' que tenta, destruir o enimigo proximo do __bot__ , mesmo que não estejam alinhados.
tryToKill2 :: Mapa         -- ^ O Mapa atual do jogo
           -> Jogador      -- ^ O meu jogador
           -> Jogador      -- ^ O jogador a focar
           -> [Disparo]    -- ^ A lista de todos os disparor
           -> [Jogador]    -- ^ A lista de todos os jogadores
           -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar
tryToKill2 mp j1@(Jogador (x,y) d v las choq) j2@(Jogador (m,n) d' v' las' choq') ds js |v'/=0 && las>0 && alinhado j1 j2 && inSight mp j1 j2 && apontar j1 j2 = Just (Dispara Laser)
                                                                                        |v'/=0 && alinhado j1 j2 && inSight mp j1 j2 && apontar j1 j2 = Just (Dispara Canhao)
                                                                                        |v'/=0 && alinhado j1 j2 && inSight mp j1 j2 && apontar j1 j2 == False = alinha j1 j2
                                                                                        |v'/=0 && alinhado j1 j2 && inSight mp j1 j2 == False && apontar j1 j2 == False = alinha j1 j2
                                                                                        |v'/= 0 && inSight mp j1 j2 == False = justMove j1 (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ds) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)
                                                                                        |otherwise = justMove j1 (naoTemParede mp (Jogador (x,y) d v las choq)) (balaNaPosicao (Jogador (x,y) d v las choq) ds) (jogadorNaPosicao (Jogador (x,y) d v las choq) js)