import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/providers/boss.dart';
import 'package:project_test/providers/ennemis.dart';
import 'package:project_test/screens/functions.dart';
import 'package:project_test/providers/joueurs.dart';

void main() {
  List<Joueurs> joueursList = [];
  List<Ennemis> ennemisList = [];
  List<Boss> bossList = [];

  setUp(() {
    //Context
    joueursList = [
      Joueurs(
        idJoueur: 1,
        nomJoueur: 'Player1',
        pointsDeVie: 100,
        attaque: 30,
      ),
      Joueurs(
        idJoueur: 2,
        nomJoueur: 'Player2',
        pointsDeVie: 50,
        attaque: 20,
      ),
      Joueurs(
        idJoueur: 3,
        nomJoueur: 'Player3',
        pointsDeVie: 10,
        attaque: 10,
      ),
    ];

    ennemisList = [
      Ennemis(idEnnemi: 1, nomEnnemi: 'Gobelin', pointsDeVie: 20, attaque: 5),
      Ennemis(idEnnemi: 2, nomEnnemi: 'Archère', pointsDeVie: 10, attaque: 10),
      Ennemis(idEnnemi: 3, nomEnnemi: 'Troll', pointsDeVie: 25, attaque: 15),
    ];

    bossList = [
      Boss(idBoss: 1, nomBoss: 'BurnMan', pointsDeVie: 60, attaque: 20),
      Boss(idBoss: 2, nomBoss: 'VoidReaper', pointsDeVie: 30, attaque: 30),
      Boss(idBoss: 3, nomBoss: 'GrimFrost', pointsDeVie: 20, attaque: 60),
    ];
  });

  /* test('Ajout d\'un personnage dans le plateau', () {
    ajoutDansPlateau(joueursList[0]);
    ajoutDansPlateau(ennemisList[0]);
    ajoutDansPlateau(bossList[0]); 
  }); */

  test('Le joueur rentre dans une salle attaque', () {
    //Acte
    for (int i = 0; i < joueursList.length; i++) {
      augmenterAttaque(joueursList[i], 5);
    }
    //Assertion
    expect(joueursList[0].attaque, equals(35));
    expect(joueursList[1].attaque, equals(25));
    expect(joueursList[2].attaque, equals(15));
  });

  test('Le joueur rentre dans une salle PV', () {
    //Acte
    for (int i = 0; i < joueursList.length; i++) {
      augmenterPV(joueursList[i]);
    }
    //Assertion
    expect(joueursList[0].pointsDeVie, equals(100));
    expect(joueursList[1].pointsDeVie, equals(63));
    expect(joueursList[2].pointsDeVie, equals(33));
  });

  test('Le joueur rentre dans une salle ennemi', () {
    //Acte
    for (int i = 0; i < joueursList.length; i++) {
      rencontreEnnemi(joueursList[i], ennemisList[i]);
    }
    //Assertion
    expect(joueursList[0].pointsDeVie, equals(100));
    expect(ennemisList[0].pointsDeVie, lessThanOrEqualTo(0));
    expect(joueursList[1].pointsDeVie, equals(50));
    expect(ennemisList[1].pointsDeVie, lessThanOrEqualTo(0));
    expect(joueursList[2].pointsDeVie, lessThanOrEqualTo(0));
    expect(ennemisList[2].pointsDeVie, equals(15));
  });

  test('Le joueur rentre dans une salle Boss', () {
    //Acte
    for (int i = 0; i < joueursList.length; i++) {
      rencontreBoss(joueursList[i], bossList[i]);
    }
    //Assertion
    expect(joueursList[0].pointsDeVie, equals(80));
    expect(bossList[0].pointsDeVie, lessThanOrEqualTo(0));
    expect(joueursList[1].pointsDeVie, equals(20));
    expect(bossList[1].pointsDeVie, lessThanOrEqualTo(0));
    expect(joueursList[2].pointsDeVie, lessThanOrEqualTo(0));
    expect(bossList[2].pointsDeVie, equals(10));
  });
}
