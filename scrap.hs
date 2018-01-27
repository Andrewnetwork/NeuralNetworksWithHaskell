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
