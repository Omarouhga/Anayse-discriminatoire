# Obtenir le chemin du répertoire de travail actuel
getwd()
# Changer le répertoire de travail pour le dossier contenant les données
setwd("D:/TDI/s4/Analyse de données/analyse discriminatoire")

# Charger les bibliothèques nécessaires
library(readxl)
library(knitr)

# Importer les données depuis le fichier Excel
data = read_excel("donnee_AD.xlsx", range ="A1:I493", col_names = TRUE)

# Afficher les premières lignes des données pour s'assurer de l'importation correcte
head(data)

# Renommer les noms de colonnes
names(data) = c("QR", "QSA", "TA", "PR", "age", "sexe", "ETAB", "satisfaction", "DR")

# Réorganiser les colonnes pour avoir la variable "satisfaction" en premier
data = data[, c("satisfaction", "age", "sexe", "ETAB", "DR", "QR", "QSA", "PR", "TA")]

# Afficher les données dans un tableau formaté
knitr::kable(data, align = "c")

# Transformer les variables catégorielles en variables indicatrices
# La variable "sexe"

# Obtenir l'indicateur de sexe en utilisant la fonction model.matrix(), 
#  qui transforme la variable en variables indicatrices
sexe_indicatrice = model.matrix(~ sexe - 1, data = data)

# Afficher l'indicateur de sexe
sexe_indicatrice

# Renommer les colonnes de l'indicateur de sexe pour correspondre aux catégories
colnames(sexe_indicatrice)[1] = "sexeF"
colnames(sexe_indicatrice)[2] = "sexeM"

# Afficher l'indicateur de sexe avec les colonnes renommées
knitr::kable(sexe_indicatrice, align = "c")



# Supprimer la colonne "sexe" qui contient "masculin" et "féminin"
data <- data[, -which(names(data) == "sexe")]

# Afficher les données sans la colonne "sexe"
knitr::kable(data, align = "c")

# Ajouter les deux colonnes "sexeF" et "sexeM" à l'ensemble de données
data <- cbind(data,sexe_indicatrice)

# Afficher les données avec les colonnes "sexeF" et "sexeM"
knitr::kable(data, align = "c")

# Réorganiser les colonnes pour avoir la variable "satisfaction" en premier
data <- data[, c("satisfaction", "age", "sexeF", "sexeM", "ETAB", "DR", "QR", "QSA", "PR", "TA")]

# Afficher les données dans un tableau format
knitr::kable(data, align = "c")


### La variable "ETAB" ###
ETAB_indicatrice <- model.matrix(~ ETAB - 1, data = data)
ETAB_indicatrice
colnames(ETAB_indicatrice)[1] <- "ENCG"
colnames(ETAB_indicatrice)[2] <- "ENSA"
colnames(ETAB_indicatrice)[3] <- "EST"
colnames(ETAB_indicatrice)[4] <- "FEG"
colnames(ETAB_indicatrice)[5] <- "FL"
colnames(ETAB_indicatrice)[6] <- "FP"
colnames(ETAB_indicatrice)[7] <- "FST"

#supprimmer la colonne "ETAB"
data <- data[, -which(names(data) == "ETAB")]
#ajouter les nouvelles colonnes
data=cbind(data,ETAB_indicatrice)

knitr::kable(data, align = "c")
data <- data[, c("satisfaction", "age", "sexeF","sexeM","ENCG","ENSA","EST","FEG","FL","FP","FST","DR","QR","QSA","PR","TA")]
knitr::kable(data, align = "c")

### La variable "TA" ###
TA_indicatrice <- model.matrix(~ TA - 1, data = data)
knitr::kable(TA_indicatrice, align = "c")

# ajouter les colonnes à data
data=cbind(data,TA_indicatrice)
knitr::kable(data, align = "c")

#supprimmer la colonne de "TA"
data <- data[, -which(names(data) == "TA")]
knitr::kable(data, align = "c")
View(data)
# connaitre le type des données
str(data)
#La variable "PR" est de type Chr, il faut le convertir en num
str(data$PR)
data$PR <- as.numeric(data$PR)
str(data$PR)


#### transformer la variable "satsfaction" en factor
for (i in seq_along(data$satisfaction)){
  
if(data$satisfaction[i]==1){
  data$satisfaction[i]<-"s"

}else{data$satisfaction[i]<-"ps"}
 
}
data$satisfaction=as.factor(data$satisfaction)
knitr::kable(data, align = "c")

str(data$satisfaction)
str(data)

#données actifs
data.actif <- subset(data, select = c(1, 2, 12,13,14,15))
#Now our data is ready to be treated like she deserve
# exploration des données
library(psych)

# présentation graphique des données
pairs.panels(data.actif[,-1])

# Diviser les données en un ensemble d'apprentissage et un ensemble de test (70-30)
library(caTools)
set.seed(123)
split = sample.split(data.actif$satisfaction, SplitRatio = 0.7)
train = subset(data.actif, split == TRUE)
head(train)
str(train)
test = subset(data.actif, split == FALSE)
head(test)

# Appliquer l'analyse discriminante
library(klaR)

# Exécuter la sélection de variables stepwise
model <- stepclass(satisfaction ~ ., data = na.omit(train), direction = "backward", method = "lda")

# Afficher les variables sélectionnées
model

