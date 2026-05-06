import 'package:drift/drift.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/database/daos/notes_dao.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';

abstract class NotesLocalDataSource {
  Future<List<Note>> getAllNotes();
  Future<Note?> getNoteForAyah(int ayahNumber);
  Future<Note?> getNoteById(int id);
  Future<List<Note>> searchNotes(String query);
  Future<int> addNote(int ayahNumber, int surahNumber, String content);
  Future<void> updateNote(int id, String content, int ayahNumber, int surahNumber, DateTime createdAt);
  Future<void> deleteNote(int id);
}

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  final NotesDao notesDao;

  NotesLocalDataSourceImpl(this.notesDao);

  @override
  Future<List<Note>> getAllNotes() async {
    try {
      final results = await notesDao.getAllNotes();
      return results.map((n) => Note(
        id: n.id,
        ayahNumber: n.ayahNumber,
        surahNumber: n.surahNumber,
        content: n.content,
        createdAt: n.createdAt,
        updatedAt: n.updatedAt,
      )).toList();
    } catch (e) {
      throw CacheException('Failed to get notes: $e');
    }
  }

  @override
  Future<Note?> getNoteForAyah(int ayahNumber) async {
    try {
      final result = await notesDao.getNoteForAyah(ayahNumber);
      if (result == null) return null;
      return Note(
        id: result.id,
        ayahNumber: result.ayahNumber,
        surahNumber: result.surahNumber,
        content: result.content,
        createdAt: result.createdAt,
        updatedAt: result.updatedAt,
      );
    } catch (e) {
      throw CacheException('Failed to get note: $e');
    }
  }

  @override
  Future<Note?> getNoteById(int id) async {
    try {
      final result = await notesDao.getNoteById(id);
      if (result == null) return null;
      return Note(
        id: result.id,
        ayahNumber: result.ayahNumber,
        surahNumber: result.surahNumber,
        content: result.content,
        createdAt: result.createdAt,
        updatedAt: result.updatedAt,
      );
    } catch (e) {
      throw CacheException('Failed to get note: $e');
    }
  }

  @override
  Future<List<Note>> searchNotes(String query) async {
    try {
      final results = await notesDao.searchNotes(query);
      return results.map((n) => Note(
        id: n.id,
        ayahNumber: n.ayahNumber,
        surahNumber: n.surahNumber,
        content: n.content,
        createdAt: n.createdAt,
        updatedAt: n.updatedAt,
      )).toList();
    } catch (e) {
      throw CacheException('Failed to search notes: $e');
    }
  }

  @override
  Future<int> addNote(int ayahNumber, int surahNumber, String content) async {
    try {
      return await notesDao.addNote(NotesTableCompanion(
        ayahNumber: Value(ayahNumber),
        surahNumber: Value(surahNumber),
        content: Value(content),
      ));
    } catch (e) {
      throw CacheException('Failed to add note: $e');
    }
  }

  @override
  Future<void> updateNote(int id, String content, int ayahNumber, int surahNumber, DateTime createdAt) async {
    try {
      await notesDao.updateNote(NotesTableCompanion(
        id: Value(id),
        ayahNumber: Value(ayahNumber),
        surahNumber: Value(surahNumber),
        content: Value(content),
        createdAt: Value(createdAt),
        updatedAt: Value(DateTime.now()),
      ));
    } catch (e) {
      throw CacheException('Failed to update note: $e');
    }
  }

  @override
  Future<void> deleteNote(int id) async {
    try {
      await notesDao.deleteNote(id);
    } catch (e) {
      throw CacheException('Failed to delete note: $e');
    }
  }
}
