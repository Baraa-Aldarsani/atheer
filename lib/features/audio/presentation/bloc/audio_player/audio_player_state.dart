import 'package:equatable/equatable.dart';
import 'package:atheer/features/audio/domain/entities/audio_ayah.dart';

enum AudioPlayerStatus { idle, loading, playing, paused, stopped, error }

class AudioPlayerState extends Equatable {
  final AudioPlayerStatus status;
  final List<AudioAyah> playlist;
  final int currentIndex;
  final Duration position;
  final Duration duration;
  final double speed;
  final bool isLooping;
  final String? errorMessage;
  final String reciterId;

  const AudioPlayerState({
    this.status = AudioPlayerStatus.idle,
    this.playlist = const [],
    this.currentIndex = 0,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.speed = 1.0,
    this.isLooping = false,
    this.errorMessage,
    this.reciterId = 'ar.alafasy',
  });

  AudioAyah? get currentAyah =>
      playlist.isNotEmpty && currentIndex < playlist.length
          ? playlist[currentIndex]
          : null;

  bool get isPlaying => status == AudioPlayerStatus.playing;
  bool get isPaused => status == AudioPlayerStatus.paused;

  AudioPlayerState copyWith({
    AudioPlayerStatus? status,
    List<AudioAyah>? playlist,
    int? currentIndex,
    Duration? position,
    Duration? duration,
    double? speed,
    bool? isLooping,
    String? errorMessage,
    String? reciterId,
  }) {
    return AudioPlayerState(
      status: status ?? this.status,
      playlist: playlist ?? this.playlist,
      currentIndex: currentIndex ?? this.currentIndex,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      speed: speed ?? this.speed,
      isLooping: isLooping ?? this.isLooping,
      errorMessage: errorMessage ?? this.errorMessage,
      reciterId: reciterId ?? this.reciterId,
    );
  }

  @override
  List<Object?> get props => [status, playlist, currentIndex, position, duration, speed, isLooping, errorMessage, reciterId];
}
