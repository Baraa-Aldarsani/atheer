import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir.dart';
import 'package:atheer/features/tafsir/domain/repositories/tafsir_repository.dart';

class GetAyahTafsir extends UseCase<Tafsir, TafsirParams> {
  final TafsirRepository repository;

  GetAyahTafsir(this.repository);

  @override
  Future<Either<Failure, Tafsir>> call(TafsirParams params) {
    return repository.getAyahTafsir(params.ayahNumber, edition: params.edition);
  }
}

class TafsirParams {
  final int ayahNumber;
  final String edition;

  const TafsirParams({required this.ayahNumber, this.edition = 'ar.muyassar'});
}
