import '../models/note_model.dart';

class NoteRepository {
  List<NoteModel> notes = [];

  void addNote(NoteModel note) {
    notes.add(note);
  }

  List<NoteModel> getNotes() {
    return notes;
  }
}
