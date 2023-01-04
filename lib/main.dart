import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/note_view.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(NoteModelAdapter());
  }
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
        home: const NotesView(),
      ),
    );
  }
}
