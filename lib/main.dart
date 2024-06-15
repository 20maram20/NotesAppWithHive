import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_by_hive/cubit/addnote/addnote_cubit.dart';
import 'package:notes_app_by_hive/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app_by_hive/screens/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_by_hive/simple_blocobserver.dart';

import 'model/notes_model.dart';


void main() async{
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notesBox');
  // Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => GetNoteCubit(),),
        BlocProvider(create: (context) => AddNoteCubit(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}


