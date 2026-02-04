import '../data/models/note_model.dart';
import '../data/services/note_service.dart';

class HomeController {
  final NoteService noteService = NoteService();

  void addNewNote(String content) {
    noteService.createNote(content);
  }

  List<NoteModel> getAllNotes() {
    return noteService.fetchNotes();
  }
}
