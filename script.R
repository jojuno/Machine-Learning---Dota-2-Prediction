###########prepare data set##################

setwd("C:/Users/Moonsoo Jo/Desktop/moonsoo jo/ucla/intro to data science/UCLAIntroDataScience-master/project")
gameData <- read.csv("./data/new - mlcourse/train_features.csv", header=TRUE)
gameDataTargets <- read.csv("./data/new - mlcourse/train_targets.csv", header=TRUE)

#gameData$radiant_win <- gameDataTargets$radiant_win

#take a sample of the original data set
n <- nrow(gameData)  # Number of observations = 102
nsample <- round(n*0.5)   

set.seed(314)             # Set seed for reproducible results
tindex <- sample(n, nsample) # Create an index

sampleGameData <- gameData[tindex,]  # Create sample set


roles <- c(1,0,1,0,0,0,1,0,0,
           0,0,0,1,1,1,0,0,1,
           0,1,1,1,0,1,0,0,0,
           1,0,1,1,1,0,0,0,1,
           0,1,1,1,1,0,0,0,0,
           1,0,0,1,0,0,0,1,0,
           0,1,1,1,0,0,0,0,1,
           1,0,0,0,0,0,1,1,0,
           1,1,1,1,0,0,1,0,0,
           1,0,1,1,0,1,1,0,0,
           1,0,1,0,0,0,0,0,0,
           1,0,1,0,0,0,1,1,0,
           0,0,1,1,0,0,1,0,1,
           0,0,1,1,0,1,0,0,1,
           1,0,1,0,0,1,0,1,0,
           0,0,1,1,1,0,1,0,1,
           1,0,1,1,0,0,1,0,1,
           1,0,1,1,0,1,0,0,1,
           1,0,1,1,0,1,0,1,1,
           0,1,1,1,0,0,1,0,1,
           0,0,1,0,0,0,0,0,0,
           1,0,1,1,0,1,0,0,1,
           1,1,1,1,0,0,0,0,0,
           0,0,0,0,0,0,0,0,0,
           0,1,1,1,0,0,0,0,1,
           1,0,0,1,0,1,1,0,1,
           0,0,1,1,0,1,0,0,1,
           0,1,1,1,0,0,0,0,0,
           0,1,1,0,0,0,0,0,0,
           1,0,0,1,0,0,1,0,0,
           0,0,0,1,1,0,0,1,1,
           1,0,1,0,0,0,0,1,0,
           1,0,1,0,0,0,0,0,0,
           1,0,1,1,0,1,0,0,0,
           0,1,0,1,0,0,0,0,1,
           0,0,1,1,0,1,0,0,1,
           1,0,1,0,0,0,1,0,0,
           0,1,1,1,0,0,0,1,1,
           1,0,0,1,0,1,1,0,1,
           1,1,0,1,0,1,0,0,1,
           1,1,0,1,0,1,0,0,1,
           1,0,1,1,0,0,0,1,0,
           1,0,0,0,0,0,1,0,0,
           0,0,1,0,0,0,0,1,0,
           1,0,0,0,0,0,1,0,0,
           1,0,0,1,0,1,0,0,1,
           1,0,1,0,0,0,0,1,0,
           1,0,1,1,0,1,0,1,1,
           0,1,1,1,0,0,0,0,0,
           0,0,1,1,0,1,0,0,1,
           1,1,1,1,0,0,0,1,0,
           1,1,1,1,0,0,0,1,0,
           1,0,1,0,1,0,1,1,0,
           1,0,0,1,1,1,1,0,0,
           0,0,0,1,1,0,1,0,0,
           1,0,0,0,0,0,1,1,0,
           0,1,1,0,0,1,0,0,0,
           0,1,0,1,1,1,0,1,0,
           1,0,0,0,0,1,0,0,1,
           1,0,1,1,0,1,0,0,1,
           1,0,1,0,0,0,1,1,0,
           0,0,1,0,0,0,1,0,0,
           1,0,0,0,0,0,1,0,0,
           0,1,1,1,0,0,0,1,0,
           0,0,0,1,1,0,1,0,1,
           0,1,0,0,1,0,0,1,0,
           1,0,0,0,0,1,1,0,0,
           0,1,1,1,0,0,0,0,0,
           1,0,1,1,0,1,0,0,1,
           1,0,0,1,1,1,0,0,0,
           1,0,0,1,0,1,1,0,1,
           1,0,1,1,0,0,0,0,0,
           1,1,1,1,0,1,0,0,1,
           1,0,1,1,0,0,1,1,0,
           1,1,1,1,0,0,0,0,1,
           1,0,1,1,0,0,0,0,0,
           1,0,0,0,1,1,1,1,0,
           1,0,1,1,0,1,0,0,1,
           0,1,1,1,0,0,0,0,1,
           1,0,0,0,1,1,0,1,0,
           1,0,0,1,0,1,0,1,1,
           1,0,1,1,0,0,1,1,1,
           0,1,0,1,0,1,1,0,1,
           0,1,1,1,0,1,0,0,1,
           0,1,1,1,0,1,0,0,0,
           0,1,1,1,0,0,0,0,0,
           0,1,1,1,0,0,0,0,1,
           0,0,1,1,0,0,1,0,1,
           1,1,0,1,0,0,1,1,1,
           0,1,1,1,1,0,0,0,0,
           0,1,1,0,0,0,1,0,0,
           0,1,1,1,0,1,0,1,0,
           1,0,1,1,0,0,1,0,0,
           1,0,0,1,0,1,0,0,0,
           1,0,0,1,0,1,0,1,0,
           0,0,1,1,0,1,1,0,1,
           0,0,1,1,0,0,1,0,1,
           0,0,1,0,0,1,1,0,0,
           1,0,1,0,0,1,0,0,1,
           0,0,1,1,0,0,0,0,1,
           0,1,1,1,0,0,0,0,0,
           1,1,0,0,0,1,0,0,0,
           0,0,1,1,0,1,0,0,1,
           1,0,1,1,0,1,0,0,1,
           0,0,1,1,0,0,0,0,0,
           1,0,1,1,0,0,1,0,1,
           0,0,1,1,0,1,1,0,1,
           0,1,1,1,0,1,1,0,0,
           1,0,1,0,0,0,0,1,0,
           0,1,1,1,0,0,1,0,1,
           0,1,1,1,0,0,0,1,0,
           0,1,1,1,0,0,0,0,0,
           1,0,1,0,0,0,1,0,0,
           1,0,0,1,0,0,1,0,1,
           0,0,0,0,0,0,0,0,0,
           0,0,0,0,0,0,0,0,0,
           0,0,0,0,0,0,0,0,0,
           0,0,0,0,0,0,0,0,0,
           0,1,1,1,0,0,1,0,0,
           1,0,1,1,0,1,1,0,1
)




hero_to_roles <- matrix(roles, nrow = 120, ncol = 9, byrow=TRUE)

colnames(hero_to_roles) <- c('Carry', 'Support', 'Nuker', 'Disabler', 'Jungler', 'Durable', 'Escape', 'Pusher', 'Initiator')
rownames(hero_to_roles) <- c('Anti-Mage',
                             'Axe',
                             'Bane',
                             'Bloodseeker',
                             'Crystal Maiden',
                             'Drow Ranger',
                             'Earthshaker',
                             'Juggernaut',
                             'Mirana',
                             'Morphling',
                             'Shadow Fiend',
                             'Phantom Lancer',
                             'Puck',
                             'Pudge',
                             'Razor',
                             'Sand King',
                             'Storm Spirit',
                             'Sven',
                             'Tiny',
                             'Vengeful Spirit',
                             'Windranger',
                             'Zeus',
                             'Kunkka',
                             '',
                             'Lina',
                             'Lion',
                             'Shadow Shaman',
                             'Slardar',
                             'Tidehunter',
                             'Witch Doctor',
                             'Lich',
                             'Riki',
                             'Enigma',
                             'Tinker',
                             'Sniper',
                             'Necrophos',
                             'Warlock',
                             'Beastmaster',
                             'Queen of Pain',
                             'Venomancer',
                             'Faceless Void',
                             'Skeleton King',
                             'Death Prophet',
                             'Phantom Assassin',
                             'Pugna',
                             'Templar Assassin',
                             'Viper',
                             'Luna',
                             'Dragon Knight',
                             'Dazzle',
                             'Clockwerk',
                             'Leshrac',
                             "Nature's Prophet",
                             'Lifestealer',
                             'Dark Seer',
                             'Clinkz',
                             'Omniknight',
                             'Enchantress',
                             'Huskar',
                             'Night Stalker',
                             'Broodmother',
                             'Bounty Hunter',
                             'Weaver',
                             'Jakiro',
                             'Batrider',
                             'Chen',
                             'Spectre',
                             'Ancient Apparition',
                             'Doom',
                             'Ursa',
                             'Spirit Breaker',
                             'Gyrocopter',
                             'Alchemist',
                             'Invoker',
                             'Silencer',
                             'Outworld Devourer',
                             'Lycanthrope',
                             'Brewmaster',
                             'Shadow Demon',
                             'Lone Druid',
                             'Chaos Knight',
                             'Meepo',
                             'Treant Protector',
                             'Ogre Magi',
                             'Undying',
                             'Rubick',
                             'Disruptor',
                             'Nyx Assassin',
                             'Naga Siren',
                             'Keeper of the Light',
                             'Wisp',
                             'Visage',
                             'Slark',
                             'Medusa',
                             'Troll Warlord',
                             'Centaur Warrunner',
                             'Magnus',
                             'Timbersaw',
                             'Bristleback',
                             'Tusk',
                             'Skywrath Mage',
                             'Abaddon',
                             'Elter Titan',
                             'Legion Commander',
                             'Techies',
                             'Ember Spirit',
                             'Earth Spirit',
                             'Abyssal Underlord',
                             'Terrorblade',
                             'Phoenix',
                             'Oracle',
                             'Winter Wyvern',
                             'Arc Warden',
                             'Monkey King',
                             '',
                             '',
                             '',
                             '',
                             'Dark Willow',
                             'Pangolier'
)

sampleGameData$r_total_gold = 'r_total_gold'
sampleGameData$d_total_gold = 'd_total_gold'
sampleGameData$total_gold_difference = 'total_gold_difference'
sampleGameData$r_total_xp = 'r_total_xp'
sampleGameData$d_total_xp = 'd_total_xp'
sampleGameData$total_xp_difference = 'total_xp_difference'
sampleGameData$r_first_blood_claimed = 'r_first_blood_claimed'
sampleGameData$d_first_blood_claimed = 'd_first_blood_claimed'
sampleGameData$first_blood_claimed_difference = 'first_blood_claimed_difference'




###############FUNCTIONS#######################

#gold

calculate_total_gold_radiant <- function(gameData, rowNum) {
  total_gold <- sum(gameData[rowNum, 108], gameData[rowNum, 84], gameData[rowNum, 60], gameData[rowNum, 36], gameData[rowNum, 12])
}
calculate_total_gold_dire <- function(gameData, rowNum) {
  total_gold <- sum(gameData[rowNum, 228], gameData[rowNum, 204], gameData[rowNum, 180], gameData[rowNum, 156], gameData[rowNum, 132])
}
calculate_total_gold_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_gold_difference <- as.numeric(gameData[rowNum,]$r_total_gold) - as.numeric(gameData[rowNum,]$d_total_gold)
}

#xp

calculate_total_xp_radiant <- function(gameData, rowNum) {
  total_xp <- sum(gameData[rowNum, 110], gameData[rowNum, 86], gameData[rowNum, 62], gameData[rowNum, 38], gameData[rowNum, 14])
}
calculate_total_xp_dire <- function(gameData, rowNum) {
  total_xp <- sum(gameData[rowNum, 230], gameData[rowNum, 206], gameData[rowNum, 182], gameData[rowNum, 158], gameData[rowNum, 134])
}
calculate_total_xp_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_xp_difference <- as.numeric(gameData[rowNum,]$r_total_xp) - as.numeric(gameData[rowNum,]$d_total_xp)
}

#first blood claimed

calculate_first_blood_claimed_radiant <- function(gameData, rowNum) {
  first_blood_claimed <- sum(gameData[rowNum, 121], gameData[rowNum, 97], gameData[rowNum, 73], gameData[rowNum, 49], gameData[rowNum, 25])
}
calculate_first_blood_claimed_dire <- function(gameData, rowNum) {
  first_blood_claimed <- sum(gameData[rowNum, 241], gameData[rowNum, 217], gameData[rowNum, 193], gameData[rowNum, 169], gameData[rowNum, 145])
}
calculate_first_blood_claimed_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$first_blood_claimed_difference <- as.numeric(gameData[rowNum,]$r_first_blood_claimed) - as.numeric(gameData[rowNum,]$d_first_blood_claimed)
}

#############LOOPS################


#apply functions to every row
for (row in 1:nrow(sampleGameData)) {  
  sampleGameData[row,247] <- calculate_total_gold_radiant(sampleGameData, row)
  sampleGameData[row,248] <- calculate_total_gold_dire(sampleGameData, row)
  sampleGameData[row,249] <- calculate_total_gold_difference(sampleGameData, row)
  sampleGameData[row,250] <- calculate_total_xp_radiant(sampleGameData, row)
  sampleGameData[row,251] <- calculate_total_xp_dire(sampleGameData, row)
  sampleGameData[row,252] <- calculate_total_xp_difference(sampleGameData, row)
  sampleGameData[row,253] <- calculate_first_blood_claimed_radiant(sampleGameData, row)
  sampleGameData[row,254] <- calculate_first_blood_claimed_dire(sampleGameData, row)
  sampleGameData[row,255] <- calculate_first_blood_claimed_difference(sampleGameData, row)
}

#add real outcomes to measure accuracy
sampleGameData$radiant_win <- gameDataTargets[tindex,]$radiant_win

#filter out games that are not legitimate (maybe another game type, like practice games)
sampleGameData<-sampleGameData[!(sampleGameData$first_blood_claimed_difference==0),]
#choose games of modes that have rules that aren't modified from the normal rules

sampleGameData<-sampleGameData[!(sampleGameData$game_mode==4),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==5),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==12),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==16),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==23),]







# Split data set into training set and test set
n <- nrow(sampleGameData)  # Number of observations = 102
ntrain <- round(n*0.6)    # 60% for training set

set.seed(313)             # Set seed for reproducible results
tindex <- sample(n, ntrain) # Create an index

trainGameData <- sampleGameData[tindex,]
testGameData <- sampleGameData[-tindex,] 

for (row in nrow(trainGameData)) {
  if (trainGameData$radiant_win == TRUE) {
    trainGameData[row,]$dire_win <- FALSE
  } else {
    trainGameData[row,]$dire_win <- TRUE
  }
}


# EDA

plot(trainGameData$radiant_win, trainGameData$total_gold_difference,
     xlab="Game Outcome (Radiant Win = 1.0)",
     ylab="Radiant's Gold Advantage",
     main="Radiant's Gold Advantage by Game Outcome") #trend
plot(trainGameData$radiant_win, trainGameData$total_xp_difference,
     xlab="Game Outcome (Radiant Win = 1.0)",
     ylab="Radiant's XP Advantage",
     main="Radiant's XP Advantage by Game Outcome") #trend
plot(trainGameData$total_gold_difference, trainGameData$total_xp_difference)

boxplotGold <- boxplot(as.numeric(trainGameData$total_gold_difference) ~ 
          trainGameData$radiant_win, col="blue",
        xlab='Radiant Win',
        ylab="Radiant's Gold Advantage",
        main="Game Outcome by Radiant's Gold Advantage") #trend

length(boxplotGold$out)
#[1] 616


boxplotXP <- boxplot(as.numeric(trainGameData$total_xp_difference) ~ 
          trainGameData$radiant_win, col="blue",
        xlab='Radiant Win',
        ylab="Radiant's XP Advantage",
        main="Game Outcome by Radiant's XP Advantage") #trend

length(boxplotXP$out)
#[1] 610






#model#####################

#do not need to specify as columns in the data frame
formula <- radiant_win ~ as.numeric(total_gold_difference) +
  as.numeric(total_xp_difference)

glm1 <- glm(formula, data=trainGameData, family="binomial")
glm1

#Call:  glm(formula = radiant_win ~ as.numeric(trainGameData$total_gold_difference) + 
#             as.numeric(trainGameData$total_xp_difference), family = binomial, 
#           data = trainGameData)

#Coefficients:
#  (Intercept)  as.numeric(trainGameData$total_gold_difference)  
#1.528e-01                                        1.611e-04  
#as.numeric(trainGameData$total_xp_difference)  
#7.829e-05  

#Degrees of Freedom: 9213 Total (i.e. Null);  9211 Residual
#Null Deviance:	    12750 
#Residual Deviance: 9553 	AIC: 9559

summary(glm1)

#Call:
#  glm(formula = radiant_win ~ as.numeric(trainGameData$total_gold_difference) + 
#        as.numeric(trainGameData$total_xp_difference), family = binomial, 
#      data = trainGameData)

#Deviance Residuals: 
#  Min       1Q   Median       3Q      Max  
#-3.6274  -0.9985   0.1512   0.9688   3.2044  

#Coefficients:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)                                     1.528e-01  2.484e-02   6.152 7.64e-10 ***
#  as.numeric(trainGameData$total_gold_difference) 1.611e-04  7.620e-06  21.141  < 2e-16 ***
#  as.numeric(trainGameData$total_xp_difference)   7.829e-05  6.796e-06  11.520  < 2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#(Dispersion parameter for binomial family taken to be 1)

#Null deviance: 12747.5  on 9213  degrees of freedom
#Residual deviance:  9552.5  on 9211  degrees of freedom
#AIC: 9558.5

#Number of Fisher Scoring iterations: 5



#assess accuracy

prob <- predict(glm1, newdata=trainGameData, type="response")
prob <- round(prob,3)*100   # Get percentages
prob
trainGameData$prob_of_winning <- prob
etab <- table(prob, trainGameData$radiant_win)
sum(etab)
#[1] 9214

x1 <- etab[,1]
x2 <- etab[,2]
y1 <- subset(x1, as.numeric(names(x1)) <= 50)
y2 <- subset(x2, as.numeric(names(x2)) <= 50)

sum(y1)
#[1] 2760
sum(y2)
#[1] 915

percent_correct_lose <- sum(y1) / (sum(y1)+sum(y2))
percent_correct_lose
#[1] 0.7510204

#number of observations in the section divided by total number of observations
#because there are different number of observations in both categories (win/loss)


percent_correct_lose_weight <- (sum(y1) + sum(y2)) / sum(etab)
percent_correct_lose_weight
#[1] 0.3988496


z1 <- subset(x1, as.numeric(names(x1)) > 50)
z2 <- subset(x2, as.numeric(names(x2)) > 50)

sum(z1)
#[1] 1603
sum(z2)
#[1] 3936

percent_correct_win <- sum(z2) / (sum(z1)+sum(z2))
percent_correct_win
#[1] 0.7105976

percent_correct_win_weight <- (sum(z1) + sum(z2)) / sum(etab)
percent_correct_win_weight
#[1] 0.6011504

accuracy <- percent_correct_lose * percent_correct_lose_weight + percent_correct_win * percent_correct_win_weight
accuracy
#[1] 0.7267202


#apply to test set

prob2 <- predict(glm1, newdata=testGameData, type="response")
prob2 <- round(prob2,3)*100   # Get percentages
prob2

#assess accuracy

testGameData$prob_of_winning <- prob2
etab <- table(prob2, testGameData$radiant_win)
sum(etab)
#[1] 6143

x1 <- etab[,1]
x2 <- etab[,2]
y1 <- subset(x1, as.numeric(names(x1)) <= 50)
y2 <- subset(x2, as.numeric(names(x2)) <= 50)

sum(y1)
#[1] 1866
sum(y2)
#[1] 592

percent_correct_lose <- sum(y1) / (sum(y1)+sum(y2))
percent_correct_lose
#[1] 0.7591538

#number of observations in the section divided by total number of observations
#because there are different number of observations in both categories (win/loss)


percent_correct_lose_weight <- (sum(y1) + sum(y2)) / sum(etab)
percent_correct_lose_weight
#[1] 0.4001302


z1 <- subset(x1, as.numeric(names(x1)) > 50)
z2 <- subset(x2, as.numeric(names(x2)) > 50)

sum(z1)
#[1] 1024
sum(z2)
#[1] 2661

percent_correct_win <- sum(z2) / (sum(z1)+sum(z2))
percent_correct_win
#[1] 0.7221167

percent_correct_win_weight <- (sum(z1) + sum(z2)) / sum(etab)
percent_correct_win_weight
#[1] 0.5998698

accuracy <- percent_correct_lose * percent_correct_lose_weight + percent_correct_win * percent_correct_win_weight
accuracy
#[1] 0.7369364


#spinning 3d scatterplot



library(rgl)


tgd_rw <- testGameData
tgd_rw$prob_of_winning <- NULL
tgd_rw$radiant_win <- as.numeric(tgd_rw$radiant_win)
tgd_rw$observation <- TRUE

tgd_pow <- testGameData
tgd_pow$radiant_win <- NULL
tgd_pow$radiant_win <- tgd_pow$prob_of_winning / 100
tgd_pow$prob_of_winning <- NULL
tgd_pow$observation <- FALSE

tgd_for_plot <- rbind(tgd_rw, tgd_pow)

#view 1
par3d(cex=1.5)

plot3d(tgd_for_plot$total_gold_difference, 
       tgd_for_plot$total_xp_difference,
       tgd_for_plot$radiant_win, 
       xlab = "Radiant's Gold Advantage",
       ylab = "Radiant's XP Advantage",
       zlab = "Game Outcome (1.0 = Radiant Win)",
       col=colors, 
       main="Actual vs. Real Game Outcome by the Radiant's Gold and XP Advantages",size=3, axes=TRUE)
grid3d("z+", col = "gray", lty = 1, n = 4)
grid3d("Z-", col = "gray", lty = 1, n = 4)
grid3d("x+", col = "gray", lty = 1, n = 4)
grid3d("x-", col = "gray", lty = 1, n = 4)


legend3d("topright", legend = paste(c('Actual', 'Predicted')), pch = 16, col = c("#E69F00", "#999999"), cex=2, inset=c(0.02))

#view 2

par3d(cex=1.0)

plot3d(tgd_for_plot$total_gold_difference, 
       tgd_for_plot$total_xp_difference,
       tgd_for_plot$radiant_win, 
       xlab = "Radiant's Gold Advantage",
       ylab = "Radiant's XP Advantage",
       zlab = "Game Outcome (1.0 = Radiant Win)",
       col=colors, 
       size=3, axes=TRUE)
grid3d("z+", col = "gray", lty = 1, n = 4)
grid3d("Z-", col = "gray", lty = 1, n = 4)
grid3d("x+", col = "gray", lty = 1, n = 4)
grid3d("x-", col = "gray", lty = 1, n = 4)


legend3d("topright", legend = paste(c('Actual', 'Predicted')), pch = 16, col = c("#E69F00", "#999999"), cex=2, inset=c(0.02))


#view 3

par3d(cex=2.0)

plot3d(tgd_for_plot$total_gold_difference, 
       tgd_for_plot$total_xp_difference,
       tgd_for_plot$radiant_win, 
       xlab = "Radiant's Gold Advantage",
       ylab = "Radiant's XP Advantage",
       zlab = "Game Outcome (1.0 = Radiant Win)",
       col=colors, 
       size=3, axes=TRUE)
grid3d("z+", col = "gray", lty = 1, n = 4)
grid3d("Z-", col = "gray", lty = 1, n = 4)
grid3d("x+", col = "gray", lty = 1, n = 4)
grid3d("x-", col = "gray", lty = 1, n = 4)


legend3d("topright", legend = paste(c('Actual', 'Predicted')), pch = 16, col = c("#E69F00", "#999999"), cex=2, inset=c(0.02))











#Second Analysis


#reload the data

setwd("C:/Users/Moonsoo Jo/Desktop/moonsoo jo/school/ucla/extension/data science certificate/machine learning - alfonso berumen/project/dota 2 project -- part 2")
gameData <- read.csv("./data/new - mlcourse/train_features.csv", header=TRUE)
gameDataTargets <- read.csv("./data/new - mlcourse/train_targets.csv", header=TRUE)
gameData$radiant_win <- gameDataTargets$radiant_win






#take a sample of the original data set
n <- nrow(gameData)  
nsample <- round(n*0.25)

set.seed(314)             # Set seed for reproducible results
tindex <- sample(n, nsample) # Create an index

gameData <- gameData[tindex,]  # Create sample set


#feature engineering


gameData$r_total_gold = 'r_total_gold'
gameData$d_total_gold = 'd_total_gold'
gameData$total_gold_difference = 'total_gold_difference'
gameData$r_total_xp = 'r_total_xp'
gameData$d_total_xp = 'd_total_xp'
gameData$total_xp_difference = 'total_xp_difference'
gameData$r_total_kills = 'r_total_kills'
gameData$d_total_kills = 'd_total_kills'
gameData$total_kills_difference = 'total_kills_difference'
gameData$r_total_rune_pick_ups = 'r_total_rune_pick_ups'
gameData$d_total_rune_pick_ups = 'd_total_rune_pick_ups'
gameData$total_rune_pick_ups_difference = 'total_rune_pick_ups_difference'
gameData$r_total_team_fight_participation = 'r_total_team_fight_participation'
gameData$d_total_team_fight_participation = 'd_total_team_fight_participation'
gameData$total_team_fight_participation_difference = 'total_team_fight_participation_difference'
gameData$r_total_assists = 'r_total_assists'
gameData$d_total_assists = 'd_total_assists'
gameData$total_assists_difference = 'total_assists_difference'




###############FUNCTIONS#######################

#gold

calculate_total_gold_radiant <- function(gameData, rowNum) {
  total_gold <- sum(gameData[rowNum, 108], gameData[rowNum, 84], gameData[rowNum, 60], gameData[rowNum, 36], gameData[rowNum, 12])
}
calculate_total_gold_dire <- function(gameData, rowNum) {
  total_gold <- sum(gameData[rowNum, 228], gameData[rowNum, 204], gameData[rowNum, 180], gameData[rowNum, 156], gameData[rowNum, 132])
}
calculate_total_gold_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_gold_difference <- as.numeric(gameData[rowNum,]$r_total_gold) - as.numeric(gameData[rowNum,]$d_total_gold)
}

#xp

calculate_total_xp_radiant <- function(gameData, rowNum) {
  total_xp <- sum(gameData[rowNum, 110], gameData[rowNum, 86], gameData[rowNum, 62], gameData[rowNum, 38], gameData[rowNum, 14])
}
calculate_total_xp_dire <- function(gameData, rowNum) {
  total_xp <- sum(gameData[rowNum, 230], gameData[rowNum, 206], gameData[rowNum, 182], gameData[rowNum, 158], gameData[rowNum, 134])
}
calculate_total_xp_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_xp_difference <- as.numeric(gameData[rowNum,]$r_total_xp) - as.numeric(gameData[rowNum,]$d_total_xp)
}

#kills


calculate_total_kills_radiant <- function(gameData, rowNum) {
  total_kills <- sum(gameData[rowNum, 104], gameData[rowNum, 80], gameData[rowNum, 56], gameData[rowNum, 32], gameData[rowNum, 8])
}
calculate_total_kills_dire <- function(gameData, rowNum) {
  total_kills <- sum(gameData[rowNum, 224], gameData[rowNum, 200], gameData[rowNum, 176], gameData[rowNum, 152], gameData[rowNum, 128])
}
calculate_total_kills_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_kills_difference <- as.numeric(gameData[rowNum,]$r_total_kills) - as.numeric(gameData[rowNum,]$d_total_kills)
}

#rune pick ups

calculate_total_rune_pick_ups_radiant <- function(gameData, rowNum) {
  total_rune_pick_ups <- sum(gameData[rowNum, 120], gameData[rowNum, 96], gameData[rowNum, 72], gameData[rowNum, 48], gameData[rowNum, 24])
}
calculate_total_rune_pick_ups_dire <- function(gameData, rowNum) {
  total_rune_pick_ups <- sum(gameData[rowNum, 240], gameData[rowNum, 216], gameData[rowNum, 192], gameData[rowNum, 168], gameData[rowNum, 144])
}
calculate_total_rune_pick_ups_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_rune_pick_ups_difference <- as.numeric(gameData[rowNum,]$r_total_rune_pick_ups) - as.numeric(gameData[rowNum,]$d_total_rune_pick_ups)
}

#team fight participation

calculate_total_team_fight_participation_radiant <- function(gameData, rowNum) {
  total_team_fight_participation <- sum(gameData[rowNum, 122], gameData[rowNum, 98], gameData[rowNum, 74], gameData[rowNum, 50], gameData[rowNum, 26])
}
calculate_total_team_fight_participation_dire <- function(gameData, rowNum) {
  total_team_fight_participation <- sum(gameData[rowNum, 242], gameData[rowNum, 218], gameData[rowNum, 194], gameData[rowNum, 170], gameData[rowNum, 146])
}
calculate_total_team_fight_participation_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_team_fight_participation_difference <- as.numeric(gameData[rowNum,]$r_total_team_fight_participation) - as.numeric(gameData[rowNum,]$d_total_team_fight_participation)
}

#assists


calculate_total_assists_radiant <- function(gameData, rowNum) {
  total_assists <- sum(gameData[rowNum, 106], gameData[rowNum, 82], gameData[rowNum, 58], gameData[rowNum, 34], gameData[rowNum, 10])
}
calculate_total_assists_dire <- function(gameData, rowNum) {
  total_assists <- sum(gameData[rowNum, 226], gameData[rowNum, 202], gameData[rowNum, 178], gameData[rowNum, 154], gameData[rowNum, 130])
}
calculate_total_assists_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$total_assists_difference <- as.numeric(gameData[rowNum,]$r_total_assists) - as.numeric(gameData[rowNum,]$d_total_assists)
}

#############LOOPS################


#apply functions to every row
for (row in 1:nrow(gameData)) {  
  #gold xp kills runes team_fight assists
  gameData[row,248] <- calculate_total_gold_radiant(gameData, row)
  gameData[row,249] <- calculate_total_gold_dire(gameData, row)
  gameData[row,250] <- calculate_total_gold_difference(gameData, row)
  gameData[row,251] <- calculate_total_xp_radiant(gameData, row)
  gameData[row,252] <- calculate_total_xp_dire(gameData, row)
  gameData[row,253] <- calculate_total_xp_difference(gameData, row)
  gameData[row,254] <- calculate_total_kills_radiant(gameData, row)
  gameData[row,255] <- calculate_total_kills_dire(gameData, row)
  gameData[row,256] <- calculate_total_kills_difference(gameData, row)
  gameData[row,257] <- calculate_total_rune_pick_ups_radiant(gameData, row)
  gameData[row,258] <- calculate_total_rune_pick_ups_dire(gameData, row)
  gameData[row,259] <- calculate_total_rune_pick_ups_difference(gameData, row)
  gameData[row,260] <- calculate_total_team_fight_participation_radiant(gameData, row)
  gameData[row,261] <- calculate_total_team_fight_participation_dire(gameData, row)
  gameData[row,262] <- calculate_total_team_fight_participation_difference(gameData, row)
  gameData[row,263] <- calculate_total_assists_radiant(gameData, row)
  gameData[row,264] <- calculate_total_assists_dire(gameData, row)
  gameData[row,265] <- calculate_total_assists_difference(gameData, row)
}






####################EDA######################

boxplot(as.numeric(gameDataTeamStats$Assists.Difference) ~ 
          gameDataTeamStats$Radiant.Win, col="blue",
        xlab='Radiant Win',
        ylab="Radiant's Assist Advantage",
        main="Game Outcome by Radiant's Assist Advantage") #trend
boxplot(as.numeric(gameDataTeamStats$Kills.Difference) ~ 
          gameDataTeamStats$Radiant.Win, col="blue",
        xlab='Radiant Win',
        ylab="Radiant's Kill Advantage",
        main="Game Outcome by Radiant's Kill Advantage") #trend
boxplot(as.numeric(gameDataTeamStats$Team.Fight.Participation.Difference) ~ 
          gameDataTeamStats$Radiant.Win, col="blue",
        xlab='Radiant Win',
        ylab="Radiant's Team Fight Participation Advantage",
        main="Game Outcome by Radiant's Team Fight Participation Advantage") #no trend
boxplot(as.numeric(gameDataTeamStats$Rune.Pick.Ups.Difference) ~ 
          gameDataTeamStats$Radiant.Win, col="blue",
        xlab='Radiant Win',
        ylab="Radiant's Rune Pick Ups Advantage",
        main="Game Outcome by Radiant's Rune Pick Ups Advantage") #trend



#####################Modeling########################



#Trees
library(tree)
library(ISLR)

gameDataTeamStats=gameData[,c(265,259,256,253,250)]

names(gameDataTeamStats)[1] <- "Assists Difference"
names(gameDataTeamStats)[2] <- "Rune Pick Ups Difference"
names(gameDataTeamStats)[3] <- "Kills Difference"
names(gameDataTeamStats)[4] <- "XP Difference"
names(gameDataTeamStats)[5] <- "Gold Difference"

#gameDataTeamStats[6] <- NULL



Radiant.Win=ifelse(gameData$radiant_win==TRUE,"Yes","No")
gameDataTeamStats=data.frame(gameDataTeamStats,Radiant.Win)
names(gameDataTeamStats)


attach(gameDataTeamStats)
tree.gameDataTeamStats=tree(Radiant.Win~., gameDataTeamStats)
summary(tree.gameDataTeamStats)
# Classification tree:
#   tree(formula = Win ~ as.numeric(total_gold_difference) + as.numeric(total_xp_difference) + 
#          as.numeric(total_assists_difference) + as.numeric(total_team_fight_participation_difference) + 
#          as.numeric(total_rune_pick_ups_difference) + as.numeric(total_kills_difference), 
#        data = gameData)
# Variables actually used in tree construction:
#   [1] "as.numeric(total_gold_difference)"
# Number of terminal nodes:  4 
# Residual mean deviance:  1.092 = 10830 / 9915 
# Misclassification error rate: 0.28 = 2777 / 9919 

#visualize
plot(tree.gameDataTeamStats)
text(tree.gameDataTeamStats,pretty=0)




RNGkind(sample.kind = "Rounding")
set.seed(2)
train=sample(1:nrow(gameDataTeamStats), 5000)
gameDataTeamStats.test=gameDataTeamStats[-train,]
Radiant.Win.test=Radiant.Win[-train]
tree.gameDataTeamStats=tree(Radiant.Win ~ ., gameDataTeamStats, subset=train)
tree.pred=predict(tree.gameDataTeamStats,gameDataTeamStats.test,type="class")
table(tree.pred,Radiant.Win.test)
#         Win.test
# tree.pred   No  Yes
#       No  1617  680
#       Yes  681 1941
(1617+1941)/(1617+680+681+1941)
#[1] 0.7233177

#pruning
set.seed(3)
cv.gameDataTeamStats=cv.tree(tree.gameDataTeamStats,FUN=prune.misclass)
names(cv.gameDataTeamStats)
cv.gameDataTeamStats
# $size
# [1] 4 2 1
# 
# $dev
# [1] 1476 1476 2408
# 
# $k
# [1] -Inf    0  972
# 
# $method
# [1] "misclass"
# 
# attr(,"class")
# [1] "prune"         "tree.sequence"



#cv error
par(mfrow=c(1,2))
plot(cv.gameDataTeamStats$size, cv.gameDataTeamStats$dev,type="b",
     main = "Cross Validation Error Rate by Tree Size",
     xlab = "Tree Size",
     ylab = "Cross Validation Error Rate")
plot(cv.gameDataTeamStats$k, cv.gameDataTeamStats$dev, type="b",
     main = "Cross Validation Error Rate by K",
     xlab = "K",
     ylab = "Cross Validation Error Rate")



prune.gameDataTeamStats=prune.misclass(tree.gameDataTeamStats,best=4)
plot(prune.gameDataTeamStats)
text(prune.gameDataTeamStats,pretty=0)

#test it
tree.pred=predict(prune.gameDataTeamStats,gameDataTeamStats.test, type="class")
table(tree.pred,Radiant.Win.test)








################random forest####################
# Split data set into training set and test set
n <- nrow(gameData)  
ntrain <- round(n*0.6)    # 60% for training set

set.seed(313)             # Set seed for reproducible results
tindex <- sample(n, ntrain) # Create an index



#bagging
library(randomForest)
RNGkind(sample.kind = "Rounding")
set.seed(1)


attach(gameDataTeamStats)
bag.gameDataTeamStats=randomForest(Radiant.Win~.,
                                   data=gameDataTeamStats,subset=tindex, mtry=5, importance=TRUE)
bag.gameDataTeamStats

# Call:
#   randomForest(formula = Radiant.Win ~ ., data = gameDataTeamStats,      mtry = 5, importance = TRUE, subset = tindex) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 5
# 
# OOB estimate of  error rate: 29.83%
# Confusion matrix:
#   No  Yes class.error
# No  1869  935   0.3334522
# Yes  840 2307   0.2669209

bag.gameDataTeamStats=randomForest(Radiant.Win~.,
                                   data=gameDataTeamStats,subset=tindex, mtry=4, importance=TRUE)
bag.gameDataTeamStats

# Call:
#   randomForest(formula = Radiant.Win ~ ., data = gameDataTeamStats,      mtry = 4, importance = TRUE, subset = tindex) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 4
# 
# OOB estimate of  error rate: 29.66%
# Confusion matrix:
#   No  Yes class.error
# No  1873  931   0.3320257
# Yes  834 2313   0.2650143

bag.gameDataTeamStats=randomForest(Radiant.Win~.,
                                   data=gameDataTeamStats,subset=tindex, mtry=3, importance=TRUE)
bag.gameDataTeamStats

# Call:
#   randomForest(formula = Radiant.Win ~ ., data = gameDataTeamStats,      mtry = 3, importance = TRUE, subset = tindex) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 3
# 
# OOB estimate of  error rate: 29.47%
# Confusion matrix:
#   No  Yes class.error
# No  1872  932   0.3323823
# Yes  822 2325   0.2612011

bag.gameDataTeamStats=randomForest(Radiant.Win~.,
                                   data=gameDataTeamStats,subset=tindex, mtry=2, importance=TRUE)
bag.gameDataTeamStats

# Call:
#   randomForest(formula = Radiant.Win ~ ., data = gameDataTeamStats,      mtry = 2, importance = TRUE, subset = tindex) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 2
# 
# OOB estimate of  error rate: 29.36%
# Confusion matrix:
#   No  Yes class.error
# No  1877  927   0.3305991
# Yes  820 2327   0.2605656


bag.gameDataTeamStats=randomForest(Radiant.Win~.,
                                   data=gameDataTeamStats,subset=tindex, mtry=1, importance=TRUE)
bag.gameDataTeamStats
# Call:
#   randomForest(formula = Radiant.Win ~ ., data = gameDataTeamStats,      mtry = 1, importance = TRUE, subset = tindex) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 1
# 
# OOB estimate of  error rate: 28.63%
# Confusion matrix:
#   No  Yes class.error
# No  1879  925   0.3298859
# Yes  779 2368   0.2475373

#one variable still the best

#test set
yhat.bag = predict(bag.gameDataTeamStats,newdata=gameDataTeamStats[-tindex,])
gameDataTeamStats.test=gameDataTeamStats[-tindex,"Radiant.Win"]
plot(yhat.bag, gameDataTeamStats.test, xlab="Predicted Outcome", ylab="Actual Outcome")

correct = 0
incorrect = 0
for (i in 1:length(gameDataTeamStats.test)) {
  if (yhat.bag[i] == gameDataTeamStats.test[i]) {
    correct = correct + 1
  } else {
    incorrect = incorrect + 1
  }
}
correct
incorrect
hit_rate = correct / (correct + incorrect)
hit_rate

#[1] 0.7147177

#more trees
bag.gameDataTeamStats=randomForest(Radiant.Win~.,
                                   data=gameDataTeamStats,subset=tindex, mtry=1, ntree=25)
yhat.bag = predict(bag.gameDataTeamStats, newdata=gameDataTeamStats[-tindex,])

#error rate
correct = 0
incorrect = 0
for (i in 1:length(gameDataTeamStats.test)) {
  if (yhat.bag[i] == gameDataTeamStats.test[i]) {
    correct = correct + 1
  } else {
    incorrect = incorrect + 1
  }
}
correct
incorrect
hit_rate = correct / (correct + incorrect)
hit_rate
#[1] 0.7129536

set.seed(1)
rf.gameDataTeamStats = randomForest(Radiant.Win~.,
                                    data=gameDataTeamStats,
                                    subset=tindex,
                                    mtry=2, importance=TRUE)
yhat.rf=predict(rf.gameDataTeamStats,newdata=gameDataTeamStats[-tindex,])
correct = 0
incorrect = 0
for (i in 1:length(gameDataTeamStats.test)) {
  if (yhat.rf[i] == gameDataTeamStats.test[i]) {
    correct = correct + 1
  } else {
    incorrect = incorrect + 1
  }
}
correct
incorrect
hit_rate = correct / (correct + incorrect)
hit_rate

#[1] 0.7101815
#no improvement

varImpPlot((rf.gameDataTeamStats), main="")



table(gameDataTeamStats$Radiant.Win)
#No  Yes 
#4706 5213 


