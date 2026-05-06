import 'package:equatable/equatable.dart';

class AudioAyah extends Equatable {
  final int ayahNumber;
  final String audioUrl;
  final String reciterId;
  final String? localPath;
  final bool isDownloaded;

  const AudioAyah({
    required this.ayahNumber,
    required this.audioUrl,
    required this.reciterId,
    this.localPath,
    this.isDownloaded = false,
  });

  @override
  List<Object?> get props => [ayahNumber, audioUrl, reciterId];
}
