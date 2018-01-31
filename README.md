# Neural Networks with Haskell 
A neural network library for exploring the relationship 
between neural networks, functional programming, and type theory. 

## Motivation 
Haskell is a powerful modern fully functional programming language that offers much to an AI programmer/researcher. Its type system and functional paradigm enforces a certain level of mathematical rigor on the process of developing algorithms, and often leads to elegant ways of thinking about problems. In this repo we will explore the basics of Haskell, why it is useful for AI research, type theory, and how to implement Neural Networks in a functional environment. 

## Goals 
+ Implement a multi-layer feed forward neural network. 
+ Backpropagation on a ffnn. 
+ Implement stocastic gradient descent using backpropagation.
+ Apply a neural network to MNIST digit classification. 

## Getting Started
1. Install the [Haskell Platform](https://www.haskell.org/platform/). 
2. Launch the glasgow haskell compiler (ghci) from a terminal. 
```
stack ghci
```
3. Load the files that define the functions you'd like to explore into ghci using the load command in your terminal that now has ghci loaded from the previous step. For example, the following command will load the perceptronExp.hs file. 
```
:l perceptronExp.hs
```
You can now use the haskell functions defined in that file via the haskell terminal. For example, here we map the *xorP* function defined in *perceptronExp.hs* over some data. 
```
map xorP [(0,0),(0,1),(1,0),(1,1)]
```

## What's Inside
+ **.\HaskellBasics**
+ **.\NeuralNetwork**
    + *NN.hs* - The main module. 
    + *PerceptConv.hs* - The perceptron convergence algorithm and perceptron definition. 
+ *perceptExp.hs* - Experiments with perceptrons. 
+ *ordSeqNN.hs* - Shows how a neural network can be used to recognize ordered sequences of real numbers. 
+ *succDiffNet.hs* - Uses a special type of neural network to compute the discrete derivitive of a sequence. 
+ *scrap.hs* - A notepad of random left over material. Not meant to be used. 

## Resources 
+ Backpropagation
    + http://parrt.cs.usfca.edu/doc/matrix-calculus/index.html
    + https://brilliant.org/wiki/backpropagation/
    + http://www.deeplearningbook.org/contents/mlp.html

## Methodology 
This repo is designed for educational purposes. Clarity and simplicity will be traded often be favored in spite of efficiency. This is not an implementation designed for industry applications; rather, think of this as an environment for exploring neural networks in a functional programming language. 