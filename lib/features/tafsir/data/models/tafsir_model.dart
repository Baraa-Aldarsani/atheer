import 'package:drift/drift.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir.dart';
import 'package:atheer/database/app_database.dart';

class TafsirModel extends Tafsir {
  const TafsirModel({
    required super.ayahNumber,
    required super.text,
    required super.edition,
  });

  factory TafsirModel.fromJson(Map<String, dynamic> json) {
    return TafsirModel(
      ayahNumber: json['number'] as int,
      text: json['text'] as String,
      edition: (json['edition'] as Map<String, dynamic>)['identifier'] as String,
    );
  }

  factory TafsirModel.fromTableData(TafsirCacheTableData data) {
    return TafsirModel(
      ayahNumber: data.ayahNumber,
      text: data.tafsirText,
      edition: data.edition,
    );
  }

  TafsirCacheTableCompanion toCompanion() {
    return TafsirCacheTableCompanion(
      ayahNumber: Value(ayahNumber),
      tafsirText: Value(text),
      edition: Value(edition),
    );
  }
}
