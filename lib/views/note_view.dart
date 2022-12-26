import 'package:flutter/material.dart';
import 'package:note_app/widgits/custom_widgit.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notesViewBody(),
    );
  }
}
