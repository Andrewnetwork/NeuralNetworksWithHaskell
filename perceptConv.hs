{--
    perceptConv.hs
    Andrew Ribeiro 
    January 2018
    MIT Licence 
--}

import NeuralNetwork.NN

sgn x
    | x > 0 = 1
    | otherwise = -1

initNeuron = Neuron [0,0] 0 dot sgn
andNeuron = Neuron [2.0,1.0] (-2.0) dot sgn

-- Twitch Lumie1337: Ex- uncurry (+) (1,2)
addWeights (Neuron weights bias wia act ) updateWeightVect updateBias = 
    Neuron (map (\(l,r)->l+r) (zip weights updateWeightVect)) (bias+updateBias) wia act

updateNeuron neuro classLabel inputVector = addWeights neuro (map (* classLabel) inputVector) classLabel
--inputs = [1,2..10]
--targets = inputs
convStep neuro input classLabel
    | (activate neuro input) == classLabel = neuro
    | otherwise = updateNeuron neuro classLabel input

-- convStep initNeuron [0,0] (-1)
-- activate (convStep initNeuron [1,1] (1)) [0,0]

convLoop _ [] [] = [] 
convLoop neuro inputVect labelVector = convStepRes:(convLoop convStepRes (tail inputVect) (tail labelVector))
                                       where convStepRes = convStep neuro (head inputVect) (head labelVector) 

perceptConv initNeuron inputVect labelVector nTimes
    | nTimes <= 0 = []
    | otherwise = [map getParams convStepRes]:perceptConv (last convStepRes) inputVect labelVector (nTimes-1)
    where convStepRes = convLoop initNeuron inputVect labelVector 

-- perceptConv initNeuron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 4 
--        l1 = coinnvLoop itNeuron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] 

-- map getParams l1
-- map getParams ( convLoop initNeuron [[0,0],[0,1],[1,0],[1,1]] [-1,-1,-1,1] )
-- convLoop initNeuron inputV labelV


getParams (Neuron weights bias _ _ ) = (weights,bias)
-- map getWeights (convLoop initN [10] 10)

-- Boolean And Perceptron 
-- Truth table for And
-- L R | L && R
-- 0 0 | 0 
-- 0 1 | 0 
-- 1 0 | 0 
-- 1 1 | 1 


