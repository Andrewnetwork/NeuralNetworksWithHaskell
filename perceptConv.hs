{--
    perceptConv.hs
    Andrew Ribeiro 
    January 2018
    MIT Licence
    
    Slide reference: http://www.cems.uvm.edu/~rsnapp/teaching/cs295ml/notes/perceptron.pdf

    In this file we implement the perceptron convergence procedure. 
    We take a linear neuron that produces a binary output and adjust its 
    weights by itterating over labeled training vectors. 
--}

import NeuralNetwork.NN

-- Our linear threshold activation function. 
-- Returns either 1 or -1. 
sgn :: (Ord a, Num a, Num p) => a -> p
sgn x
    | x > 0 = 1
    | otherwise = -1

-- Our initial neuron with zeroed weights and the above cost funciton. 
initPerceptron = Neuron [0,0] 0 dot sgn
-- We can activate any neuron/perceptron with some input data by using the function:
-- activate initPerceptron [1,1]

-- Adds a vector to the weights and scalar to the bias of a neuron and
-- returns a new neuron.
addWeights :: Neuron -> [Float] -> Float -> Neuron
addWeights (Neuron weights bias wia act ) updateWeightVect updateBias = 
    Neuron (map (\(l,r)->l+r) (zip weights updateWeightVect)) (bias+updateBias) wia act
-- Twitch Lumie1337: Ex- (\(l,r)->l+r) can be replaced with uncurry (+).

-- The innter most operation of the perceptron convergence procedure. 
-- Updates the weights of the neuron in respect to the class label. 
convStep :: Neuron -> [Float] -> Float -> Neuron
convStep neuro inputVector classLabel
    | (activate neuro inputVector) == classLabel = neuro
    | otherwise = addWeights neuro (map (* classLabel) inputVector) classLabel
-- convStep initNeuron [0,0] (-1)
-- activate (convStep initNeuron [1,1] (1)) [0,0]

-- A single training loop on all the input vectors. 
-- Returns a list of neurons trained in this loop. 
convLoop :: Neuron -> [[Float]] -> [Float] -> [Neuron]
convLoop _ [] [] = [] 
convLoop neuro inputVect labelVector = convStepRes:(convLoop convStepRes (tail inputVect) (tail labelVector))
                                       where convStepRes = convStep neuro (head inputVect) (head labelVector) 

-- The perceptron convergence procedure. With all the neuron training history. 
perceptConv' :: (Ord t, Num t) => Neuron -> [[Float]] -> [Float] -> t -> [[Neuron]]
perceptConv' initNeuron inputVect labelVector nItter
    | nItter <= 0 = []
    | otherwise = convStepRes:perceptConv' (last convStepRes) inputVect labelVector (nItter-1)
    where convStepRes = convLoop initNeuron inputVect labelVector 
-- perceptConv' initPerceptron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 4 

convergenceCond :: [Neuron] -> Bool
convergenceCond itter = foldl (&&) True (map (== (head itter)) (tail itter))

perceptConv :: Neuron -> [[Float]] -> [Float] -> Int -> (Bool, Int, Neuron)
perceptConv initNeuron inputVect labelVector maxItter
    | resLen < maxItter = (True, resLen+1, (last.last) convRes)
    | otherwise = (False, resLen, initNeuron)
    where process = perceptConv' initNeuron inputVect labelVector maxItter
          convRes = takeWhile' (not.convergenceCond) process
          resLen = length convRes
-- perceptConv initPerceptron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 10 

-- Boolean And Perceptron 
-- Truth table for And
-- L R | L && R
-- 0 0 | 0 
-- 0 1 | 0 
-- 1 0 | 0 
-- 1 1 | 1 

-- The and perceptron with weights/baias learned through
-- the perceptron convergence procedure implemented here. 
andPerceptron = Neuron [2.0,1.0] (-2.0) dot sgn
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
-- perceptConv initPerceptron [[0,0],[0,1],[1,0],[1,1]] [-1,1,1,1] 10 
orPerceptron = Neuron [1.0,1.0] (0) dot sgn
-- map (activate orPerceptron) [[0,0],[0,1],[1,0],[1,1]] 


-- Boolean Or Perceptron 
-- Truth table for XOR 
-- L R | L || R
-- 0 0 | 0 
-- 0 1 | 1
-- 1 0 | 1
-- 1 1 | 0 

-- perceptConv initPerceptron [[0,0],[0,1],[1,0],[1,1]] [-1,1,1,-1] 10 




-- perceptConv initPerceptron [[0],[1]] [-1,1] 10 


-- map (map getParams) (perceptConv initPerceptron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 10 

--        l1 = coinnvLoop itNeuron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 

-- map getParams l1
-- map getParams ( convLoop initNeuron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] )
-- convLoop initNeuron inputV labelV



-- map getWeights (convLoop initN [10] 10)




