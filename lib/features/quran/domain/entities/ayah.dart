import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int number;
  final String text;
  final String? textUthmani;
  final int surahNumber;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;

  const Ayah({
    required this.number,
    required this.text,
    this.textUthmani,
    required this.surahNumber,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
  });

  @override
  List<Object?> get props => [number, text, surahNumber, numberInSurah];
}
