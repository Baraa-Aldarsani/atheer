import 'package:equatable/equatable.dart';

class Tafsir extends Equatable {
  final int ayahNumber;
  final String text;
  final String edition;

  const Tafsir({
    required this.ayahNumber,
    required this.text,
    required this.edition,
  });

  @override
  List<Object> get props => [ayahNumber, text, edition];
}
