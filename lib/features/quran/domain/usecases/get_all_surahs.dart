import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';
import 'package:atheer/features/quran/domain/repositories/quran_repository.dart';

class GetAllSurahs extends UseCase<List<Surah>, NoParams> {
  final QuranRepository repository;

  GetAllSurahs(this.repository);

  @override
  Future<Either<Failure, List<Surah>>> call(NoParams params) {
    return repository.getSurahs();
  }
}
