import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/domain/repositories/quran_repository.dart';

class GetJuzAyahs extends UseCase<List<Ayah>, int> {
  final QuranRepository repository;

  GetJuzAyahs(this.repository);

  @override
  Future<Either<Failure, List<Ayah>>> call(int juzNumber) {
    return repository.getJuzAyahs(juzNumber);
  }
}
