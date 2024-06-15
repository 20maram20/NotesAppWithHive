import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_by_hive/cubit/addnote/addnote_cubit.dart';
import 'package:notes_app_by_hive/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app_by_hive/model/notes_model.dart';

class EditNote extends StatefulWidget {
   EditNote({super.key,required this.note});
   NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();

}

class _EditNoteState extends State<EditNote> {
   String? title,content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),

                child: IconButton(
                     onPressed: () {
                          widget.note.title = title ?? widget.note.title;
                    widget.note.content = content ?? widget.note.content;
                   widget.note.save();
                    BlocProvider.of<GetNoteCubit>(context).getnotes();
                    Navigator.pop(context);
                              },
                         icon:Icon(Icons.check,)),
                                     )
                             ],),
      body:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white.withOpacity(.05),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  title=value;
                },
                validator: (value) {
                  if(value==null || value!.isEmpty){
                    return "enter valid title";
                  }
                },

                controller: context.read<AddNoteCubit>().controller,
                decoration: InputDecoration(
                    hintText: widget.note.title,
                    hintStyle: TextStyle(color: Colors.teal),
                    border: OutlineInputBorder()),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value) {
                  content=value;
                },
                maxLines: 5,
                validator: (value) {
                  if(value==null || value!.isEmpty){
                    return "enter valid content";
                  }
                },
                controller: context.read<AddNoteCubit>().controller2,
                decoration: InputDecoration(
                    hintText: widget.note.content,
                    hintStyle: TextStyle(color: Colors.teal),
                    border: OutlineInputBorder()),),
            ],),
        ),
      )
    );
  }
}
