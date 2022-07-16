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
  final TextEditingController _textFieldController = TextEditingController();

  String codeDialog = '';
  String valueText = '';

  DataHandler handler = DataHandler();

  void checkboxChanged(PlanningItem item) {
    //!item.open;
    handler.updatePlanningItem(item);
  }

  void addPlanningItem(String description) {
    final itemOne = PlanningItem(
        id: 1.toString(),
        studentId: 1,
        description: 'Handy laden',
        dueDate: 1,
        open: true);
    final newItem = PlanningItem(
        id: 80.toString(),
        studentId: 1,
        description: description,
        dueDate: 1,
        open: false);
    handler.createPlanningItem(newItem);
    handler.updatePlanningItem(itemOne);
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Liste erweitern'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "Füge ein ToDo hinzu"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    addPlanningItem(codeDialog);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
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
        body: Stack(children: <Widget>[
          Card(
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
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title:
                            Text(snapshot.data![index].description.toString()),
                        value: snapshot.data![index].open,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              snapshot.data![index].open = value!;
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _displayTextInputDialog(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),))),
                        child: const Icon(Icons.add)),
                  )
                ],
              )
            ],
          )
        ]),
        bottomNavigationBar: const CustomBottomNavBar());
  }
}
