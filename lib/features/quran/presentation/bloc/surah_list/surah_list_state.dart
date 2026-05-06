import 'package:equatable/equatable.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';

abstract class SurahListState extends Equatable {
  const SurahListState();

  @override
  List<Object?> get props => [];
}

class SurahListInitial extends SurahListState {}

class SurahListLoading extends SurahListState {}

class SurahListLoaded extends SurahListState {
  final List<Surah> surahs;
  final List<Surah> filteredSurahs;
  final String searchQuery;

  const SurahListLoaded({
    required this.surahs,
    this.filteredSurahs = const [],
    this.searchQuery = '',
  });

  List<Surah> get displaySurahs => searchQuery.isEmpty ? surahs : filteredSurahs;

  @override
  List<Object?> get props => [surahs, filteredSurahs, searchQuery];
}

class SurahListError extends SurahListState {
  final String message;

  const SurahListError(this.message);

  @override
  List<Object?> get props => [message];
}
