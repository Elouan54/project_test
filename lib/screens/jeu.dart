import 'dart:math';

import 'package:project_test/providers/boss.dart';
import 'package:project_test/providers/ennemis.dart';
import 'package:project_test/providers/joueurs.dart';
import 'package:project_test/screens/functions.dart';

void jeu() {
  Joueurs joueur =
      Joueurs(idJoueur: 1, nomJoueur: 'Joueur', pointsDeVie: 100, attaque: 20);
  List<dynamic> plateau = [];
  int salle = 1;

  final ennemisList = [
    Ennemis(idEnnemi: 1, nomEnnemi: 'Gobelin', pointsDeVie: 20, attaque: 5),
    Ennemis(idEnnemi: 2, nomEnnemi: 'Archer', pointsDeVie: 10, attaque: 10),
    Ennemis(idEnnemi: 3, nomEnnemi: 'Troll', pointsDeVie: 25, attaque: 15),
  ];

  final bossList = [
    Boss(idBoss: 1, nomBoss: 'BurnMan', pointsDeVie: 60, attaque: 20),
    Boss(idBoss: 2, nomBoss: 'VoidReaper', pointsDeVie: 30, attaque: 30),
    Boss(idBoss: 3, nomBoss: 'GrimFrost', pointsDeVie: 20, attaque: 60),
  ];

  while (!partieTerminee(joueur)) {
    int randomNumber = Random().nextInt(4) + 1;
    int adversaireRandomNumber = Random().nextInt(3);

    print('Vous entrez dans la salle $salle.');
    print('Stats : vie ${joueur.pointsDeVie}  attaque ${joueur.attaque}');
    switch (randomNumber) {
      case 1:
        print('Augmentation de l\'attaque.');
        augmenterAttaque(joueur, 5);
        break;
      case 2:
        print('Augmentation des points de vie.');
        augmenterPV(joueur);
        break;
      case 3:
        Ennemis ennemi = ennemisList[adversaireRandomNumber];
        print('Rencontre d\'un ${ennemi.nomEnnemi}.');
        ajoutDansPlateau(ennemi, plateau);
        rencontreEnnemi(joueur, ennemi);
        suppressionDansPlateau(ennemi, plateau);
        break;
      case 4:
        Boss boss = bossList[adversaireRandomNumber];
        print('Rencontre de ${boss.nomBoss}.');
        ajoutDansPlateau(boss, plateau);
        rencontreBoss(joueur, boss);
        suppressionDansPlateau(boss, plateau);
        break;
    }
    salle++;
    if (partieTerminee(joueur)) {
      print('Partie terminée.');
    }
    break;
  }
}
