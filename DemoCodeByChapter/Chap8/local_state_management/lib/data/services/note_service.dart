import '../models/note_model.dart';
import '../repository/note_repository.dart';

class NoteService {
  final NoteRepository repository = NoteRepository();

  void createNote(String content) {
    NoteModel note = NoteModel(content: content);
    repository.addNote(note);
  }

  List<NoteModel> fetchNotes() {
    return repository.getNotes();
  }
}
