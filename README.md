# Analyse discriminante pour l'amélioration de la satisfaction des étudiants 
 ## Déscription
Ce projet  vise à améliorer la satisfaction des étudiants en restaurant universitaire. Pour cela, une analyse discriminante a été réalisée pour identifier les facteurs influençant la satisfaction des étudiants et proposer des actions concrètes à l'entreprise BETA.

## Données
  Les données utilisées dans ce projet contiennent des informations sur l'âge, le sexe, la qualité des repas, la qualité des services, la propreté et la satisfaction des étudiants  et d'autres facteurs qui sont collectées utilisant une enquête en ligne grâce à google form. 

## Analyse discriminante
  Une analyse discriminante a été effectuée pour sélectionner les variables ayant le plus d'impact sur la satisfaction des étudiants. La méthode de sélection "stepwise" a été utilisée, et le modèle final sélectionné a inclus les variables "âge", "qualité des repas", "qualité des services" et "propreté". Les résultats montrent que l'entreprise BETA doit améliorer la qualité des repas et des services pour augmenter la satisfaction des étudiants, et prendre en compte l'âge des étudiants pour adapter les actions à mettre en place.


## Bibliothèques utilisées
readxl: cette bibliothèque permet de lire les fichiers Excel en R. Dans ce projet, elle a été utilisée pour importer les données du fichier Excel contenant les variables explicatives et la variable à prédire.
knitr: cette bibliothèque permet de créer des rapports dynamiques en R. Elle a été utilisée dans ce projet pour générer des rapports de synthèse à partir du code R et des résultats obtenus.
caTools: cette bibliothèque fournit des fonctions pour diviser des données en ensembles d'apprentissage et de test. Dans ce projet, elle a été utilisée pour diviser les données en ensemble d'entraînement et de test.
klaR: cette bibliothèque fournit des fonctions pour effectuer des analyses discriminatoires en R. Dans ce projet, elle a été utilisée pour construire des modèles d'analyse discriminatoire.

## Procédures utilisées
stepclass: cette procédure est utilisée pour effectuer une sélection de variables à l'aide de la méthode stepwise. Dans ce projet, elle a été utilisée pour sélectionner les variables les plus pertinentes à inclure dans les modèles d'analyse discriminatoire.
model.matrix: cette procédure permet de créer une matrice de modèles à partir de données brutes. Dans ce projet, elle a été utilisée pour transformer les données brutes en une matrice de modèles utilisable pour l'analyse discriminatoire.
kable: cette procédure permet de créer des tableaux formatés en markdown. Elle a été utilisée dans ce projet pour présenter les résultats de l'analyse discriminatoire dans un format facilement lisible.
read_excel: cette procédure est utilisée pour lire les fichiers Excel en R. Dans ce projet, elle a été utilisée pour importer les données du fichier Excel contenant les variables explicatives et la variable à prédire.

## Performance du modèle
Le modèle final a obtenu un taux de classification correcte de 53,06% sur les données d'entraînement, ce qui est un résultat intéressant compte tenu de la complexité des données

## Exucuté le programme
Pour exécuter le programme, vous devez placer les données dans un répertoire et modifier la ligne "setwd("your/path/analyse discriminatoire")" pour définir le répertoire de travail sur celui contenant les données.

## Conclusion
L'analyse discriminante a permis de mettre en évidence les facteurs clés pour améliorer la satisfaction des étudiants et proposer des actions concrètes à l'entreprise BETA. Ce projet peut être utilisé comme base pour des projets futurs visant à améliorer la satisfaction des étudiants en restaurant universitaire.
