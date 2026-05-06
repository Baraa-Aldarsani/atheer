import 'package:drift/drift.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/database/app_database.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.number,
    required super.text,
    super.textUthmani,
    required super.surahNumber,
    required super.numberInSurah,
    required super.juz,
    required super.manzil,
    required super.page,
    required super.ruku,
    required super.hizbQuarter,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json, int surahNumber) {
    return AyahModel(
      number: json['number'] as int,
      text: json['text'] as String,
      textUthmani: json['text'] as String,
      surahNumber: surahNumber,
      numberInSurah: json['numberInSurah'] as int,
      juz: json['juz'] as int,
      manzil: json['manzil'] as int,
      page: json['page'] as int,
      ruku: json['ruku'] as int,
      hizbQuarter: json['hizbQuarter'] as int,
    );
  }

  factory AyahModel.fromTableData(AyahEntry data) {
    return AyahModel(
      number: data.number,
      text: data.ayahText,
      textUthmani: data.ayahTextUthmani,
      surahNumber: data.surahNumber,
      numberInSurah: data.numberInSurah,
      juz: data.juz,
      manzil: data.manzil,
      page: data.page,
      ruku: data.ruku,
      hizbQuarter: data.hizbQuarter,
    );
  }

  AyahsTableCompanion toCompanion() {
    return AyahsTableCompanion(
      number: Value(number),
      ayahText: Value(text),
      ayahTextUthmani: Value(textUthmani),
      surahNumber: Value(surahNumber),
      numberInSurah: Value(numberInSurah),
      juz: Value(juz),
      manzil: Value(manzil),
      page: Value(page),
      ruku: Value(ruku),
      hizbQuarter: Value(hizbQuarter),
    );
  }
}
