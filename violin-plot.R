# Violin Plot
library(ggplot2)
library(tidyr)

df <- read.csv('violin-data.csv')
df <- subset(df, Class == "H" | Class == "L", select = c(raisedhands:Class))
df$Class<-replace(df$Class, df$Class=="H", "High Performance Student")
df$Class<-replace(df$Class, df$Class=="L", "Low Performance Student")
df

p <- ggplot(df, aes(x=Class, y=raisedhands, fill = Class)) + 
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, fill ='white')
  labs(title = 'Plot of raised hand by student', x = "Student Performance Level", y = "Rasied Hands")
p  + theme_classic()

