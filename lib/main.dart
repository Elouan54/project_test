import 'package:flutter/material.dart';
import 'package:project_test/screens/jeu.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AccueilScreen(),
    );
  }
}

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil du Jeu'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JeuScreen()),
            );
          },
          child: const Text('Lancer le jeu'),
        ),
      ),
    );
  }
}

class JeuScreen extends StatefulWidget {
  const JeuScreen({super.key});

  @override
  _JeuScreenState createState() => _JeuScreenState();
}

class _JeuScreenState extends State<JeuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu'),
      ),
      body: Column(
        children: [
          /* Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ), */
          ElevatedButton(
            onPressed: () {
              jeu();
            },
            child: const Text('Suivant'),
          ),
        ],
      ),
    );
  }
}
