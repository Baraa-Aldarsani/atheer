import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';

class NoteEditor extends StatefulWidget {
  final String? initialContent;
  final int ayahNumber;
  final int surahNumber;
  final ValueChanged<String> onSave;

  const NoteEditor({
    super.key,
    this.initialContent,
    required this.ayahNumber,
    required this.surahNumber,
    required this.onSave,
  });

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialContent);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2E3338) : AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'ملاحظة - سورة ${widget.surahNumber} آية ${widget.ayahNumber}',
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            textDirection: TextDirection.rtl,
            maxLines: 5,
            style: GoogleFonts.tajawal(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'اكتب ملاحظتك هنا...',
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  widget.onSave(_controller.text);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? goldColor : AppColors.primary,
                foregroundColor: isDark ? AppColors.primaryDark : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text('حفظ', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
