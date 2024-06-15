import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_by_hive/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app_by_hive/model/notes_model.dart';
import 'package:notes_app_by_hive/screens/edit_note.dart';
class NoteItem extends StatelessWidget {
   NoteItem({super.key,required this.note});
 final NoteModel note;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3,horizontal:25 ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(note: note,),));
        },
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(note.title,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                subtitle: Text(note.content,
                  style: TextStyle(color: Colors.grey),),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<GetNoteCubit>(context).getnotes();
                      },
                    icon: Icon(
                      Icons.delete,
                      color: Color(note.color.toInt()),
                      size: 30,)),
              ),
               Padding(
                 padding: const EdgeInsets.only(right: 6),
                 child: Text(note.date),
               )
            ],
          ),),
      ),
    );
  }
}
