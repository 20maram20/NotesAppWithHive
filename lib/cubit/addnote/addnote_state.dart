abstract class AddNoteState{}
class Initial extends AddNoteState{}
class loading extends AddNoteState{}
class sucess extends AddNoteState{}
class failure extends AddNoteState{
  String error;
  failure(this.error);
}
