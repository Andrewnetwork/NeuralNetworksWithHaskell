{--
    perceptExp.hs
    Andrew Ribeiro 
    January 2018
    MIT Licence 

    Perceptron experiments. Uses the perceptron convergence algorithm 
    implemented in this neural network library. 
--}

import NeuralNetwork.PerceptConv
import NeuralNetwork.NN 

-- #### Single Boolean Logic Percpetrons #######

-- Some initial perceptrons with a linear activation and zeroed params.
initPerceptron2 = perceptron [0,0] 0
initPerceptron1 = perceptron [0] 0

-- Boolean Identity Perceptron 
-- Truth table for Identity
-- V | ~V
-- 0 | 0
-- 1 | 1
-- perceptConv initPerceptron1 [[0],[1]] [-1,1] 10 
identPerceptron = perceptron [1] 0

-- Boolean Not Perceptron 
-- Truth table for Not
-- V | ~V
-- 0 | 1
-- 1 | 0
-- perceptConv initPerceptron1 [[0],[1]] [1,-1] 10 
notPerceptron = perceptron [-1.0] 1.0
-- map (activate notPerceptron) [[0],[1]] -> [1.0,-1.0]

-- Boolean And Perceptron 
-- Truth table for And
-- L R | L && R
-- 0 0 | 0 
-- 0 1 | 0 
-- 1 0 | 0 
-- 1 1 | 1 
-- The and perceptron with weights/baias learned through
-- the perceptron convergence procedure implemented here. 
-- perceptConv initPerceptron2 [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 10 
andPerceptron = perceptron [2.0,1.0] (-2.0)
-- map (activate andPerceptron) [[0,0],[0,1],[1,0],[1,1]] -> [-1.0,-1.0,-1.0,1.0]
-- The above result shows that this neuron has correctly learned the boolean and function. 
-- With -1 representing the 0 class and 1 representing the 1 class. 

-- Boolean Or Perceptron 
-- Truth table for And
-- L R | L || R
-- 0 0 | 0 
-- 0 1 | 1
-- 1 0 | 1
-- 1 1 | 1 
-- perceptConv initPerceptron2 [[0,0],[0,1],[1,0],[1,1]] [-1,1,1,1] 10 
orPerceptron = perceptron [1.0,1.0] (0)
-- map (activate orPerceptron) [[0,0],[0,1],[1,0],[1,1]] 


-- Boolean XOR Perceptron 
-- Truth table for XOR 
-- L R | L || R
-- 0 0 | 0 
-- 0 1 | 1
-- 1 0 | 1
-- 1 1 | 0 
-- Famously does not converge!
-- perceptConv initPerceptron2 [[0,0],[0,1],[1,0],[1,1]] [-1,1,1,-1] 1000

-- In boolean algebra, XOR can be represented as a composition of boolean funcitons. 
-- (A + B) * (~A + ~B)
-- Where + is or, ~ is not, and * is and. We have trained boolean functions above for these
-- operations and can use them to produce an xor function as follows: 
-- NOTE: We must translate the values of our perceptrons to their proper boolean classes.
-- As in our perceptrons, the zero class is represented as -1. 

translate :: (Eq a, Num a, Num p) => a -> p
translate v
    | v == -1 = 0
    | otherwise = 1

andP a b = translate (activate andPerceptron [a,b])

orP a b = translate (activate orPerceptron [a,b])

notP a = translate ( activate notPerceptron [a] )

xorP :: Num p => (Float, Float) -> p
xorP (a,b) = andP (orP a b) (orP (notP a) (notP b) )
-- map xorP [(0,0),(0,1),(1,0),(1,1)]





