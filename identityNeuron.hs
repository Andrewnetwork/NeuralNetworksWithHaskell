{--
identityNeuron.hs
Andrew Ribeiro 
January 2018
MIT Licence 

Here we consider how to train a single neuron how to become an identity function. 
ident :: a -> a

neuron inputs weights bias wia activation 
--}

import NN

--n1 i = neuron i [1,1..] ifn (\tup -> tup)

a2n i = neuron i [2,2..] 0 weightedSum ifn 
