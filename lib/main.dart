import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/note_view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);

  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
      home: const NotesView(),
    );
  }
}
