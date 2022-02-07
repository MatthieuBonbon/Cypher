# Cypher

Après des années de gestation et une première version avortée il y a 4 ans, le projet Cypher voit enfin le jour !
Développée en quelques mois sur mon temps libre,
cette application mobile reprend le concept d'une série de vidéos à succès commencée en 2017 par : https://www.youtube.com/watch?v=iXuFg3wv1AA . 

Le concept de ce jeu mobile est simple :
 - On choisit le nombre d'apprentis chanteurs souhaitant tenter l'exercice.
 - On choisit également le nombre de mots aléatoires attribués à chaque joueur.
 - Tout nos apprentis chanteurs notent les mots qui leur sont attribués puis commencent à créer un texte autour de ces mots.
 - Enfin, chaque joueur donne de ses cordes vocales en chantant son texte sur l'une des 5 boucles musicales mises à disposition.

A la fin de la partie, le vainqueur est désigné par ses compères.

Prêt à vous amuser ?

Le jeu est téléchargeable ici : https://gamejolt.com/games/cypher/688986

Point de vue technique :

Le projet est entièrement codé en `Dart`, associé au `Framework Flutter`, via l'IDE `Android Studio`. La partie codé en Dart est accessible ici-même, contrairemnt aux fichiers de configuration générés par Android Studio.

Les mots générés sont extraits de Glawi (http://redac.univ-tlse2.fr/lexiques/glawi.html) via les outils de G-PeTo (Glawi Perl Tools) (http://redac.univ-tlse2.fr/lexiques/glawi/tools/g-peto.html) . Glawi `est un dictionnaire électronique libre du français encodé au format XML. Il s'agit d'une version structurée et normalisée du Wiktionnaire` d'après ses créateurs. D'ailleurs, ses créateurs sont des chercheurs de la Maison de la Recherche, Université Toulouse 2 Jean-Jaurès.

Les boucles musicales ont été crées par Eagle Beatz (https://5euros.com/profil/eagle-beatz).

Projet élaboré avec le soutien de Rostaminho.
