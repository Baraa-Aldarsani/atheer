import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/core/widgets/loading_widget.dart';
import 'package:atheer/core/widgets/empty_widget.dart';
import 'package:atheer/core/widgets/error_widget.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_cubit.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_state.dart';
import 'package:atheer/features/notes/presentation/widgets/note_tile.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _searchController,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'ابحث في الملاحظات...',
              hintTextDirection: TextDirection.rtl,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  context.read<NotesCubit>().clearSearch();
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
            onChanged: (value) {
              context.read<NotesCubit>().search(value);
            },
          ),
        ),
        // Notes list
        Expanded(
          child: BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              if (state is NotesLoading) {
                return const LoadingWidget();
              }

              if (state is NotesError) {
                return AppErrorWidget(
                  message: state.message,
                  onRetry: () => context.read<NotesCubit>().loadNotes(),
                );
              }

              if (state is NotesLoaded) {
                final displayNotes = state.filteredNotes;

                if (displayNotes.isEmpty) {
                  return EmptyWidget(
                    message: state.isSearching
                        ? 'لا توجد نتائج لـ "${state.searchQuery}"'
                        : 'لا توجد ملاحظات',
                    icon: state.isSearching ? Icons.search_off : Icons.note_outlined,
                  );
                }

                return ListView.builder(
                  itemCount: displayNotes.length,
                  padding: const EdgeInsets.only(bottom: 16),
                  itemBuilder: (context, index) {
                    final note = displayNotes[index];
                    return NoteTile(
                      note: note,
                      searchQuery: state.searchQuery,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.reader,
                          arguments: {
                            'surahNumber': note.surahNumber,
                            'initialAyah': note.ayahNumber,
                          },
                        );
                      },
                      onDelete: () {
                        context.read<NotesCubit>().removeNote(note.id);
                      },
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
