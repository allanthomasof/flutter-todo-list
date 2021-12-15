import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newTaskController = TextEditingController();
  var list = [];

  void showSnackBar() {
    final snackBar = SnackBar(
      content: const Text('Digite o nome da tarefa!'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addTask() {
    if (newTaskController.text.isNotEmpty) {
      list.add(newTaskController.text);
      newTaskController.text = "";
      setState(() {});
    } else {
      showSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: newTaskController,
                    decoration: InputDecoration(
                      label: Text("Nome da Tarefa"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(20, 65),
                      ),
                      onPressed: () {
                        addTask();
                      },
                      child: Text(
                        'Adicionar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [for (var item in list) ListItem(item)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ListItem(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      children: [
        Container(
          width: 1000,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.deepPurple),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        )
      ],
    ),
  );
}
