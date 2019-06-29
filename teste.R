library(tidyverse)
library(stats)
library(caTools)
library(car)

startup_dataset <- read_csv(here::here("data/50_startups.csv"),
                            col_types = "dddcd")

names(startup_dataset)[names(startup_dataset) == 'ReD'] <- 'PeD'
names(startup_dataset)[names(startup_dataset) == 'Administration'] <- 'Administracao'
names(startup_dataset)[names(startup_dataset) == 'State'] <- 'Estado'
names(startup_dataset)[names(startup_dataset) == 'Profit'] <- 'Lucro'

set.seed(100)

split = sample.split(startup_dataset$Lucro, SplitRatio = 0.8)

startup_training_set = subset(startup_dataset, split == TRUE)
startup_test_set = subset(startup_dataset, split == FALSE)

regressor = lm(formula = Lucro ~ .,
            data = startup_training_set)
# summary(regressor)

step(regressor, direction = "both")


