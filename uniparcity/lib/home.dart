import 'package:flutter/material.dart';

import 'profil.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Willkommen bei UniPairCity'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profil()),
                  );
                },
                icon: Icon(Icons.person),
              )
            ]),
        body: const Center(
        ),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
