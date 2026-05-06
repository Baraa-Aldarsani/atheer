import 'package:atheer/features/audio/domain/entities/reciter.dart';

class ReciterModel extends Reciter {
  const ReciterModel({
    required super.identifier,
    required super.name,
    required super.englishName,
    required super.format,
    required super.type,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      format: json['format'] as String,
      type: json['type'] as String,
    );
  }
}
