import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profil"),
      ),

      bottomNavigationBar: CustomBottomNavBar(),

    );
  }
}