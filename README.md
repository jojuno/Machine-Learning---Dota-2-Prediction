# Machine-Learning---Dota-2-Prediction
predict game outcome using R

###### Target Variable:
The outcome of the game

###### Predictors:  
First analysis: team composition score difference between the two teams  
Second analysis: gold and xp difference between the two teams

###### Model:
Logistic regression with multiple predictors

###### Results:  
team composition advantage is not correlated with outcomes. the advantage could be calculated using a different method.  
gold and xp are positively correlated with winning. the model accurately predicted 73.7% of the outcomes of games in the test data set. There was a high probability of winning at around 2000 gold and 2000 XP (experience) points advantage.
