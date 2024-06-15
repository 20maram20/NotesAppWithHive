import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/addnote/addnote_cubit.dart';
import '../cubit/get_notes/get_notes_cubit.dart';
import '../model/notes_model.dart';

class AddNoteForm extends StatefulWidget {

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  TextEditingController controller=TextEditingController();

  TextEditingController controller2=TextEditingController();

  GlobalKey<FormState> formkey=GlobalKey();

  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  String? title;

  String? content;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
    padding: EdgeInsets.only(right: 16,left: 16,top: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(.05),
      ),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if(value==null || value!.isEmpty){
                  return "enter valid title";
                }
              },
              onSaved: (newValue) {
                // context.read<AddNoteCubit>().title=newValue;
                title=newValue;

              },

              controller: context.read<AddNoteCubit>().controller,
              decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder()),),
            SizedBox(height: 10,),
            TextFormField(
              maxLines: 5,
              validator: (value) {
                if(value==null || value!.isEmpty){
                  return "enter valid title";
                }
              },
              onSaved: (newValue) {
                // context.read<AddNoteCubit>().content=newValue;
                content=newValue;

              },
              controller: context.read<AddNoteCubit>().controller2,
              decoration: InputDecoration(
                  hintText: "Content",
                  hintStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder()),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal),),
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      var timestamp=DateTime.now();
                      var format=DateFormat.yMd().format(timestamp);

                      NoteModel notemodel=NoteModel(
                          title!,
                          content!,
                          Colors.teal.value,
                          format
                      );
                       BlocProvider.of<AddNoteCubit>(context).addnote(notemodel);
                      Navigator.of(context).pop();

                       BlocProvider.of<GetNoteCubit>(context).getnotes();

                    }
                    // context.read<AddNoteCubit>().content= context.read<AddNoteCubit>().controller2 as String?;

                  },
                  child: Text("Add"),),
            )

          ],),
      ),
    );

  }
}
