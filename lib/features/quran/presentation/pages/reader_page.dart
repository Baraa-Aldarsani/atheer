import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/widgets/loading_widget.dart';
import 'package:atheer/core/widgets/error_widget.dart';
import 'package:atheer/features/quran/presentation/bloc/reader/reader_cubit.dart';
import 'package:atheer/features/quran/presentation/bloc/reader/reader_state.dart';
import 'package:atheer/features/quran/presentation/widgets/ayah_widget.dart';
import 'package:atheer/features/quran/presentation/widgets/bismillah_widget.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_cubit.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_cubit.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_state.dart';
import 'package:atheer/features/tafsir/presentation/bloc/tafsir_cubit.dart';
import 'package:atheer/features/tafsir/presentation/widgets/tafsir_bottom_sheet.dart';
import 'package:atheer/features/audio/presentation/bloc/audio_player/audio_player_cubit.dart';
import 'package:atheer/features/audio/presentation/bloc/audio_player/audio_player_state.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/injection.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ReaderPage extends StatefulWidget {
  final int surahNumber;
  final int initialAyah;

  const ReaderPage({
    super.key,
    required this.surahNumber,
    this.initialAyah = 1,
  });

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  late ReaderCubit _readerCubit;
  late AudioPlayerCubit _audioPlayerCubit;
  bool _loaded = false;
  bool _didJumpToInitial = false;
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    _readerCubit = sl<ReaderCubit>();
    _audioPlayerCubit = sl<AudioPlayerCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      final args = ModalRoute.of(context);
      Surah? surah;
      if (args != null) {
        final routeArgs = args.settings.arguments as Map<String, dynamic>?;
        surah = routeArgs?['surah'] as Surah?;
      }
      _readerCubit.loadSurah(widget.surahNumber, surah: surah);
    }
  }

  @override
  void dispose() {
    _readerCubit.close();
    _audioPlayerCubit.close();
    super.dispose();
  }

  void _showTafsir(int ayahNumber) {
    final tafsirCubit = sl<TafsirCubit>();
    tafsirCubit.loadTafsir(ayahNumber, surahNumber: widget.surahNumber);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: tafsirCubit,
        child: const TafsirBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _readerCubit),
        BlocProvider.value(value: _audioPlayerCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ReaderCubit, ReaderState>(
            builder: (context, state) {
              return Text(
                state is ReaderLoaded && state.surah != null
                    ? state.surah!.name
                    : 'القرآن الكريم',
                style: GoogleFonts.amiri(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          actions: [
            BlocBuilder<ReaderCubit, ReaderState>(
              builder: (context, state) {
                if (state is! ReaderLoaded) return const SizedBox.shrink();
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Font size controls
                    IconButton(
                      icon: const Icon(Icons.text_decrease_rounded, size: 20),
                      onPressed: () {
                        if (state.fontSize > 16) {
                          _readerCubit.setFontSize(state.fontSize - 2);
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.text_increase_rounded, size: 20),
                      onPressed: () {
                        if (state.fontSize < 40) {
                          _readerCubit.setFontSize(state.fontSize + 2);
                        }
                      },
                    ),
                    // Mushaf view
                    IconButton(
                      icon: const Icon(Icons.auto_stories_rounded, size: 20),
                      tooltip: 'عرض المصحف',
                      onPressed: () {
                        final page = state.ayahs.isNotEmpty
                            ? state.ayahs[state.currentAyahIndex].page
                            : 1;
                        Navigator.pushNamed(
                          context,
                          RouteNames.mushaf,
                          arguments: {'page': page},
                        );
                      },
                    ),
                    // Audio
                    IconButton(
                      icon: const Icon(Icons.play_circle_outline_rounded, size: 22),
                      onPressed: () {
                        _audioPlayerCubit.loadSurahAudio(widget.surahNumber);
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ReaderCubit, ReaderState>(
          builder: (context, state) {
            if (state is ReaderLoading) {
              return const LoadingWidget(message: 'جاري تحميل الآيات...');
            }

            if (state is ReaderError) {
              return AppErrorWidget(
                message: state.message,
                onRetry: () => _readerCubit.loadSurah(widget.surahNumber),
              );
            }

            if (state is ReaderLoaded) {
              final hasBismillah = widget.surahNumber != 9 && widget.surahNumber != 1;
              if (!_didJumpToInitial && widget.initialAyah > 1 && state.ayahs.isNotEmpty) {
                _didJumpToInitial = true;
                final targetAyahIdx = state.ayahs.indexWhere(
                  (a) => a.number == widget.initialAyah || a.numberInSurah == widget.initialAyah,
                );
                if (targetAyahIdx >= 0) {
                  final listIdx = targetAyahIdx + (hasBismillah ? 1 : 0);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _readerCubit.setCurrentAyah(targetAyahIdx);
                    if (_itemScrollController.isAttached) {
                      _itemScrollController.scrollTo(
                        index: listIdx,
                        duration: const Duration(milliseconds: 500),
                        alignment: 0.2,
                      );
                    }
                  });
                }
              }
              return ScrollablePositionedList.builder(
                itemScrollController: _itemScrollController,
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: state.ayahs.length + (hasBismillah ? 1 : 0),
                itemBuilder: (context, index) {
                  if (hasBismillah && index == 0) {
                    return const BismillahWidget();
                  }

                  final ayahIndex = hasBismillah ? index - 1 : index;

                  if (ayahIndex < 0 || ayahIndex >= state.ayahs.length) {
                    return const SizedBox.shrink();
                  }

                  final ayah = state.ayahs[ayahIndex];

                  return BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, favState) {
                      final isFav = favState is FavoritesLoaded &&
                          favState.favoriteAyahNumbers.contains(ayah.number);

                      return BlocBuilder<NotesCubit, NotesState>(
                        builder: (context, notesState) {
                          final hasNote = notesState is NotesLoaded &&
                              notesState.notes.any((n) => n.ayahNumber == ayah.number);

                          return AyahWidget(
                            ayahNumber: ayah.number,
                            numberInSurah: ayah.numberInSurah,
                            text: ayah.textUthmani ?? ayah.text,
                            fontSize: state.fontSize,
                            isHighlighted: state.currentAyahIndex == ayahIndex,
                            isFavorite: isFav,
                            hasNote: hasNote,
                            onTap: () => _readerCubit.setCurrentAyah(ayahIndex),
                            onLongPress: () => _showTafsir(ayah.number),
                            onFavoriteToggle: () {
                              context.read<FavoritesCubit>().toggle(ayah.number, widget.surahNumber);
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
        // ──── Audio player bar ────
        bottomNavigationBar: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
          builder: (context, state) {
            if (state.status == AudioPlayerStatus.idle || state.playlist.isEmpty) {
              return const SizedBox.shrink();
            }

            final cubit = context.read<AudioPlayerCubit>();
            final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
            final borderColor = isDark ? const Color(0xFF2E3338) : AppColors.divider;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border(
                  top: BorderSide(color: borderColor, width: 0.5),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state.duration > Duration.zero)
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 2,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                          activeTrackColor: goldColor,
                          inactiveTrackColor: isDark
                              ? const Color(0xFF2E3338)
                              : AppColors.divider,
                          thumbColor: goldColor,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            final speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
                            final currentIdx = speeds.indexOf(state.speed);
                            final nextIdx = (currentIdx + 1) % speeds.length;
                            cubit.setSpeed(speeds[nextIdx]);
                          },
                          child: Text(
                            '${state.speed}x',
                            style: GoogleFonts.tajawal(
                              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_previous_rounded),
                          onPressed: cubit.previous,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: goldColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              state.isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: isDark ? AppColors.primaryDark : Colors.white,
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
                          icon: const Icon(Icons.skip_next_rounded),
                          onPressed: cubit.next,
                        ),
                        IconButton(
                          icon: Icon(
                            state.isLooping
                                ? Icons.repeat_one_rounded
                                : Icons.repeat_rounded,
                            color: state.isLooping ? goldColor : null,
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
        ),
      ),
    );
  }
}
