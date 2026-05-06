import 'package:atheer/features/audio/domain/entities/audio_ayah.dart';

class AudioAyahModel extends AudioAyah {
  const AudioAyahModel({
    required super.ayahNumber,
    required super.audioUrl,
    required super.reciterId,
    super.localPath,
    super.isDownloaded,
  });

  factory AudioAyahModel.fromJson(Map<String, dynamic> json, String reciterId) {
    return AudioAyahModel(
      ayahNumber: json['number'] as int,
      audioUrl: json['audio'] as String? ?? '',
      reciterId: reciterId,
    );
  }
}
