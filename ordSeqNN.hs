{--
ordSeqNN.hs
Andrew Ribeiro 
January 2018
MIT Licence 

Task: Ordered List Recognizer 
Given three real numbers [x,y,z], create a neural network that outputs True when x<y<z and
outputs False otherwise. 

This is a feed-forward neural network, but it is sparsely connected, as opposed to fully connected, as all neurons 
do not have connections to all elements in the prior layer. In fcFFNSeqNN.hs we show how to create a functionally 
equivalent network which is a fully connected feed-forward neural network. 
--}

import NeuralNetwork.NN

-- From: ordSeq.hs
ltn i = neuron i [-1,1] 0 dot truncRelu
andn i = neuron i [1,1] (-1) dot truncRelu
--map andn [ [0,0],[0,1],[1,0],[1,1] ]

-- B + i1*w1 + i2*w2 = i0*w0 + i1*w1 + i2*w2
-- Task: Find weights and a bias that makes truncRelu(i0*w0 + i1*w1 + i2*w2) 
-- positive when i0 = i1 = 1 and negative otherwise. 

truncRelu x
    | x <= 0 = 0
    | otherwise = 1

-- pairize [1,2,3] -> [[1,2],[2,3]]

-- ls: (fn,ls)
applyNeuron :: (t1 -> t2, t1) -> t2
applyNeuron ls = (fst ls) (snd ls)

firstLayer xs = map applyNeuron ( zip [ltn,ltn] (windows 2 xs) )
-- ( zip [ltn,ltn] (windows 2 xs) ) -> [ (ltn,[1,2]), (ltn,[2,3]) ]
-- firstLayer xs - > [1,1]

secondLayer xs = andn (firstLayer xs) 

ordSeqNet xs = secondLayer xs

-- What is the logical function with the following truth table?
-- x y | r
-- 0 0 | 0
-- 0 1 | 0
-- 1 0 | 0
-- 1 1 | 1

-- How do we implement the same network as a fully connected neural network instead of 
-- a sparsely connected one as seen in the definition of firstLayer above. 


-- Task: to extend the application of our network to lists of a lengths which are multiples of 3. 
nNetwork x 
    | elem 0 netRes = 0
    | otherwise = 1
    where netRes = map andn ( windows 2 (map ordSeqNet (windows 3 x) ) )
-- tst [1,2,3,4,5,6]
