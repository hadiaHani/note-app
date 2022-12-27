import 'package:flutter/material.dart';
import 'package:note_app/widgits/custom_widgits2.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: editNoteViewBody());
  }
}
