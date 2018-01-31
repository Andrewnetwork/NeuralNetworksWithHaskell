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

-- #### Multi-Layer Perceptrons #######






