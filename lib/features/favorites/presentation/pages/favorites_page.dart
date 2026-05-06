import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/core/widgets/loading_widget.dart';
import 'package:atheer/core/widgets/empty_widget.dart';
import 'package:atheer/core/widgets/error_widget.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_cubit.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:atheer/features/favorites/presentation/widgets/favorite_tile.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const LoadingWidget();
        }

        if (state is FavoritesError) {
          return AppErrorWidget(
            message: state.message,
            onRetry: () => context.read<FavoritesCubit>().loadFavorites(),
          );
        }

        if (state is FavoritesLoaded) {
          if (state.favorites.isEmpty) {
            return const EmptyWidget(
              message: 'لا توجد آيات في المفضلة',
              icon: Icons.favorite_border,
            );
          }

          return ListView.builder(
            itemCount: state.favorites.length,
            padding: const EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              final fav = state.favorites[index];
              return FavoriteTile(
                favorite: fav,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.reader,
                    arguments: {
                      'surahNumber': fav.surahNumber,
                      'initialAyah': fav.ayahNumber,
                    },
                  );
                },
                onRemove: () {
                  context.read<FavoritesCubit>().toggle(fav.ayahNumber, fav.surahNumber);
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
