# 20231231 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* modifications faites pour sortir la version 1.1 du 20231231
* correction de l'icone sur macOS ARM
* correction de la génération macOS ARM+x64 (universal binary) en export
* autorisation de la saisie ou modification des textes directement depuis l'écran principal (sans fichier texte associé)
* retrait du contrôle d'existence du fichier contenant les titres lors de la génération (qui ne se lance que si des textes sont dans le TMemo)
* ajout de nouvelles fontes de caractères (chiffres, lettres ou symboles) au projet (à usage interne du développeur)
* remplacement du paramètre 'Fonte' par 'FonteName' car l'ID peut évoluer dans le temps contrairement au nom de la fonte choisie
* suppression du TODO.md transféré en GitHub Issues
* ajout du numéro de version dans la barre de titre de la fenêtre principale et de "DEBUG" si on est sur la version de débogage
* publication de la version restreinte 1.1 et ajout de la release GitHub correspondante
