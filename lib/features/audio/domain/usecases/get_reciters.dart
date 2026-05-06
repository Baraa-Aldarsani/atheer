import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/audio/domain/entities/reciter.dart';
import 'package:atheer/features/audio/domain/repositories/audio_repository.dart';

class GetReciters extends UseCase<List<Reciter>, NoParams> {
  final AudioRepository repository;

  GetReciters(this.repository);

  @override
  Future<Either<Failure, List<Reciter>>> call(NoParams params) {
    return repository.getReciters();
  }
}
