{--
    ordSeq.hs
    Andrew Ribeiro 
    January 2018
    MIT Licence 

    Task: Ordered List Recognizer 
    Given three real numbers [x,y,z], create a neural network that outputs True when x<y<z and
    outputs False otherwise. 
--}

import NN

-- Here we use a modified version of relu as our activation function.
truncRelu x
    | x <= 0 = 0
    | otherwise = 1

-- A neuron with two valid weighted inputs. 
-- Weights: [-1,1]
-- Bias: 0
-- Activation function: truncRelu. 
ltn i = neuron i [-1,1] 0 dot truncRelu
-- Example: ltn [1,2] -> 1

-- Our above neuron is defined on two inputs. 
-- Partition a list into sublists of length two so 
-- that we can do pairwise comperations.  
-- We have defined the function windows for this. 
-- Ex: 

isOrdSeq :: (Num a, Ord a) => [a] -> Bool
isOrdSeq ls
    | elem 0 res = False
    | otherwise = True
    where res = map ltn (windows  ls)   
-- isOrdSeq [2,3,4,5] -> [[2,3],[3,4],[4,5]] -> [1,1,1] -> 1
-- isOrdSeq [2,3,5,4] -> [[2,3],[3,5],[5,4]] -> [1,1,0] -> 0

