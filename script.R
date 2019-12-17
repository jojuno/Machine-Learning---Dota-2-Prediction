#first analysis

#prepare data set

getwd()
setwd("C:/Users/Moonsoo Jo/Desktop/moonsoo jo/ucla/intro to data science/UCLAIntroDataScience-master/project")
dota2GameData <- read.csv("./data/initial test/dota2Test.csv", header=FALSE)

colnames(dota2GameData) <- c('Winning Team', 'Region ID', 'Game Type', 'Matchmaking Type', c(1:113))



dota2GameData$r_carry = 'r_carry'
dota2GameData$r_support = 'r_support'
dota2GameData$r_nuker = 'r_nuker'
dota2GameData$r_disabler = 'r_disabler'
dota2GameData$r_jungler = 'r_jungler'
dota2GameData$r_durable = 'r_durable'
dota2GameData$r_escape = 'r_escape'
dota2GameData$r_pusher = 'r_pusher'
dota2GameData$r_initiator = 'r_initiator'
dota2GameData$d_carry = 'd_carry'
dota2GameData$d_support = 'd_support'
dota2GameData$d_nuker = 'd_nuker'
dota2GameData$d_disabler = 'd_disabler'
dota2GameData$d_jungler = 'd_jungler'
dota2GameData$d_durable = 'd_durable'
dota2GameData$d_escape = 'd_escape'
dota2GameData$d_pusher = 'd_pusher'
dota2GameData$d_initiator = 'd_initiator'
dota2GameData$r_team_composition = 'r_team_composition'
dota2GameData$d_team_composition = 'd_team_composition'
dota2GameData$team_composition_difference = 'team_composition_difference'

#game does not have a character with one of the IDs
dota2GameData[, 28] <- NULL

#create a chart mapping the characters to roles


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
           1,0,1,0,0,0,1,0,0
)


hero_to_roles <- matrix(roles, nrow = 112, ncol = 9, byrow=TRUE)

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
                             'Arc Warden')

#functions to calculate the team composition score

calculate_roles_radiant <- function(gameData, rowNum) {
  radiant_hero_columns <- which(gameData[rowNum,]==1, arr.ind=TRUE)
  
  radiant_hero_indexes <- radiant_hero_columns[which((radiant_hero_columns[,2]>5) & (radiant_hero_columns[,2]<117)),][,2] - 4
  
  
  radiant_hero_indexes <- hero_to_roles[radiant_hero_indexes,]
  radiant_hero_indexes
  #[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
  #Puck             0    0    1    1    0    0    1    0    1
  #Lich             0    0    0    1    1    0    0    1    1
  #Pugna            1    0    0    0    0    0    1    0    0
  #Night Stalker    1    0    1    1    0    1    0    0    1
  #Lycanthrope      1    0    0    0    1    1    1    1    0
  
  
  radiant_hero_roles <- colSums(radiant_hero_indexes)
  #[1] 3 0 2 3 2 2 3 2 3
}

calculate_roles_dire <- function(gameData, rowNum) {
  #dire
  dire_hero_columns <- which(gameData[rowNum,]==-1, arr.ind=TRUE)
  
  dire_hero_indexes <- dire_hero_columns[which((dire_hero_columns[,2]>5) & (dire_hero_columns[,2]<117)),][,2] - 4
  
  
  
  
  dire_hero_indexes <- hero_to_roles[dire_hero_indexes,]
  dire_hero_indexes
  #[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
  #Drow Ranger      1    0    0    1    0    0    0    1    0
  #Dragon Knight    0    1    1    1    0    0    0    0    0
  #Jakiro           0    1    1    1    0    0    0    1    0
  #Gyrocopter       1    0    1    1    0    0    0    0    0
  #Terrorblade      1    0    1    0    0    0    0    1    0
  
  dire_hero_roles <- colSums(dire_hero_indexes)
  
}
#team_composition

calculate_team_composition_radiant <- function(gameData, rowNum) {
  
  gameData[rowNum,]$r_team_composition <- as.numeric(var(unname(unlist(dota2GameData[rowNum, 118:126]))) * 4 / 5)
  
}

calculate_team_composition_dire <- function(gameData, rowNum) {
  
  gameData[rowNum,]$d_team_composition <- as.numeric(var(unname(unlist(dota2GameData[rowNum, 127:135]))) * 4 / 5)
  
}

calculate_team_composition_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$team_composition_difference <- as.numeric(gameData[rowNum,]$r_team_composition) - as.numeric(gameData[rowNum,]$d_team_composition)
}

for (row in 1:nrow(dota2GameData)) {
  dota2GameData[row,117:125] <- calculate_roles_radiant(dota2GameData, row)
  dota2GameData[row,126:134] <- calculate_roles_dire(dota2GameData, row)
  dota2GameData[row,135] <- calculate_team_composition_radiant(dota2GameData, row)
  dota2GameData[row,136] <- calculate_team_composition_dire(dota2GameData, row)
  dota2GameData[row,137] <- calculate_team_composition_difference(dota2GameData, row)
}

#filter out games that are not played with regular rules
dota2GameData<-dota2GameData[!(dota2GameData$`Matchmaking Type`==1),]
dota2GameData<-dota2GameData[!(dota2GameData$`Game Type`==1),]
dota2GameData<-dota2GameData[!(dota2GameData$`Game Type`==4),]
dota2GameData<-dota2GameData[!(dota2GameData$`Game Type`==8),]
dota2GameData<-dota2GameData[!(dota2GameData$`Game Type`==9),]


#EDA
plot(dota2GameDataWithResults$team_composition_difference, dota2GameDataWithResults$win_game,
     xlab="Radiant's Team Composition Score Disadvantage",
     ylab='Radiant Win (1.0 = Win)',
     main="Team Composition Disadvantage by Game Outcome") #no trend
boxplot(as.numeric(dota2GameDataWithResults$team_composition_difference) ~ 
          as.numeric(dota2GameDataWithResults$win_game),col="blue",
        xlab='Radiant Win (1 = Win)',
        ylab="Radiant's Team Composition Score Disadvantage",
        main="Game Outcome by Team Composition Disadvantage") #slight trend



#second analysis

#prepare data set

setwd("C:/Users/Moonsoo Jo/Desktop/moonsoo jo/ucla/intro to data science/UCLAIntroDataScience-master/project")
gameData <- read.csv("./data/new - mlcourse/train_features.csv", header=TRUE)
gameDataTargets <- read.csv("./data/new - mlcourse/train_targets.csv", header=TRUE)

#gameData$radiant_win <- gameDataTargets$radiant_win

#take a sample of the original data set
n <- nrow(gameData)
nsample <- round(n*0.5)   

set.seed(314)            
tindex <- sample(n, nsample)

sampleGameData <- gameData[tindex,]  

#create the chart for characters to roles because this data set has more characters
#(the game gets updated over time; this data set was taken at a later time)

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

#add features to the data set

sampleGameData$r_total_gold = 'r_total_gold'
sampleGameData$d_total_gold = 'd_total_gold'
sampleGameData$total_gold_difference = 'total_gold_difference'
sampleGameData$r_total_xp = 'r_total_xp'
sampleGameData$d_total_xp = 'd_total_xp'
sampleGameData$total_xp_difference = 'total_xp_difference'
sampleGameData$r_first_blood_claimed = 'r_first_blood_claimed'
sampleGameData$d_first_blood_claimed = 'd_first_blood_claimed'
sampleGameData$first_blood_claimed_difference = 'first_blood_claimed_difference'




#functions to calculate the features

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

#first blood claimed (to filter out games that are not played by normal rules)

calculate_first_blood_claimed_radiant <- function(gameData, rowNum) {
  first_blood_claimed <- sum(gameData[rowNum, 121], gameData[rowNum, 97], gameData[rowNum, 73], gameData[rowNum, 49], gameData[rowNum, 25])
}
calculate_first_blood_claimed_dire <- function(gameData, rowNum) {
  first_blood_claimed <- sum(gameData[rowNum, 241], gameData[rowNum, 217], gameData[rowNum, 193], gameData[rowNum, 169], gameData[rowNum, 145])
}
calculate_first_blood_claimed_difference <- function(gameData, rowNum) {
  gameData[rowNum,]$first_blood_claimed_difference <- as.numeric(gameData[rowNum,]$r_first_blood_claimed) - as.numeric(gameData[rowNum,]$d_first_blood_claimed)
}


#apply to every row
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

#add real outcomes for measuring accuracy
sampleGameData$radiant_win <- gameDataTargets[tindex,]$radiant_win

#filter out games that are not played by normal rules
sampleGameData<-sampleGameData[!(sampleGameData$first_blood_claimed_difference==0),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==4),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==5),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==12),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==16),]
sampleGameData<-sampleGameData[!(sampleGameData$game_mode==23),]







# Split data set into training set and test set
n <- nrow(sampleGameData)  # Number of observations = 102
ntrain <- round(n*0.6)    # 60% for training set

set.seed(313)           
tindex <- sample(n, ntrain)

trainGameData <- sampleGameData[tindex,]
testGameData <- sampleGameData[-tindex,] 


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
#number of outliers; about 6% of the data


boxplotXP <- boxplot(as.numeric(trainGameData$total_xp_difference) ~ 
                       trainGameData$radiant_win, col="blue",
                     xlab='Radiant Win',
                     ylab="Radiant's XP Advantage",
                     main="Game Outcome by Radiant's XP Advantage") #trend

length(boxplotXP$out)
#[1] 610
#number of outliers; about 6% of the data



#model

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





#######assess accuracy#######

#threshold = 50% -- below 50% predicts 'loss', above 50% predicts 'win'

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

#'section weight'
#number of observations in the section divided by total number of observations
#because there are different number of observations in both categories (win/loss)


percent_correct_lose_weight <- (sum(y1) + sum(y2)) / sum(etab)
percent_correct_lose_weight
#[1] 0.4001302


z1 <- subset(x1, as.numeric(names(x1)) > 50)
-2 <-subset(x2, as.numeric(names(x2)) > 50)

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



#visualize the results


#spinning 3d scatterplot

#with prediction by percentage

library(rgl)

#load prob2 from accuracy assessment

testGameData$prob_of_winning <- prob2


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

colors <- c("#999999", "#E69F00")
colors <- colors[as.factor(tgd_for_plot$observation)]

plot3d(tgd_for_plot$total_gold_difference, 
       tgd_for_plot$total_xp_difference,
       tgd_for_plot$radiant_win, 
       xlab = "Radiant's Gold Advantage",
       ylab = "Radiant's XP Advantage",
       zlab = "Game Outcome (1.0 = Radiant Win)",
       col=colors, 
       main="Actual Outcome vs. Predicted Win Probability by the Radiant's Gold and XP Advantages",size=3, axes=TRUE)
grid3d("z+", col = "gray", lty = 1, n = 4)
grid3d("Z-", col = "gray", lty = 1, n = 4)
grid3d("x+", col = "gray", lty = 1, n = 4)
grid3d("x-", col = "gray", lty = 1, n = 4)

legend3d("topright", legend = paste(c('Actual', 'Predicted')), pch = 16, col = c("#E69F00", "#999999"), cex=2, inset=c(0.02))

#to fix the issue with the resolution of the legend,
#after the window displays the plot initially, make it bigger and rerun the script

#drag with the mouse to view it in different angles

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


#with prediction by threshold

#rw = radiant win
tgd_rw <- testGameData
tgd_rw$prob_of_winning <- NULL
tgd_rw$radiant_win <- as.numeric(tgd_rw$radiant_win)
tgd_rw$observation <- TRUE

#pw = predicted win
tgd_pw <- testGameData
for (row in 1:nrow(tgd_pw)) {
  if (tgd_pw[row,]$prob_of_winning > 50) {
    tgd_pw[row,]$radiant_win <- 1
  } else {
    tgd_pw[row,]$radiant_win <- 0
  }
}
tgd_pw$prob_of_winning <- NULL
tgd_pw$observation <- FALSE

tgd_for_plot2 <- rbind(tgd_rw, tgd_pw)




library(rgl)


par3d(cex=1.5)

colors <- c("#0000FF", "#E69F00")
colors <- colors[as.factor(tgd_for_plot2$observation)]
head(colors)
tail(colors)

plot3d(tgd_for_plot2$total_gold_difference, 
       tgd_for_plot2$total_xp_difference,
       tgd_for_plot2$radiant_win,
       xlab = "Radiant's Gold Advantage",
       ylab = "Radiant's XP Advantage",
       zlab = "Game Outcome (1.0 = Radiant Win)",
       col=colors, 
       main="Actual vs. Predicted Game Outcome by the Radiant's Gold and XP Advantages",size=3, axes=TRUE)
grid3d("z+", col = "gray", lty = 1, n = 4)
grid3d("Z-", col = "gray", lty = 1, n = 4)
grid3d("x+", col = "gray", lty = 1, n = 4)
grid3d("x-", col = "gray", lty = 1, n = 4)

legend3d("topright", legend = paste(c('Actual', 'Predicted')), pch = 16, col = c("#E69F00", "#0000FF"), cex=2, inset=c(0.02))




rgl.postscript("persp3dd.pdf","pdf")


