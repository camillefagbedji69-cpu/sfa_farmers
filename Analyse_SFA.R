## ANALYSE SFA 

#répertoire de travail 

library(readxl)
library(frontier)
library(ggplot2)
library(AER)

##importation des données 

data <- read_xlsx("~/Nouveau Feuille de calcul Microsoft Excel.xlsx")

#modèle 

mod1 <-sfa(log(Recolte) ~ 
             log(Superficie) + log(Depenses) + factor (Niveau) + 
             factor(Vulgarisation) + factor(Importance), data = data)

##Efficience 

data$Efficience <- efficiencies(mod1, asInData = TRUE)

##statistique descriptive 

summary(data$Efficience)


## General Linear model

tobit_model <- tobit(Efficience ~ 
                       Superficie + Depenses + Experience + Sexe + Niveau + 
             Vulgarisation + Importance, left = 0, right = 1, data = data)

summary(tobit_model)

##GRaphique 

p1<- ggplot(data, mapping = aes (x = Experience, y = Efficience))+
  geom_point(aes(colour = Sexe))+
  geom_smooth(method = 'lm', formula = y ~ x)+
  theme_minimal()+
  labs(title = "Efficience en fonction de l'expérience", 
       x = "Année d'expérience", y = "Efficience")

p2 <- ggplot(data, mapping = aes (x = Superficie, y = Efficience))+
  geom_point(aes(colour = Sexe))+
  geom_smooth(method = 'lm', formula = y ~ x)+
  theme_minimal()

##Boxplot

ggplot(data, mapping = aes(x = Experience, y = Efficience, fill = Sexe))+
  geom_boxplot()+
  theme_minimal()
 
## Boxplot  comparative 

ggboxplot(data, x = "Vulgarisation", y = "Efficience",color = "Sexe", 
          palette = "jco")+
  stat_compare_means(mapping = aes(group = Sexe), label = "p.signif")
