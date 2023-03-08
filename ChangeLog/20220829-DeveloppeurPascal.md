# 20220829 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

## libraries

* déplacement TODO list vers GitHub issues
* ajout librairie d'affichage de texte graphique adaptée depuis la version de VideoTitlePageGenerator

## VideoTitlePageGenerator

* ajout d'une dépendance au projet de DeveloppeurPascal/Librairies
* remplacement de la frame d'affichage de textes graphiques locale par la version open source de DeveloppeurPascal/Librairies
* adaptation du programme suite aux modifications des méthodes d'affichage
* ajout d'une de la fonction de recherche de caractères personnalisée et association de celle-ci en événement de la classe d'affichage graphique
* modification du chargement du ficheir textes pour prendre en charge l'encodage UTF-8 systématiquement
* sauvegarde des infos saisies pour les afficher au lancement suivant
* nommer les fichiers images exportées en fonction du texte affiché
* les textes font l'objet d'un trim() avant leur affichage (élimination des espaces inutiles et des sauts de lignes)
* remplacement des doubles espaces par un seul dans les textes
* mise en place du multilignes sur les textes lorsqu'ils débordent de la zone d'affichage disponible
* sur le filtrage des textes pour générer les noms des images, faire un remplacement des caractères accentués par la version sans accent
* sur le filtrage des textes pour générer les noms des images, faire un remplacement des espaces par un underscore


## librairie

* renammed Texte and Fonte properties,
* added SpaceWidth and LetterSpacing (#13) properties,
* managed SPACE character even if it's not in the font TImageList (#12)


## librairie samples

* mise à jour suite à modifs sur librairie d'affichage graphique des textes

## VideoTitlePageGenerator

* mise à jour suite à modifs sur librairie d'affichage graphique des textes
