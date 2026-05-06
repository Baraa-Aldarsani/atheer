import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/favorites/domain/repositories/favorites_repository.dart';

class ToggleFavorite extends UseCase<bool, ToggleFavoriteParams> {
  final FavoritesRepository repository;

  ToggleFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(ToggleFavoriteParams params) {
    return repository.toggleFavorite(params.ayahNumber, params.surahNumber);
  }
}

class ToggleFavoriteParams {
  final int ayahNumber;
  final int surahNumber;

  const ToggleFavoriteParams({required this.ayahNumber, required this.surahNumber});
}
