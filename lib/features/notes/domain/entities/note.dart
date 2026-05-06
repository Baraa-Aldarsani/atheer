import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final int ayahNumber;
  final int surahNumber;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Note({
    required this.id,
    required this.ayahNumber,
    required this.surahNumber,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, ayahNumber, surahNumber, content];
}
