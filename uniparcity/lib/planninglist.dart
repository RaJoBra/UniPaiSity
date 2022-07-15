import 'package:flutter/material.dart';
import 'package:uniparcity/PlanningItemModel.dart';
import 'package:uniparcity/dataHandler.dart';
import 'package:uniparcity/profil.dart';

import 'CustomBottomNavBar.dart';

class PlanningList extends StatefulWidget {
  @override
  PlanningListState createState() => new PlanningListState();
}

class PlanningListState extends State<PlanningList> {
  List<PlanningItem> planningItems = [
    PlanningItem(
        id: 1,
        studentId: 1,
        description: 'Koffer packen',
        dueDate: DateTime.now(),
        open: true)
  ];

  DataHandler handler = new DataHandler();

  void checkboxChanged(bool value, int id) {
    planningItems[id].open = !value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Packliste'),
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
        body: Container(
          child: Card(
            child: FutureBuilder<List<PlanningItem>>(
              future: handler.fetchPlaningItems(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  print(snapshot.data);
                  return Container(
                    child: const Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length ,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title:
                            Text(snapshot.data![index].description.toString()),
                        value: !snapshot.data![index].open,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              snapshot.data![index].open = !value!;
                              checkboxChanged(snapshot.data![index].open,
                                  snapshot.data![index].id);
                            },
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
