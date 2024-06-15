import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_by_hive/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app_by_hive/cubit/get_notes/get_notes_states.dart';
import 'package:notes_app_by_hive/widgets/add_note_modelbottomsheet.dart';
import 'package:notes_app_by_hive/widgets/note_item.dart';

import '../model/notes_model.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <NoteModel> notelist=[];

  @override
  void initState() {
    BlocProvider.of<GetNoteCubit>(context).getnotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body:BlocBuilder<GetNoteCubit,GetNotesStates>
        (builder: (context, state) {
        if (state is sucess){
          notelist=state.allnotes;
          return ListView.builder(
            itemBuilder: (context, index) => NoteItem(note:notelist[index]),
            itemCount:notelist.length,
          );
        }
        else return CircularProgressIndicator();
      },),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder:(context) => AddNote(),);
      }),
    );
  }
}
