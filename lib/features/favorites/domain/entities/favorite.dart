import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final int id;
  final int ayahNumber;
  final int surahNumber;
  final DateTime createdAt;
  final String? ayahText;
  final String? surahName;
  final int? numberInSurah;

  const Favorite({
    required this.id,
    required this.ayahNumber,
    required this.surahNumber,
    required this.createdAt,
    this.ayahText,
    this.surahName,
    this.numberInSurah,
  });

  @override
  List<Object?> get props => [id, ayahNumber, surahNumber];
}
