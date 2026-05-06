import 'package:equatable/equatable.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';

class PageData extends Equatable {
  final int pageNumber;
  final List<Ayah> ayahs;

  const PageData({required this.pageNumber, required this.ayahs});

  @override
  List<Object> get props => [pageNumber, ayahs];
}
