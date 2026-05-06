import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getSurahs();
  Future<Either<Failure, List<Ayah>>> getSurahAyahs(int surahNumber);
  Future<Either<Failure, List<Ayah>>> getPageAyahs(int pageNumber);
  Future<Either<Failure, List<Ayah>>> getJuzAyahs(int juzNumber);
  Future<Either<Failure, List<Ayah>>> searchAyahs(String query);
}
