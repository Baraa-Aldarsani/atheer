import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/widgets/loading_widget.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir_edition.dart';
import 'package:atheer/features/tafsir/presentation/bloc/tafsir_cubit.dart';
import 'package:atheer/features/tafsir/presentation/bloc/tafsir_state.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_cubit.dart';

class TafsirBottomSheet extends StatefulWidget {
  const TafsirBottomSheet({super.key});

  @override
  State<TafsirBottomSheet> createState() => _TafsirBottomSheetState();
}

class _TafsirBottomSheetState extends State<TafsirBottomSheet> {
  final _noteController = TextEditingController();
  bool _isNoteExpanded = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: BlocBuilder<TafsirCubit, TafsirState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF2E3338) : AppColors.divider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Edition switcher
                  if (state is TafsirLoaded) _buildEditionSwitcher(state, isDark),
                  Divider(
                    height: 1,
                    color: isDark ? const Color(0xFF2E3338) : AppColors.divider,
                  ),
                  // Content
                  Expanded(
                    child: _buildContent(state, scrollController, isDark),
                  ),
                  // Notes section
                  if (state is TafsirLoaded) _buildNotesSection(state, isDark),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEditionSwitcher(TafsirLoaded state, bool isDark) {
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: TafsirEdition.all.map((edition) {
          final isSelected = state.currentEdition == edition.id;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(
                edition.name,
                style: GoogleFonts.tajawal(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected
                      ? (isDark ? AppColors.primaryDark : Colors.white)
                      : (isDark ? AppColors.darkText : AppColors.lightText),
                ),
              ),
              selected: isSelected,
              selectedColor: goldColor,
              backgroundColor: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurfaceVariant,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onSelected: (_) {
                context.read<TafsirCubit>().switchEdition(edition.id);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContent(TafsirState state, ScrollController scrollController, bool isDark) {
    if (state is TafsirLoading) {
      return const LoadingWidget();
    }

    if (state is TafsirError) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            state.message,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(color: Theme.of(context).colorScheme.error),
          ),
        ),
      );
    }

    if (state is TafsirLoaded) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(20),
        child: Text(
          state.tafsir.text,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.tajawal(
            fontSize: 16,
            height: 1.9,
            color: isDark ? AppColors.darkText : AppColors.lightText,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildNotesSection(TafsirLoaded state, bool isDark) {
    final hasNote = state.existingNote != null;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final borderColor = isDark ? const Color(0xFF2E3338) : AppColors.divider;

    if (_isNoteExpanded && _noteController.text.isEmpty && hasNote) {
      _noteController.text = state.existingNote!.content;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurfaceVariant,
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isNoteExpanded = !_isNoteExpanded;
                if (_isNoteExpanded && hasNote) {
                  _noteController.text = state.existingNote!.content;
                }
                if (!_isNoteExpanded) {
                  _noteController.clear();
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    hasNote ? Icons.edit_note_rounded : Icons.note_add_rounded,
                    size: 20,
                    color: goldColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    hasNote ? 'تعديل الملاحظة' : 'إضافة ملاحظة',
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w600,
                      color: goldColor,
                    ),
                  ),
                  const Spacer(),
                  if (hasNote && !_isNoteExpanded)
                    Expanded(
                      child: Text(
                        state.existingNote!.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.tajawal(
                          fontSize: 12,
                          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        ),
                      ),
                    ),
                  Icon(
                    _isNoteExpanded ? Icons.expand_more_rounded : Icons.expand_less_rounded,
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (_isNoteExpanded)
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 12,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _noteController,
                    textDirection: TextDirection.rtl,
                    maxLines: 3,
                    style: GoogleFonts.tajawal(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'اكتب ملاحظتك هنا...',
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
                      contentPadding: const EdgeInsets.all(14),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _saveNote(state),
                          icon: const Icon(Icons.save_rounded, size: 18),
                          label: Text('حفظ', style: GoogleFonts.tajawal(fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark ? goldColor : AppColors.primary,
                            foregroundColor: isDark ? AppColors.primaryDark : Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      if (hasNote) ...[
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () => _deleteNote(state),
                          icon: Icon(Icons.delete_outline_rounded, color: Colors.red.shade400),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _saveNote(TafsirLoaded state) {
    final content = _noteController.text.trim();
    if (content.isEmpty) return;

    final notesCubit = context.read<NotesCubit>();

    if (state.existingNote != null) {
      notesCubit.editNote(state.existingNote!.id, content);
    } else {
      notesCubit.createNote(state.ayahNumber, state.surahNumber, content);
    }

    context.read<TafsirCubit>().refreshNote();

    setState(() {
      _isNoteExpanded = false;
      _noteController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حفظ الملاحظة',
          textDirection: TextDirection.rtl,
          style: GoogleFonts.tajawal(),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _deleteNote(TafsirLoaded state) {
    if (state.existingNote == null) return;

    context.read<NotesCubit>().removeNote(state.existingNote!.id);
    context.read<TafsirCubit>().refreshNote();

    setState(() {
      _isNoteExpanded = false;
      _noteController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حذف الملاحظة',
          textDirection: TextDirection.rtl,
          style: GoogleFonts.tajawal(),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
