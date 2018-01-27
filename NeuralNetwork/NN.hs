{--
main.hs
Andrew Ribeiro 
January 2018
MIT Licence 
--}

module NeuralNetwork.NN(neuron,relu,sigmoid,dot,multTup,ifn,windows,truncRelu,applyNeuron,layer,Neuron(..),activate )
where 

import Text.Show.Functions

type WIA a = [a] -> [a] -> a
type Activation a = a -> a

data Neuron = Neuron {inputs::[Float]
                        ,weights::[Float] 
                        ,bias::Float
                        ,wia::WIA Float
                        ,activation::Activation Float
                    } deriving (Show)

-- inputs     : inputs 
-- weights    : weights
-- activation : activation function
-- wia        : weighted input aggrigation function
neuron inputs weights bias wia activation = activation (wia ([1]++inputs) ([bias]++weights) )
-- Example: neuron [1,1,1,1] [2,2,2,2] weightedSum sigmoid
-- Example: neuron [1] [1] 0 weightedSum ifn 

activate (Neuron inputs weights bias wia activation) = neuron inputs weights bias wia activation



layer neurons inputs inputSize = map applyNeuron ( zip neurons (windows inputSize inputs) )

applyNeuron :: (t1 -> t2, t1) -> t2
applyNeuron ls = (fst ls) (snd ls)


-- ### Activation Functions ###
relu :: (Ord a, Num a) => a -> a
relu x = max x 0

truncRelu x
    | x <= 0 = 0
    | otherwise = 1

sigmoid :: (Integral t, Floating p) => t -> p
sigmoid x
    | x >= 0 = sig
    | otherwise = - sigmoid (-x)
    where sig = 1 / (1+ (1/(exp 1)^(x)) )     
    
ifn x = x

softmax :: (Floating b) => [b] -> [b]
softmax z = map (/bot) top
            where top = map exp z
                  bot = sum top
-- softmax [1,2,3,4,1,2,3] 
-----------------------------------------------

-- ### Aggrigation Functions ###
dot :: Num a => [a] -> [a] -> a
dot i w = sum (map multTup (zip i w) )
multTup tup = (fst tup) * (snd tup)

----------------------------------------------------

-- ### Neural Networks ###
-- Layers
   -- Number of neurons. 
   -- Inputs/Outputs
-- 6 -> 6 -> 2

----------------------------------------------------

-- ### Helper Functions ###
windows _ [] = []
windows n (x:xs)
    | (length xs) > (n-2) = [x:(take (n-1) xs)]++(windows n xs)
    | otherwise = []
    
-- [[x]:(take n xs)]++(windows xs)
-- windows 2 [1,2,3] -> [ [1,2] , [2,3] ]
-- windows 3 [1,2,3] -> [ [1,2,3] ]

{--
Contributed by twitch WorldSEnder
win :: Int -> [a] -> [[a]]
win n l 
    | null l = []
    | otherwise = (filter (\lx -> length lx == n) $ (take n l):(win n $ drop 1 l))
--}
----------------------------------------------------