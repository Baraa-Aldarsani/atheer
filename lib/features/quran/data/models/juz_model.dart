import 'package:atheer/features/quran/domain/entities/juz.dart';
import 'package:atheer/features/quran/data/models/ayah_model.dart';

class JuzModel extends Juz {
  const JuzModel({required super.number, required super.ayahs});

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    final ayahsList = (json['ayahs'] as List)
        .map((a) => AyahModel.fromJson(a as Map<String, dynamic>, a['surah']['number'] as int))
        .toList();
    return JuzModel(
      number: json['number'] as int,
      ayahs: ayahsList,
    );
  }
}
