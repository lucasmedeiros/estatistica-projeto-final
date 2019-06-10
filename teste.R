library(corrplot)
library(dplyr)
library(tidyr)
library(gghighlight)

titanic_data  <- 
  na.omit(read.csv("data/train.csv", stringsAsFactors = FALSE)) %>%
  select(-c('Name', 'Ticket','Embarked','Cabin', 'PassengerId'))

## Correlação de todas as variáveis
corrplot(cor(titanic_data), method="pie", tl.col="black", type="lower")

## Análise do gráfico acima
# Escolhemos as três variáveis com maior R-squared (cor^2) para nossos modelos

## Correlações das variáveis escolhidas
cor(titanic_data$Survived, titanic_data$Pclass)
cor(titanic_data$Survived, titanic_data$Fare)
cor(titanic_data$Survived, titanic_data$Sex)

# Montando histograma
gather(titanic_data)%>%
  ggplot(aes(value)) +
    geom_histogram(bins = 10) +
      facet_wrap(~key, scales = 'free_x')

# Criando modelo de regressão linear e calculando o R2
model <- lm(titanic_data$Survived ~ titanic_data$Sex + titanic_data$Pclass + titanic_data$Fare)
rQuadrado <- summary(model)$r.squared
rQuadrado

anova(model)
