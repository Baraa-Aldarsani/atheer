import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  final int ayahNumber;
  final String ayahText;
  final int surahNumber;
  final String surahName;
  final int numberInSurah;

  const SearchResult({
    required this.ayahNumber,
    required this.ayahText,
    required this.surahNumber,
    required this.surahName,
    required this.numberInSurah,
  });

  @override
  List<Object> get props => [ayahNumber, surahNumber, numberInSurah];
}
