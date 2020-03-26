# Machine-Learning---Dota-2-Prediction



###### Update 03/26/2020:
Further analysis was done with Tree based methods. See "Part 2" below.

###### Introduction:
This was done for the Introduction to Data Science course at UCLA Extension with Professor Daniel Gutierrez.

###### Goal: 
Predict match outcome using R

###### Data:  
Games with outcomes and stats  
First data set: "dota2Test.csv"  
source: https://archive.ics.uci.edu/ml/datasets/Dota2+Games+Results  
Second data set: "second data set" (compressed to fit the size cap)  
"train_features.csv", "train_targets.csv" (results of the games), 50% sampled at random  
source: https://www.kaggle.com/c/mlcourse-dota2-win-prediction/data  

###### Target Variable:
The outcome of the game

###### Predictors:  
First analysis: team composition score difference between the two teams  
Second analysis: gold and xp difference between the two teams

###### Model:
Logistic regression with multiple predictors

###### Results:  
Team composition advantage is not correlated with outcomes. The advantage could be calculated using a different method.  
Gold and xp are positively correlated with winning. The model accurately predicted 73.7% of the outcomes of games in the test data set using a 50% win / 50% loss classification. There was a high probability of winning at around 2000 gold and 2000 XP (experience) points advantage.

![Image of 3D Scatter Plot](https://github.com/jojuno/Machine-Learning---Dota-2-Prediction/blob/master/Actual%20Outcome%20vs.%20Predicted%20Win%20Chance%20by%20Gold%20and%20XP%20Advantage%203D%20Scatterplot.gif)






###### Part 2:
Same response variable; added 3 more predictors; used classification tree, pruning, bagging, and random forest for modeling.

###### Predictors:
Gold difference
XP difference
Kills difference
Assists difference
Rune Pick Ups difference

###### Model:
Classification Tree
Pruning
Bagging (p = 5)
Random Forest (p = 2)

###### Results:
The accuracy was highest with 1 variable tried at each split, at 71.37%.
It seems like gold is the most important factor in predicting outcome.

![Image of Classification Tree](https://github.com/jojuno/Machine-Learning---Dota-2-Prediction/blob/master/tree%20plot.png)

###### Future Directions:
Different modeling methods such as naive bayes could be tried to increase accuracy.
