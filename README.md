# Neural Networks with Haskell 
A neural network library for exploring the relationship 
between neural networks, functional programming, and type theory. 

## Motivation 
Haskell is a powerful modern fully functional programming language that offers much to an AI programmer/researcher. Its type system and functional paradigm enforces a certain level of mathematical rigor on the process of developing algorithms, and often leads to elegant ways of thinking about problems. In this repo we will explore the basics of Haskell, why it is useful for AI research, type theory, and how to implement Neural Networks in a functional environment. 

## Goals 
+ Implement a multi-layer feed forward neural network. 
+ Computing the gradient of a ffnn. 
+ Implement stocastic gradient descent using the auto gradient. 
+ Apply neural network to MNIST. 

## Getting Started
```
stack ghci --ghci-options .gchi
stack ghci -read-dot-ghci
```

## What's Inside
+ Exercises 
+ HaskellBasics
+ MNIST_Example
+ NeuralNetwork

## Methodology 
This repo is designed for educational purposes. Clarity and simplicity will be traded often be favored in spite of efficiency. This is not an implementation designed for industry applications; rather, think of this as an environment for exploring neural networks in a functional programming language. 