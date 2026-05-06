import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';
import 'package:atheer/features/notes/domain/usecases/get_notes.dart';
import 'package:atheer/features/notes/domain/usecases/add_note.dart';
import 'package:atheer/features/notes/domain/usecases/update_note.dart';
import 'package:atheer/features/notes/domain/usecases/delete_note.dart';
import 'package:atheer/features/notes/domain/usecases/search_notes.dart';
import 'package:atheer/features/notes/domain/usecases/get_note_for_ayah.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetNotes getNotes;
  final AddNote addNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;
  final SearchNotes searchNotes;
  final GetNoteForAyah getNoteForAyah;

  String _currentQuery = '';

  NotesCubit({
    required this.getNotes,
    required this.addNote,
    required this.updateNote,
    required this.deleteNote,
    required this.searchNotes,
    required this.getNoteForAyah,
  }) : super(NotesInitial());

  Future<void> loadNotes() async {
    emit(NotesLoading());

    final result = await getNotes(const NoParams());

    result.fold(
      (failure) => emit(NotesError(failure.message)),
      (notes) => emit(NotesLoaded(notes, searchQuery: _currentQuery)),
    );
  }

  Future<void> search(String query) async {
    _currentQuery = query;

    if (query.isEmpty) {
      return loadNotes();
    }

    final result = await searchNotes(query);

    result.fold(
      (failure) => emit(NotesError(failure.message)),
      (notes) => emit(NotesLoaded(notes, searchQuery: query)),
    );
  }

  void clearSearch() {
    _currentQuery = '';
    loadNotes();
  }

  Future<Note?> getAyahNote(int ayahNumber) async {
    final result = await getNoteForAyah(ayahNumber);
    return result.fold(
      (failure) => null,
      (note) => note,
    );
  }

  Future<void> createNote(int ayahNumber, int surahNumber, String content) async {
    final result = await addNote(AddNoteParams(
      ayahNumber: ayahNumber,
      surahNumber: surahNumber,
      content: content,
    ));

    result.fold(
      (failure) => emit(NotesError(failure.message)),
      (_) => loadNotes(),
    );
  }

  Future<void> editNote(int id, String content) async {
    final result = await updateNote(UpdateNoteParams(id: id, content: content));

    result.fold(
      (failure) => emit(NotesError(failure.message)),
      (_) => loadNotes(),
    );
  }

  Future<void> removeNote(int id) async {
    final result = await deleteNote(id);

    result.fold(
      (failure) => emit(NotesError(failure.message)),
      (_) => loadNotes(),
    );
  }
}
