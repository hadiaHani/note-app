import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgits/custom_button.dart';
import 'package:note_app/widgits/note_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          customAppBar(title: "Note", icon: Icons.search, onPressed: () {}),
          Expanded(child: notesListView())
        ],
      ),
    );
  }
}

Widget notesListView() {
  return BlocBuilder<NotesCubit, NotesState>(
    builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: notes.isEmpty
            ? const Center(
                child: Text(
                "There is no Notes ,, add Now 🤩💜!",
                style: TextStyle(fontSize: 18),
              ))
            : ListView.builder(
                itemCount: notes.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: noteItem(context, notes[index]),
                    )),
      );
    },
  );
}
