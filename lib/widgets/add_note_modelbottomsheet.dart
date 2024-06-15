import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_by_hive/cubit/addnote/addnote_cubit.dart';
import 'package:notes_app_by_hive/cubit/addnote/addnote_state.dart';
import 'package:notes_app_by_hive/widgets/add_note_form.dart';
class AddNote extends StatelessWidget {
   AddNote({super.key});

   @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>AddNoteCubit() ,
      child: BlocBuilder<AddNoteCubit,AddNoteState>(
        builder:(context, state) {
      if (state is loading){
        return CircularProgressIndicator();
      }
      else if (state is failure){
        return Text( state.error.toString());
      } else{
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddNoteForm(),
        );
      }
    },),);
   }
}
