import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_by_hive/cubit/addnote/addnote_cubit.dart';
import 'package:notes_app_by_hive/screens/edit_note.dart';
import 'package:notes_app_by_hive/screens/home.dart';
import 'package:notes_app_by_hive/screens/unknown.dart';
import 'package:notes_app_by_hive/widgets/add_note_modelbottomsheet.dart';
import 'package:notes_app_by_hive/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'model/notes_model.dart';

class Routes {
  static const String home = '/home';
  static const String editNote = '/editNote';
  static const String noteItem = '/noteItem';
  static const String addNote = '/addNote';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case editNote:
      // Implement logic to extract data from settings if needed
        final NoteModel note = settings.arguments as NoteModel;
        return MaterialPageRoute(builder: (_) => EditNote(note: note,));
      case noteItem:
      // Extract the note from settings.arguments
        final NoteModel note = settings.arguments as NoteModel;
        return MaterialPageRoute(builder: (_) => NoteItem(note: note));
      case addNote:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddNoteCubit(),
            child: AddNote(),
          ),
        );
      default:
      // Handle unknown routes, you might want to navigate to an error page
        return MaterialPageRoute(builder: (_) => UnknownPage());
    }
  }
}
