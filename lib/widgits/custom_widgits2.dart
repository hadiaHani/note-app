import 'package:flutter/material.dart';
import 'package:note_app/widgits/custom_text_field.dart';
import 'package:note_app/widgits/custom_widgit.dart';

Widget editNoteViewBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        customAppBar(title: "Edit Note", icon: Icons.done),
        const SizedBox(
          height: 50,
        ),
        const CustomTextField(hint: "Title"),
        const SizedBox(
          height: 16,
        ),
        const CustomTextField(
          hint: "Content",
          maxLines: 5,
        )
      ],
    ),
  );
}
