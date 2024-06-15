import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_by_hive/cubit/addnote/addnote_state.dart';

import '../../model/notes_model.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit():super(Initial());

  TextEditingController controller=TextEditingController();

  TextEditingController controller2=TextEditingController();

  GlobalKey<FormState> formkey=GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  String? title;

  String? content;

addnote(NoteModel noteModel)async{
  emit(loading());
try{
  var notesbox=Hive.box<NoteModel>("notesBox");
  await notesbox.add(noteModel);
  emit(sucess());}
    catch(e){
  emit(failure(e.toString()));
    }
}
}