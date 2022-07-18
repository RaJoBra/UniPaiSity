import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'package:uniparcity/Profil/profil.dart';
import 'package:ionicons/ionicons.dart';

class FieldReport extends StatelessWidget {
  const FieldReport({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset('assets/PICA.jpg', height: 100),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text('Studieren: '),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star_outline, size: 20),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('Stadt: '),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star_outline, size: 20),
                                Icon(Icons.star_outline, size: 20),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('Reisen: '),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star_outline, size: 20),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('Wohnen: '),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star_outline, size: 20),
                                Icon(Icons.star_outline, size: 20),
                                Icon(Icons.star_outline, size: 20),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('Freizeit: '),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star, size: 20),
                                Icon(Icons.star_outline, size: 20),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Luca Sollwedel, 26',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Universität Demacia',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Wirtschaftsinformatik',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Flexible(
                  child: Text(
                      'Die fünf Monate, die ich in Karlsruhe verbracht habe, '
                      'waren mit die besten meines Lebens. '
                      'Das Campusleben, die vielen internationalen Freunde, '
                      'die ich kennen gelernt habe und die vielen Orte, '
                      'die ich gesehen habe, waren wirklich einmalig. '
                      'Ich denke, die Gelegenheit ein Auslandssemester zu machen, '
                      'sei es in Karlsruhe oder anderswo, bereichert immens '
                      'und sollte von jedem versucht werden')),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
