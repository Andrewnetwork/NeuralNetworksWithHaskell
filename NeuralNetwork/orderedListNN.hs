{--
Task: Ordered List Recognizer 
Given three real numbers [x,y,z], create a neural network that produces a 1 when x<y<z and
produces 0 when it is not the case that x<y<z. 
--}

import NN

actFn x
    | x <= 0 = 0
    | otherwise = 1

ltn i = neuron i [-1,1] 0 dot actFn

-- orderedSeq [2,3,4,5] -> [(2,3),(3,4),(4,5)]
-- orderedSeq [2,3,5,4]

-- Given a list, how do we split it into tuples of two. 
tuplize [] = []
tuplize (x:[]) = []
tuplize (x:xs) =  [[x,head xs]]++(tuplize xs)

orderedSeq ls
    | elem 0 res = 0
    | otherwise = 1
    where res = map ltn (tuplize ls)