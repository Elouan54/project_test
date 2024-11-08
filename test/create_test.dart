import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/providers/boss.dart';
import 'package:project_test/providers/ennemis.dart';
import 'package:project_test/providers/joueurs.dart';
import 'package:project_test/providers/salles.dart';
import 'package:project_test/providers/types.dart';

void main() {
  test('Créer un joueur', () {
    //Context
    int idJoueur = 1;
    String nomJoueur = 'Player';
    int pointsDeVie = 100;
    int attaque = 20;
    //Acte
    Joueurs joueur = Joueurs(
      idJoueur: idJoueur,
      nomJoueur: nomJoueur,
      pointsDeVie: pointsDeVie,
      attaque: attaque,
    );
    //Assertion
    expect(joueur.idJoueur, equals(idJoueur));
    expect(joueur.nomJoueur, equals(nomJoueur));
    expect(joueur.pointsDeVie, equals(pointsDeVie));
    expect(joueur.attaque, equals(attaque));
  });

  test('Créer un ennmi', () {
    //Context
    int idEnnemi = 1;
    String nomEnnemi = 'Ennemi';
    int pointsDeVie = 20;
    int attaque = 10;
    //Acte
    Ennemis ennemi = Ennemis(
      idEnnemi: idEnnemi,
      nomEnnemi: nomEnnemi,
      pointsDeVie: pointsDeVie,
      attaque: attaque,
    );
    //Assertion
    expect(ennemi.idEnnemi, equals(idEnnemi));
    expect(ennemi.nomEnnemi, equals(nomEnnemi));
    expect(ennemi.pointsDeVie, equals(pointsDeVie));
    expect(ennemi.attaque, equals(attaque));
  });

  test('Créer un boss', () {
    //Context
    int idBoss = 1;
    String nomBoss = 'Ennemi';
    int pointsDeVie = 20;
    int attaque = 10;
    //Acte
    Boss boss = Boss(
      idBoss: idBoss,
      nomBoss: nomBoss,
      pointsDeVie: pointsDeVie,
      attaque: attaque,
    );
    //Assertion
    expect(boss.idBoss, equals(idBoss));
    expect(boss.nomBoss, equals(nomBoss));
    expect(boss.pointsDeVie, equals(pointsDeVie));
    expect(boss.attaque, equals(attaque));
  });

  test('Créer plusieurs salles avec différents types', () {
    // Contexte
    List<Types> typesList = [
      Types(idType: 1, nomType: 'Ennemi'),
      Types(idType: 2, nomType: 'Boss'),
      Types(idType: 3, nomType: 'PV'),
      Types(idType: 4, nomType: 'attaque'),
    ];

    List<Salles> sallesList = [
      Salles(idSalle: 1, type: typesList[0]),
      Salles(idSalle: 2, type: typesList[1]),
      Salles(idSalle: 3, type: typesList[2]),
      Salles(idSalle: 4, type: typesList[3]),
    ];

    // Acte & Assertions
    for (int i = 0; i < sallesList.length; i++) {
      Salles salle = sallesList[i];
      Types type = typesList[i];

      expect(salle.type.idType, equals(type.idType));
      expect(salle.type.nomType, equals(type.nomType));
    }
  });
}
