{--
    succDiffNet.hs
    Andrew Ribeiro 
    January 2018
    MIT Licence 

    Defines a neural network where each layer takes the pairwise differences of 
    the elements in the layer prior. We recurse until we get a singular element. 
    Every finite sequence will terminate. 
    
    Example:
    rdNet [1,4,9,16,25 ] -> [[3,5,7,9],[2,2,2],[0,0],[0]]
    
--}

import NeuralNetwork.NN

ident x = x

succDiffN i = neuron i [-1,1] 0 dot ident

firstLayer input = layer (take (length input) (cycle [succDiffN])) input 2

-- Recurse down network. 
rdNet [] = []
rdNet input
    | flr == [] = [] 
    | otherwise = flr:rdNet flr
    where flr = firstLayer input
 
-- rdNet [1,4,9,16,25 ] -> [[3,5,7,9],[2,2,2],[0,0],[0]]

