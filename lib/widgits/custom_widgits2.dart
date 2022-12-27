import 'package:flutter/material.dart';
import 'package:note_app/widgits/custom_widgit.dart';

Widget editNoteViewBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        customAppBar(title: "Edit Note", icon: Icons.done)
      ],
    ),
  );
}
