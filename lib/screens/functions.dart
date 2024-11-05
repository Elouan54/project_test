import 'package:project_test/providers/boss.dart';
import 'package:project_test/providers/ennemis.dart';
import 'package:project_test/providers/joueurs.dart';

List<dynamic> plateau = [];

void ajoutDansPlateau(dynamic personnage) {
  plateau.add(personnage);
}

void augmenterAttaque(Joueurs joueur, int valeur) {
  joueur.attaque += valeur;
}

void augmenterPV(Joueurs joueur) {
  joueur.pointsDeVie =
      (((100 - joueur.pointsDeVie) * 0.25) + joueur.pointsDeVie).round();
}

void rencontreEnnemi(Joueurs joueur, Ennemis ennemi) {
  bool joueurAJouer = true;
  while (joueur.pointsDeVie > 0 && ennemi.pointsDeVie > 0) {
    if (joueurAJouer) {
      ennemi.pointsDeVie -= joueur.attaque;
      joueurAJouer = false;
    } else {
      joueur.pointsDeVie -= ennemi.attaque;
      joueurAJouer = true;
    }
  }
}

void rencontreBoss(Joueurs joueur, Boss boss) {
  bool joueurAJouer = true;
  while (joueur.pointsDeVie > 0 && boss.pointsDeVie > 0) {
    if (joueurAJouer) {
      boss.pointsDeVie -= joueur.attaque;
      joueurAJouer = false;
    } else {
      joueur.pointsDeVie -= boss.attaque;
      joueurAJouer = true;
    }
  }
}
