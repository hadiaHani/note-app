import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:note_app/widgits/add_note_form.dart';
import 'package:note_app/widgits/custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFauiler) {
            debugPrint("error is ${state.errMessage}");
          } else if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();

            Navigator.pop(context);
            showSnackBar(context, "Note Added Successfully");
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
