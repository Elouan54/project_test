import 'dart:math';

import 'package:project_test/providers/boss.dart';
import 'package:project_test/providers/ennemis.dart';
import 'package:project_test/providers/joueurs.dart';
import 'package:project_test/screens/functions.dart';

void jeu(Function(String) ajouterMessage, Joueurs joueur, int salle) {
  List<dynamic> plateau = [];

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

  if (partieTerminee(joueur)) {
    ajouterMessage('\n💀 Partie terminée. Merci d\'avoir joué !');
    return;
  }

  int randomNumber = Random().nextInt(4) + 1;
  int adversaireRandomNumber = Random().nextInt(3);

  ajouterMessage('\n--- Vous entrez dans la salle $salle ---');
  ajouterMessage(
      '⚔️  Vos stats : Points de Vie = ${joueur.pointsDeVie}, Attaque = ${joueur.attaque}');

  switch (randomNumber) {
    case 1:
      ajouterMessage(
          '💥 Vous trouvez un artefact ancien qui augmente votre puissance d\'attaque !');
      augmenterAttaque(joueur, 1);
      ajouterMessage(
          '🆙 Votre attaque augmente de 1 point. Nouvelle attaque : ${joueur.attaque}');
      break;

    case 2:
      ajouterMessage(
          '💖 Vous trouvez une potion de soin et gagnez des points de vie !');
      augmenterPV(joueur);
      ajouterMessage(
          '🆙 Votre santé est restaurée. Nouveaux points de vie : ${joueur.pointsDeVie}');
      break;

    case 3:
      Ennemis ennemi = ennemisList[adversaireRandomNumber];
      ajouterMessage(
          '👹 Un ${ennemi.nomEnnemi} se dresse sur votre chemin, prêt à vous attaquer !');
      ajoutDansPlateau(ennemi, plateau);
      rencontreEnnemi(joueur, ennemi);
      suppressionDansPlateau(ennemi, plateau);
      ajouterMessage('  Le combat est terminé.');
      if (partieTerminee(joueur)) {
        ajouterMessage('💀 Vous avez été vaincu par ${ennemi.nomEnnemi}...');
      } else {
        ajouterMessage('🎉 Vous avez vaincu ${ennemi.nomEnnemi} !');
      }
      break;

    case 4:
      Boss boss = bossList[adversaireRandomNumber];
      ajouterMessage(
          '👿 Vous faites face à ${boss.nomBoss}, un puissant boss !');
      ajoutDansPlateau(boss, plateau);
      rencontreBoss(joueur, boss);
      suppressionDansPlateau(boss, plateau);
      if (partieTerminee(joueur)) {
        ajouterMessage('☠️ Vous avez été vaincu par ${boss.nomBoss}...');
      } else {
        ajouterMessage('🎉 Vous avez vaincu ${boss.nomBoss} !');
      }
      break;
  }
}
