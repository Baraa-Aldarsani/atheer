import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:atheer/features/audio/domain/usecases/get_surah_audio.dart';
import 'package:atheer/features/audio/presentation/bloc/audio_player/audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final GetSurahAudio getSurahAudio;
  final AudioPlayer _player = AudioPlayer();

  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;
  StreamSubscription<PlayerState>? _playerStateSub;

  AudioPlayerCubit({required this.getSurahAudio}) : super(const AudioPlayerState()) {
    _initListeners();
  }

  void _initListeners() {
    _positionSub = _player.positionStream.listen((position) {
      emit(state.copyWith(position: position));
    });

    _durationSub = _player.durationStream.listen((duration) {
      if (duration != null) {
        emit(state.copyWith(duration: duration));
      }
    });

    _playerStateSub = _player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        _onAyahCompleted();
      }
    });
  }

  Future<void> loadSurahAudio(int surahNumber, {String? reciterId}) async {
    final rid = reciterId ?? state.reciterId;
    emit(state.copyWith(status: AudioPlayerStatus.loading, reciterId: rid));

    final result = await getSurahAudio(
      SurahAudioParams(surahNumber: surahNumber, reciterId: rid),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: AudioPlayerStatus.error,
        errorMessage: failure.message,
      )),
      (audioAyahs) => emit(state.copyWith(
        status: AudioPlayerStatus.stopped,
        playlist: audioAyahs,
        currentIndex: 0,
      )),
    );
  }

  Future<void> play({int? index}) async {
    try {
      final idx = index ?? state.currentIndex;
      if (state.playlist.isEmpty || idx >= state.playlist.length) return;

      final ayah = state.playlist[idx];
      await _player.setUrl(ayah.audioUrl);
      await _player.setSpeed(state.speed);
      await _player.play();

      emit(state.copyWith(
        status: AudioPlayerStatus.playing,
        currentIndex: idx,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AudioPlayerStatus.error,
        errorMessage: 'Failed to play audio: $e',
      ));
    }
  }

  Future<void> pause() async {
    await _player.pause();
    emit(state.copyWith(status: AudioPlayerStatus.paused));
  }

  Future<void> resume() async {
    await _player.play();
    emit(state.copyWith(status: AudioPlayerStatus.playing));
  }

  Future<void> stop() async {
    await _player.stop();
    emit(state.copyWith(status: AudioPlayerStatus.stopped));
  }

  Future<void> next() async {
    if (state.currentIndex < state.playlist.length - 1) {
      await play(index: state.currentIndex + 1);
    }
  }

  Future<void> previous() async {
    if (state.currentIndex > 0) {
      await play(index: state.currentIndex - 1);
    }
  }

  void setSpeed(double speed) {
    _player.setSpeed(speed);
    emit(state.copyWith(speed: speed));
  }

  void toggleLoop() {
    final newLooping = !state.isLooping;
    _player.setLoopMode(newLooping ? LoopMode.one : LoopMode.off);
    emit(state.copyWith(isLooping: newLooping));
  }

  Future<void> seekTo(Duration position) async {
    await _player.seek(position);
  }

  void _onAyahCompleted() {
    if (state.isLooping) {
      play(index: state.currentIndex);
    } else if (state.currentIndex < state.playlist.length - 1) {
      play(index: state.currentIndex + 1);
    } else {
      emit(state.copyWith(status: AudioPlayerStatus.stopped));
    }
  }

  @override
  Future<void> close() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _playerStateSub?.cancel();
    _player.dispose();
    return super.close();
  }
}
