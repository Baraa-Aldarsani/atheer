import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/favorites/domain/entities/favorite.dart';
import 'package:atheer/features/favorites/domain/repositories/favorites_repository.dart';

class GetFavorites extends UseCase<List<Favorite>, NoParams> {
  final FavoritesRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<Favorite>>> call(NoParams params) {
    return repository.getFavorites();
  }
}
