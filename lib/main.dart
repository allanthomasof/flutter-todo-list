import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import './pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.task_alt),
          title: Text(
            "Lista de Tarefas",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
