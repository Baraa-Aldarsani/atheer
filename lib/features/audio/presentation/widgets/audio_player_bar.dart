import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/features/audio/presentation/bloc/audio_player/audio_player_cubit.dart';
import 'package:atheer/features/audio/presentation/bloc/audio_player/audio_player_state.dart';

class AudioPlayerBar extends StatelessWidget {
  const AudioPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        if (state.status == AudioPlayerStatus.idle || state.playlist.isEmpty) {
          return const SizedBox.shrink();
        }

        final isDark = Theme.of(context).brightness == Brightness.dark;
        final cubit = context.read<AudioPlayerCubit>();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Progress bar
                if (state.duration > Duration.zero)
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 3,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                      activeTrackColor: AppColors.primary,
                      inactiveTrackColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                      thumbColor: AppColors.primary,
                    ),
                    child: Slider(
                      value: state.position.inMilliseconds.toDouble().clamp(
                            0,
                            state.duration.inMilliseconds.toDouble(),
                          ),
                      max: state.duration.inMilliseconds.toDouble(),
                      onChanged: (value) {
                        cubit.seekTo(Duration(milliseconds: value.toInt()));
                      },
                    ),
                  ),
                // Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Speed control
                    TextButton(
                      onPressed: () {
                        final speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
                        final currentIdx = speeds.indexOf(state.speed);
                        final nextIdx = (currentIdx + 1) % speeds.length;
                        cubit.setSpeed(speeds[nextIdx]);
                      },
                      child: Text(
                        '${state.speed}x',
                        style: TextStyle(
                          color: isDark ? AppColors.darkText : AppColors.lightText,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: cubit.previous,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          state.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (state.isPlaying) {
                            cubit.pause();
                          } else if (state.isPaused) {
                            cubit.resume();
                          } else {
                            cubit.play();
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: cubit.next,
                    ),
                    IconButton(
                      icon: Icon(
                        state.isLooping ? Icons.repeat_one : Icons.repeat,
                        color: state.isLooping ? AppColors.primary : null,
                      ),
                      onPressed: cubit.toggleLoop,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
