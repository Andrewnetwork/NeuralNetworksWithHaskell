{--
main.hs
Andrew Ribeiro 
January 2018
MIT Licence 
--}

module NN(neuron,relu,sigmoid,dot,multTup,ifn)
where 

-- inputs     : inputs 
-- weights    : weights
-- activation : activation function
-- wia        : weighted input aggrigation function
neuron inputs weights bias wia activation = activation (wia ([1]++inputs) ([bias]++weights) )
-- Example: neuron [1,1,1,1] [2,2,2,2] weightedSum sigmoid
-- Example: neuron [1] [1] 0 weightedSum ifn 

-- ### Activation Functions ###
relu :: (Ord a, Num a) => a -> a
relu x = max x 0

sigmoid :: (Integral t, Floating p) => t -> p
sigmoid x
    | x >= 0 = sig
    | otherwise = - sigmoid (-x)
    where sig = 1 / (1+ (1/(exp 1)^(x)) )     
    
ifn x = x
-----------------------------------------------

-- ### Aggrigation Functions ###

dot i w = sum (map multTup (zip i w) )
multTup tup = (fst tup) * (snd tup)

----------------------------------------------------