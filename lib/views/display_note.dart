import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/widgits/custom_button.dart';
import 'package:note_app/widgits/custom_text_field.dart';

class NoteDetailes extends StatefulWidget {
  const NoteDetailes({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<NoteDetailes> createState() => _NoteDetailesState();
}

class _NoteDetailesState extends State<NoteDetailes> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            customAppBar(
                title: "Note Detailes",
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icons.arrow_forward_ios_outlined),
            const SizedBox(
              height: 30,
            ),
            noteDetailes(context),
          ],
        ),
      ),
    );
  }

  GestureDetector noteDetailes(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note: widget.note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
            color: Color(widget.note.color),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                widget.note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    widget.note.delete();

                    BlocProvider.of<NotesCubit>(context).fetchNotes();

                    Navigator.pop(context);
                    showSnackBar(
                        context, "The Note has been Deleted Successfully");
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  )),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  widget.note.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
