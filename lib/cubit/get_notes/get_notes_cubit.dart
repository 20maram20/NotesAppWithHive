import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_by_hive/cubit/get_notes/get_notes_states.dart';
import '../../model/notes_model.dart';

class GetNoteCubit extends Cubit<GetNotesStates>{
  GetNoteCubit():super(Initial());


  getnotes(){
      var notesbox=Hive.box<NoteModel>("notesBox");
      List<NoteModel> noteslist=notesbox.values.toList();
      emit(sucess(noteslist));
  }
  }