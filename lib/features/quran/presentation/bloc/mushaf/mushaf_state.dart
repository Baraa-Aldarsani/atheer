import 'package:equatable/equatable.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';

abstract class MushafState extends Equatable {
  const MushafState();

  @override
  List<Object?> get props => [];
}

class MushafInitial extends MushafState {}

class MushafLoading extends MushafState {}

class MushafLoaded extends MushafState {
  final int currentPage;
  final Map<int, List<Ayah>> pageCache;
  final double fontSize;

  const MushafLoaded({
    required this.currentPage,
    this.pageCache = const {},
    this.fontSize = 22.0,
  });

  List<Ayah> get currentAyahs => pageCache[currentPage] ?? [];

  MushafLoaded copyWith({
    int? currentPage,
    Map<int, List<Ayah>>? pageCache,
    double? fontSize,
  }) {
    return MushafLoaded(
      currentPage: currentPage ?? this.currentPage,
      pageCache: pageCache ?? this.pageCache,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  @override
  List<Object?> get props => [currentPage, pageCache, fontSize];
}

class MushafError extends MushafState {
  final String message;

  const MushafError(this.message);

  @override
  List<Object?> get props => [message];
}
