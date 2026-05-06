import 'package:drift/drift.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';
import 'package:atheer/database/app_database.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.number,
    required super.name,
    required super.englishName,
    required super.englishNameTranslation,
    required super.numberOfAyahs,
    required super.revelationType,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'] as int,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyahs: json['numberOfAyahs'] as int,
      revelationType: json['revelationType'] as String,
    );
  }

  factory SurahModel.fromTableData(SurahsTableData data) {
    return SurahModel(
      number: data.number,
      name: data.name,
      englishName: data.englishName,
      englishNameTranslation: data.englishNameTranslation,
      numberOfAyahs: data.numberOfAyahs,
      revelationType: data.revelationType,
    );
  }

  SurahsTableCompanion toCompanion() {
    return SurahsTableCompanion(
      number: Value(number),
      name: Value(name),
      englishName: Value(englishName),
      englishNameTranslation: Value(englishNameTranslation),
      numberOfAyahs: Value(numberOfAyahs),
      revelationType: Value(revelationType),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'numberOfAyahs': numberOfAyahs,
      'revelationType': revelationType,
    };
  }
}
