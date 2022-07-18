import 'package:flutter/material.dart';
import 'package:uniparcity/Model/PlanningItemModel.dart';
import 'package:uniparcity/dataHandler.dart';
import 'package:uniparcity/Profil/profil.dart';

import '../CustomBottomNavBar.dart';

class PlanningList extends StatefulWidget {
  @override
  PlanningListState createState() => new PlanningListState();
}

class PlanningListState extends State<PlanningList> {

  void checkboxChanged(PlanningItem item) {
    //!item.open;
    handler.updatePlanningItem(item);
  }

  List<bool> state = [];

  DataHandler handler = new DataHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
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
                        value: snapshot.data![index].open,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              snapshot.data![index].open = !value!;
                              checkboxChanged(snapshot.data![index]);
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
