import 'package:drift/drift.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/database/tables/notes_table.dart';

part 'notes_dao.g.dart';

@DriftAccessor(tables: [NotesTable])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(super.db);

  Future<List<NotesTableData>> getAllNotes() =>
      (select(notesTable)..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])).get();

  Future<NotesTableData?> getNoteForAyah(int ayahNumber) =>
      (select(notesTable)..where((n) => n.ayahNumber.equals(ayahNumber)))
          .getSingleOrNull();

  Future<NotesTableData?> getNoteById(int id) =>
      (select(notesTable)..where((n) => n.id.equals(id)))
          .getSingleOrNull();

  Future<List<NotesTableData>> getNotesForSurah(int surahNumber) =>
      (select(notesTable)..where((n) => n.surahNumber.equals(surahNumber))).get();

  Future<List<NotesTableData>> searchNotes(String query) =>
      (select(notesTable)
        ..where((n) => n.content.like('%$query%'))
        ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
          .get();

  Future<int> addNote(NotesTableCompanion note) =>
      into(notesTable).insert(note);

  Future<bool> updateNote(NotesTableCompanion note) =>
      update(notesTable).replace(NotesTableData(
        id: note.id.value,
        ayahNumber: note.ayahNumber.value,
        surahNumber: note.surahNumber.value,
        content: note.content.value,
        createdAt: note.createdAt.value,
        updatedAt: DateTime.now(),
      ));

  Future<int> deleteNote(int id) =>
      (delete(notesTable)..where((n) => n.id.equals(id))).go();
}
