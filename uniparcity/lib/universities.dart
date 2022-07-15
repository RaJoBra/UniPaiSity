import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'package:uniparcity/profil.dart';
import 'dart:io';
import 'dart:convert';

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

    setState(() {
      _universities = universities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.person),
          )
        ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
                )
              )
            ),
            onPressed: () { },
            child: Text('Like'),
          ),
          TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    )
                )
            ),
            onPressed: () { },
            child: Text('Dislike'),
          )]
      ),
        ]),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}