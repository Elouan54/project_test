import 'package:flutter/material.dart';
import 'package:project_test/providers/joueurs.dart';
import 'package:project_test/screens/jeu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu de Salle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> messages = [];
  int salle = 1; // Compteur de salle
  Joueurs joueur =
      Joueurs(idJoueur: 1, nomJoueur: 'Joueur', pointsDeVie: 100, attaque: 10);

  void ajouterMessage(String message) {
    setState(() {
      messages.insert(0, message); // Ajoute le message en haut de la liste
    });
  }

  void avancerDansLeJeu() {
    jeu(ajouterMessage, joueur, salle); // Avance d'une salle dans le jeu
    setState(() {
      salle++; // Augmente la salle à chaque clic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de Salle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Affiche les messages dans l'ordre inverse
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    messages[index],
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: avancerDansLeJeu,
              child: Text('Passer à la salle suivante'),
            ),
          ),
        ],
      ),
    );
  }
}
