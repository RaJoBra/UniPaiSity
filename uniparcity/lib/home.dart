import 'package:flutter/material.dart';
import 'package:uniparcity/UniversityCard.dart';
import 'package:uniparcity/dataHandler.dart';

import 'profil.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool profileExist = false;
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('UniParCity'),
            backgroundColor: Colors.redAccent,
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
        // body:  UniversityCard(),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
