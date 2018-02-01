{--
    neuronXOR.hs
    Andrew Ribeiro 
    January 2018
    MIT Licence 

    Here we show how the boolean xor can be represented by a multi-layer feed-forward neural network 
    and how to learn the parameters/weights and biases can be learned through backpropagation and
    gradient descent. 
--}

import NeuralNetwork.NN

-- Boolean XOR Perceptron 
-- Truth table for XOR 
-- L R | L || R
-- 0 0 | 0 
-- 0 1 | 1
-- 1 0 | 1
-- 1 1 | 0 

-- From the deep learning book, we can implement the 
-- xor function as a feed-forward neural network with a hidden layer 
-- and non-linear relu activation functions for those neurons. Here we use 
-- weights that were already given to us by some learning algorithm like
-- gradient descent, but later we will actually learn these parameters. 
-- Source: http://www.deeplearningbook.org/contents/mlp.html

-- Our hidden layer of two neurons. 
h1_l1 = Neuron [1.0,1.0] 0.0 dot relu
h2_l1 = Neuron [1.0,1.0] (-1.0) dot relu
layer1 inVect = [activate h1_l1 inVect, activate h2_l1 inVect]

-- Our output layer of a linear neuron. 
y = Neuron [1.0,(-2.0)] 0.0 dot ifn
outNet inVect = activate y (layer1 inVect)

-- We can map this over all binary vectors of length two in 
-- order to prove this network does represent the xor function. 
-- map outNet [[0,0],[0,1],[1,0],[1,1]]