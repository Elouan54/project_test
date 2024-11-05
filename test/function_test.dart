import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/providers/boss.dart';
import 'package:project_test/providers/ennemis.dart';
import 'package:project_test/providers/joueurs.dart';

void main() {
  List<Joueurs> joueursList = [];
  List<Ennemis> ennemisList = [];
  List<Boss> bossList = [];

  setUp(() {
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
      Ennemis(
          idEnnemi: 1,
          nomEnnemi: 'Gobelin',
          pointsDeVie: 20,
          attaque: 5), // Réduire la vie et l'attaque
      Ennemis(
          idEnnemi: 2,
          nomEnnemi: 'Archère',
          pointsDeVie: 10,
          attaque: 10), // Réduire la vie
      Ennemis(
          idEnnemi: 3,
          nomEnnemi: 'Troll',
          pointsDeVie: 25,
          attaque: 15), // Réduire la vie et l'attaque
    ];

    bossList = [
      Boss(idBoss: 1, nomBoss: 'BurnMan', pointsDeVie: 60, attaque: 20),
      Boss(idBoss: 2, nomBoss: 'VoidReaper', pointsDeVie: 30, attaque: 30),
      Boss(idBoss: 3, nomBoss: 'GrimFrost', pointsDeVie: 20, attaque: 60),
    ];
  });

  test('Le joueur rentre dans une salle attaque', () {
    for (int i = 0; i < joueursList.length; i++) {
      joueursList[i].attaque += 5;
    }
    expect(joueursList[0].attaque, equals(35));
    expect(joueursList[1].attaque, equals(25));
    expect(joueursList[2].attaque, equals(15));
  });

  test('Le joueur rentre dans une salle PV', () {
    for (int i = 0; i < joueursList.length; i++) {
      joueursList[i].pointsDeVie =
          (((100 - joueursList[i].pointsDeVie) * 0.25) +
                  joueursList[i].pointsDeVie)
              .round();
    }
    expect(joueursList[0].pointsDeVie, equals(100));
    expect(joueursList[1].pointsDeVie, equals(63));
    expect(joueursList[2].pointsDeVie, equals(33));
  });

  test('Le joueur rentre dans une salle ennemi', () {
    for (int i = 0; i < joueursList.length; i++) {
      bool joueurAJouer = true;
      while (joueursList[i].pointsDeVie > 0 && ennemisList[i].pointsDeVie > 0) {
        if (joueurAJouer) {
          ennemisList[i].pointsDeVie -= joueursList[i].attaque;
          joueurAJouer = false;
        } else {
          joueursList[i].pointsDeVie -= ennemisList[i].attaque;
          joueurAJouer = true;
        }
      }
    }
    expect(joueursList[0].pointsDeVie, equals(100));
    expect(ennemisList[0].pointsDeVie, lessThan(0));
    expect(joueursList[1].pointsDeVie, equals(50));
    expect(ennemisList[1].pointsDeVie, lessThan(0));
    expect(joueursList[2].pointsDeVie, lessThan(0));
    expect(ennemisList[2].pointsDeVie, equals(15));
  });

  /* test('Le joueur rentre dans une salle Boss', () {
    for (int i = 0; i < joueursList.length; i++) {
      bool joueurAJouer = true;
      while (joueursList[i].pointsDeVie > 0 && ennemisList[i].pointsDeVie > 0) {
        if (joueurAJouer == true) {
          ennemisList[i].pointsDeVie -= joueursList[i].attaque;
          joueurAJouer = false;
        } else {
          joueursList[i].pointsDeVie -= ennemisList[i].attaque;
          joueurAJouer = true;
        }
      }
    }
    expect(joueursList[0].pointsDeVie, equals(95));
    expect(ennemisList[0].pointsDeVie, lessThan(0));
    expect(joueursList[1].pointsDeVie, equals(50));
    expect(ennemisList[1].pointsDeVie, lessThan(0));
    expect(joueursList[2].pointsDeVie, lessThan(0));
    expect(ennemisList[2].pointsDeVie, equals(40));
  }); */
}
