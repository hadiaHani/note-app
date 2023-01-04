import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgits/custom_button.dart';
import 'package:note_app/widgits/custom_text_field.dart';
import 'package:note_app/widgits/edit_colors_listview.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.note.title;
    contentController.text = widget.note.subTitle;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          customAppBar(
              title: "Edit Note",
              icon: Icons.done,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;

                widget.note.save();

                BlocProvider.of<NotesCubit>(context).fetchNotes();
                Navigator.pop(context);
                Navigator.pop(context);
                showSnackBar(context, "Note Edited Successfully");
              }),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
              controller: titleController,
              onChanged: (value) {
                title = value;
              }),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            controller: contentController,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditColorsListView(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
