slideWin [] = []
slideWin (x:[]) = []
slideWin (x:xs) =  [[x,head xs]]++(pairize xs)

-- Experimenting 
-- neuroAug - * weights of the neurons by two. 
neuroAug (Neuron inputs weights bias wia activation) = Neuron inputs (map (*2) weights) bias wia activation
nt i = Neuron i [-1,1] 0 dot ident

createNeurons init n
    | n <= 0 = []
    | otherwise = res:(createNeurons res (n-1)) 
    where res = neuroAug init

-- createNeurons (nt [1,2,3,4]) 3
evalError :: Neuron -> [Float] -> Float
--evalError n inVal = identError (activate n inVal) inVal
evalError n inVal = mult2Error (activate n inVal) inVal

-- How do we converge to the identity neuron. 

{--
identityN i = neuron i [0] 0 dot ifn 
identError output input = output - (head input)
evalError inVal = identError (identityN inVal) inVal
--}

identError output input = output - (head input)
mult2Error output input = output - ((head input)*2)

initN = Neuron [0] 0 dot ifn
identN = Neuron [1] 0 dot ifn
m2N = Neuron [2] 0 dot ifn
-- activate identN [1] 


l1 = convLoop initNeuron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 
l2 = convLoop (last l1) [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 
l3 = convLoop (last l2) [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 
l4 = convLoop (last l3) [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 

perceptConv' initPerceptron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 4
[[([0.0,0.0],0.0),([0.0,0.0],0.0),([0.0,0.0],0.0),([1.0,1.0],1.0)],
[([1.0,1.0],0.0),([1.0,0.0],-1.0),([1.0,0.0],-1.0),([2.0,1.0],0.0)],
[([2.0,1.0],0.0),([2.0,0.0],-1.0),([1.0,0.0],-2.0),([2.0,1.0],-1.0)],
[([2.0,1.0],-1.0),([2.0,1.0],-1.0),([1.0,1.0],-2.0),([2.0,2.0],-1.0)]]

--inputs = [1,2..10]
--targets = inputs

{--
Contributed by twitch WorldSEnder
win :: Int -> [a] -> [[a]]
win n l 
    | null l = []
    | otherwise = (filter (\lx -> length lx == n) $ (take n l):(win n $ drop 1 l))
--}

[[[0.0,0.0] | 0.0,[0.0,1.0] | 1.0,[0.0,1.0] | 1.0,[0.0,1.0] | 1.0],
[[0.0,1.0] | 0.0,[0.0,1.0] | 0.0,[1.0,1.0] | 1.0,[1.0,1.0] | 1.0],
[[1.0,1.0] | 0.0,[1.0,1.0] | 0.0,[1.0,1.0] | 0.0,[1.0,1.0] | 0.0]]