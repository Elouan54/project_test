import 'package:flutter/material.dart';

class PrincipalMaster extends StatefulWidget {
  const PrincipalMaster({super.key});

  @override
  State<PrincipalMaster> createState() => _PrincipalMasterState();
}

class _PrincipalMasterState extends State<PrincipalMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu'),
      ),
      body: const Center(
        child: Text(
          'Jeu',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
