import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir.dart';

abstract class TafsirRepository {
  Future<Either<Failure, Tafsir>> getAyahTafsir(int ayahNumber, {String edition = 'ar.muyassar'});
}
