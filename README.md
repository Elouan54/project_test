# Roguelike - Jeu de Simulation de Salles Aléatoires

Ce projet est un exercice de roguelike simple où le joueur progresse à travers des salles générées de manière aléatoire, affrontant des ennemis, récupérant des points de vie et augmentant ses capacités d'attaque. L'objectif est d'aller aussi loin que possible tout en survivant aux différents défis des salles.

## Fonctionnalités

- **Progression dans les salles** : Le joueur traverse des salles générées aléatoirement avec des types de salles variés.
- **Types de salles** :
  - **Salle de combat (Ennemi)** : Le joueur affronte un ennemi.
  - **Salle de Boss** : Combat contre un ennemi plus puissant avec plus de PV et d'attaque.
  - **Salle de soin** : Restauration de 15% des PV maximums du joueur.
  - **Salle d'amélioration d'attaque** : Augmentation des points d'attaque du joueur.
- **Combat** :
  - Le joueur attaque en premier.
  - Le joueur gagne en réduisant les PV de l'ennemi à zéro.
  - La partie se termine si le joueur atteint zéro PV.
- **Statistiques de fin de partie** : Nombre d'ennemis et de boss vaincus.

## Statistiques et Équilibrage

- **Joueur** :
  - Points de Vie (PV)
  - Points d'Attaque (ATK)
- **Ennemis** :
  - PV et ATK plus faibles que les Boss
- **Boss** :
  - PV et ATK supérieurs aux ennemis normaux

> Ce projet vise un équilibre simple pour expérimenter un jeu roguelike. Libre à vous d'ajuster les valeurs pour plus de challenge ou pour faciliter la progression du joueur.

## Prérequis

- [Flutter](https://flutter.dev/) installé
- SDK Dart installé

## Auteur
Elouan Jeanson

## Licence
Ce projet est sous licence MIT.