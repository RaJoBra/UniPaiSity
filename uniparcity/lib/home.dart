import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniparcity/feed.dart';
import 'package:uniparcity/planninglist.dart';
import 'package:uniparcity/universities.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Entdecke Universitäten',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                CupertinoButton(
                  minSize: double.minPositive,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Universities()),
                    );
                  },
                  child: Image.asset('assets/universitaet_darmstadt.jpg'),),
                const Text('Deine Reise für dich geplant',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                CupertinoButton(
                  minSize: double.minPositive,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlanningList()),
                    );
                  },
                  child: Image.asset('assets/Koffer-packen.jpg'),),
                const Text('Neuigkeiten von deiner Auslandsuni',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                CupertinoButton(
                  minSize: double.minPositive,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Feed(title: 'Feed')),
                    );
                  },
                  child: Image.asset('assets/Zeitung.jpg'),),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
