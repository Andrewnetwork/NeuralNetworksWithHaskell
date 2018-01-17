{--
fcFFNSeqNN.hs
Andrew Ribeiro 
January 2018
MIT Licence 

In ordSeqNN.hs we defined a neural network with two hidden layers. This network was sparsely connected. It
is not a fully connected feed forward neural network. We will now demonstrate how to make an equivalent fully connected
network. 
--}

import NeuralNetwork.NN

ltn i = neuron i [-1,1,0] 0 dot truncRelu
andn i = neuron i [0,1,1] (-1) dot truncRelu

-- pairize [1,2,3] -> [[1,2],[2,3]]

-- ls: (fn,ls)
applyNeuron :: (t1 -> t2, t1) -> t2
applyNeuron ls = (fst ls) (snd ls)

firstLayer xs = map applyNeuron ( zip [ltn,ltn] (windows 2 xs) )
-- ( zip [ltn,ltn] (windows 2 xs) ) -> [ (ltn,[1,2]), (ltn,[2,3]) ]
-- firstLayer xs - > [1,1]

secondLayer xs = andn (firstLayer xs) 

ordSeqNet xs = secondLayer xs