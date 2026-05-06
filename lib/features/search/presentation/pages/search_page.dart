import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/core/widgets/loading_widget.dart';
import 'package:atheer/core/widgets/empty_widget.dart';
import 'package:atheer/features/search/presentation/bloc/search_cubit.dart';
import 'package:atheer/features/search/presentation/bloc/search_state.dart';
import 'package:atheer/features/search/presentation/widgets/search_result_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _controller,
            textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'ابحث في القرآن الكريم...',
                hintTextDirection: TextDirection.rtl,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    context.read<SearchCubit>().onSearchChanged('');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              onChanged: (value) {
                context.read<SearchCubit>().onSearchChanged(value);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const EmptyWidget(
                    message: 'ابحث عن كلمة أو آية',
                    icon: Icons.search,
                  );
                }

                if (state is SearchLoading) {
                  return const LoadingWidget();
                }

                if (state is SearchEmpty) {
                  return EmptyWidget(
                    message: 'لا توجد نتائج لـ "${state.query}"',
                    icon: Icons.search_off,
                  );
                }

                if (state is SearchLoaded) {
                  return ListView.builder(
                    itemCount: state.results.length,
                    padding: const EdgeInsets.only(bottom: 16),
                    itemBuilder: (context, index) {
                      final result = state.results[index];
                      return SearchResultTile(
                        result: result,
                        query: state.query,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.reader,
                            arguments: {
                              'surahNumber': result.surahNumber,
                              'initialAyah': result.numberInSurah,
                            },
                          );
                        },
                      );
                    },
                  );
                }

                if (state is SearchError) {
                  return Center(child: Text(state.message));
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      );
  }
}
