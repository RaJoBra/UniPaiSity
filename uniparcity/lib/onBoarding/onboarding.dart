import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'package:uniparcity/Profil/profil.dart';
import 'package:ionicons/ionicons.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        title: const Text("Onboarding"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            icon: const Icon(Icons.person),
          )
        ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Das Onboarding Modul wird in einer späteren Version hinzugefügt und ist nicht Teil dieses MVP',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Ionicons.construct_outline),
          ],
        )
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}