import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'package:uniparcity/Profil/profil.dart';
import 'dart:io';
import 'dart:convert';

import 'package:uniparcity/University/field_report.dart';

class Universities extends StatefulWidget {
  const Universities({Key? key}) : super(key: key);

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  // The list that contains information about photos
  List _universities = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://62cebc7b826a88972d01f8d7.mockapi.io/university';

    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List universities = json.decode(content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        title: const Text("Universitätsfinder"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.black, width: 1.0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Mehr Informationen')
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Image.asset('assets/HKA_Logo_Gesamt-v_RGB.png',
                                height: 80)),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                const Text('Kosten: '),
                                Row(
                                  children: const [
                                    Icon(Icons.monetization_on, size: 20),
                                    Icon(Icons.monetization_on, size: 20),
                                    Icon(Icons.monetization_on_outlined, size: 20),
                                  ],
                                ),
                              ],
                            ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Flexible(
                      child: Text('Die Hochschule Karlsruhe (Die HKA) ist eine '
                          'der größten Hochschulen für angewandte Wissenschaften '
                          '(Fachhochschule) in Baden-Württemberg. '
                          'Die Studiengänge umfassen technisch-ingenieurwissenschaftliche, '
                          'Informatik- und Wirtschafts- und bauspezifische Disziplinen '
                          'und führen zu den Abschlüssen Bachelor und Master. '
                          'Als erster berufsqualifizierender Abschluss lässt sich '
                          'der Bachelor-Abschluss nach sieben Semestern '
                          'Regelstudienzeit erwerben, der Master-Abschluss nach '
                          'weiteren drei Semestern. Diese Abschlüsse wurden an der '
                          'Hochschule Karlsruhe im Rahmen der Bologna-Reform '
                          'seit 1999 eingeführt.'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/hochschule-karlsruhe-technik-wirtschaft.jpg',
                        height: 250),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.green)),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Like'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.red)),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Dislike'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FieldReport()),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.black, width: 1.0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_downward),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Erfahrungen anderer Studenten')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
