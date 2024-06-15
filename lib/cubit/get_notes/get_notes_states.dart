import 'package:notes_app_by_hive/model/notes_model.dart';

abstract class GetNotesStates{}
class Initial extends GetNotesStates{}
class loading extends GetNotesStates{}
class sucess extends GetNotesStates{
  List<NoteModel> allnotes;
  sucess(this.allnotes);
}
class failure extends GetNotesStates{
  String error;
  failure(this.error);
}
