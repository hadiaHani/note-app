import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/display_note.dart';
import 'package:note_app/widgits/custom_text_field.dart';

Widget noteItem(BuildContext context, NoteModel note) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NoteDetailes(
          note: note,
        );

        /*  return EditNoteView(
          note: note,
        );*/
      }));
    },
    child: Container(
      height: 245,
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
      decoration: BoxDecoration(
          color: Color(note.color), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  note.delete();

                  BlocProvider.of<NotesCubit>(context).fetchNotes();
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
                note.subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
              note.date,
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
