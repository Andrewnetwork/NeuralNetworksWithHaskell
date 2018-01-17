slideWin [] = []
slideWin (x:[]) = []
slideWin (x:xs) =  [[x,head xs]]++(pairize xs)