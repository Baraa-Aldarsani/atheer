import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/extensions/string_extensions.dart';
import 'package:atheer/features/quran/data/datasources/mushaf_downloader.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/domain/entities/mushaf_metadata.dart';
import 'package:atheer/features/quran/presentation/widgets/mushaf_ayah_picker_sheet.dart';
import 'package:atheer/features/quran/presentation/widgets/mushaf_index_sheet.dart';
import 'package:atheer/features/quran/presentation/widgets/mushaf_page_image.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:atheer/features/tafsir/presentation/bloc/tafsir_cubit.dart';
import 'package:atheer/features/tafsir/presentation/widgets/tafsir_bottom_sheet.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_cubit.dart';
import 'package:atheer/features/notes/presentation/widgets/note_editor.dart';
import 'package:atheer/injection.dart';

const int _totalPages = 604;
const String _pageThemeKey = 'mushaf_page_theme_index';

class MushafPage extends StatefulWidget {
  final int initialPage;

  const MushafPage({
    super.key,
    this.initialPage = 1,
  });

  @override
  State<MushafPage> createState() => _MushafPageState();
}

class _MushafPageState extends State<MushafPage> {
  late PageController _pageController;
  final MushafDownloader _downloader = MushafDownloader();
  int _currentDisplayPage = 1;
  bool _showControls = true;
  bool _isFullscreen = false;

  String? _baseDir;
  bool _checking = true;
  bool _downloading = false;
  MushafDownloadProgress? _progress;

  int _pageThemeIndex = 0;
  MushafPageTheme get _pageTheme =>
      MushafPageTheme.presets[_pageThemeIndex % MushafPageTheme.presets.length];

  @override
  void initState() {
    super.initState();
    _currentDisplayPage = widget.initialPage;
    _pageController = PageController(
      initialPage: widget.initialPage - 1,
    );
    _loadPageTheme();
    _checkDownloaded();
  }

  Future<void> _loadPageTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _pageThemeIndex = prefs.getInt(_pageThemeKey) ?? 0;
    });
  }

  @override
  void dispose() {
    if (_isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      );
    }
    _pageController.dispose();
    super.dispose();
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
      _showControls = !_isFullscreen;
    });
    SystemChrome.setEnabledSystemUIMode(
      _isFullscreen ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  Future<void> _checkDownloaded() async {
    final dir = await _downloader.getPagesDir();
    final ready = await _downloader.isFullyDownloaded();
    if (!mounted) return;
    setState(() {
      _baseDir = dir;
      _checking = false;
      if (!ready) {
        _downloading = true;
      }
    });
    if (!ready) {
      _startDownload();
    }
  }

  Future<void> _startDownload() async {
    setState(() => _downloading = true);
    await for (final p in _downloader.downloadAll()) {
      if (!mounted) return;
      setState(() => _progress = p);
    }
    if (!mounted) return;
    setState(() => _downloading = false);
  }

  void _saveLastRead(int page) {
    context.read<SettingsCubit>().saveLastRead(0, 0, page);
  }

  void _openIndexSheet({int initialTab = 0}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MushafIndexSheet(
        onPageSelected: _jumpToPage,
        initialTabIndex: initialTab,
      ),
    );
  }

  void _openTafsirPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MushafAyahPickerSheet(
        pageNumber: _currentDisplayPage,
        title: 'اختر آية لعرض تفسيرها',
        onAyahSelected: _showTafsirForAyah,
      ),
    );
  }

  void _openNotePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MushafAyahPickerSheet(
        pageNumber: _currentDisplayPage,
        title: 'اختر آية لإضافة ملاحظة',
        onAyahSelected: _showNoteEditorForAyah,
      ),
    );
  }

  void _showTafsirForAyah(Ayah ayah) {
    final tafsirCubit = sl<TafsirCubit>();
    tafsirCubit.loadTafsir(ayah.numberInSurah, surahNumber: ayah.surahNumber);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => BlocProvider.value(
        value: tafsirCubit,
        child: const TafsirBottomSheet(),
      ),
    );
  }

  Future<void> _showNoteEditorForAyah(Ayah ayah) async {
    final notesCubit = context.read<NotesCubit>();
    final existing = await notesCubit.getAyahNote(ayah.number);
    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => NoteEditor(
        initialContent: existing?.content,
        ayahNumber: ayah.number,
        surahNumber: ayah.surahNumber,
        onSave: (content) {
          if (existing == null) {
            notesCubit.createNote(ayah.number, ayah.surahNumber, content);
          } else {
            notesCubit.editNote(existing.id, content);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'تم حفظ الملاحظة',
                style: GoogleFonts.tajawal(),
              ),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }

  void _showPageJumpDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = TextEditingController(text: '$_currentDisplayPage');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'انتقال إلى صفحة',
          textDirection: TextDirection.rtl,
          style: GoogleFonts.tajawal(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.darkText : AppColors.lightText,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(fontSize: 18),
          decoration: InputDecoration(
            hintText: '١ - ٦٠٤',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? const Color(0xFF2E3338) : AppColors.divider,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'إلغاء',
              style: GoogleFonts.tajawal(
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: isDark ? AppColors.accent : AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              final page = int.tryParse(controller.text);
              if (page != null && page >= 1 && page <= _totalPages) {
                Navigator.pop(ctx);
                _jumpToPage(page);
              }
            },
            child: Text(
              'انتقال',
              style: GoogleFonts.tajawal(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void _jumpToPage(int page) {
    _pageController.animateToPage(
      page - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: isDark
          ? AppColors.mushafDarkBackground
          : _pageTheme.background,
      body: _buildBody(isDark),
    );
  }

  Widget _buildBody(bool isDark) {
    if (_checking) {
      return Center(
        child: CircularProgressIndicator(
          color: isDark ? AppColors.accentLight : AppColors.accent,
        ),
      );
    }

    if (_downloading || _baseDir == null) {
      return _DownloadProgressView(
        progress: _progress,
        isDark: isDark,
        onCancel: () => Navigator.pop(context),
      );
    }

    return GestureDetector(
      onTap: () => setState(() => _showControls = !_showControls),
      child: Stack(
        children: [
          SafeArea(
            child: PageView.builder(
              controller: _pageController,
              reverse: false,
              itemCount: _totalPages,
              onPageChanged: (index) {
                final page = index + 1;
                setState(() => _currentDisplayPage = page);
                _saveLastRead(page);
              },
              itemBuilder: (context, index) {
                final page = index + 1;
                return MushafPageImage(
                  pageNumber: page,
                  baseDir: _baseDir!,
                  pageTheme: _pageTheme,
                );
              },
            ),
          ),
          if (_showControls)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: _buildTopBar(isDark),
              ),
            ),
          if (_showControls)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                top: false,
                child: _buildBottomBar(isDark),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTopBar(bool isDark) {
    final bgColor = isDark ? AppColors.mushafDarkBackground : AppColors.mushafBackground;
    final iconColor = isDark ? AppColors.darkText : AppColors.lightText;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            bgColor.withValues(alpha: 1.0),
            bgColor.withValues(alpha: 0.85),
          ],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: iconColor),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          IconButton(
            tooltip: _isFullscreen ? 'إنهاء ملء الشاشة' : 'ملء الشاشة',
            icon: Icon(
              _isFullscreen
                  ? Icons.fullscreen_exit_rounded
                  : Icons.fullscreen_rounded,
              color: iconColor,
            ),
            onPressed: _toggleFullscreen,
          ),
          IconButton(
            tooltip: 'فهرس المصحف',
            icon: Icon(Icons.list_rounded, color: iconColor),
            onPressed: _openIndexSheet,
          ),
          IconButton(
            tooltip: 'تفسير آية',
            icon: Icon(Icons.menu_book_rounded, color: iconColor),
            onPressed: _openTafsirPicker,
          ),
          IconButton(
            tooltip: 'ملاحظة على آية',
            icon: Icon(Icons.edit_note_rounded, color: iconColor),
            onPressed: _openNotePicker,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(bool isDark) {
    final bgColor = isDark ? AppColors.mushafDarkBackground : AppColors.mushafBackground;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final navyColor = isDark ? AppColors.darkText : AppColors.primary;
    final juz = _getJuzForPage(_currentDisplayPage);
    final hizb = _getHizbForPage(_currentDisplayPage);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            bgColor.withValues(alpha: 1.0),
            bgColor.withValues(alpha: 0.85),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _openIndexSheet(initialTab: 1),
            child: _InfoChip(
              text: 'الجزء ${juz.toString().arabicNumber}',
              color: navyColor,
              bgColor: navyColor.withValues(alpha: 0.08),
            ),
          ),
          GestureDetector(
            onTap: _showPageJumpDialog,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: goldColor.withValues(alpha: 0.4), width: 1),
              ),
              child: Text(
                _currentDisplayPage.toString().arabicNumber,
                style: GoogleFonts.amiri(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: goldColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _openIndexSheet(initialTab: 2),
            child: _InfoChip(
              text: 'الحزب ${hizb.toString().arabicNumber}',
              color: goldColor,
              bgColor: goldColor.withValues(alpha: 0.08),
            ),
          ),
        ],
      ),
    );
  }

  int _getJuzForPage(int page) => MushafMetadata.juzForPage(page);
  int _getHizbForPage(int page) => MushafMetadata.hizbForPage(page);
}

class _InfoChip extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;

  const _InfoChip({
    required this.text,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.tajawal(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DownloadProgressView extends StatelessWidget {
  final MushafDownloadProgress? progress;
  final bool isDark;
  final VoidCallback onCancel;

  const _DownloadProgressView({
    required this.progress,
    required this.isDark,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final accent = isDark ? AppColors.accentLight : AppColors.accent;
    final navy = isDark ? AppColors.darkText : AppColors.primary;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final done = progress?.downloaded ?? 0;
    final total = progress?.total ?? _totalPages;
    final failed = progress?.failed ?? 0;
    final ratio = progress?.ratio ?? 0.0;
    final percent = (ratio * 100).clamp(0, 100).toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: navy),
              onPressed: onCancel,
            ),
          ),
          const Spacer(),
          Icon(Icons.menu_book_rounded, size: 72, color: accent),
          const SizedBox(height: 20),
          Text(
            'جاري تحميل المصحف',
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: navy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'تحميل لمرة واحدة. بعدها سيعمل المصحف بدون إنترنت.',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(fontSize: 13, color: secondary),
          ),
          const SizedBox(height: 28),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: ratio > 0 ? ratio : null,
              minHeight: 10,
              backgroundColor: accent.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(accent),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${done.toString().arabicNumber} / ${total.toString().arabicNumber}  ($percent%)',
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: navy,
            ),
          ),
          if (failed > 0) ...[
            const SizedBox(height: 6),
            Text(
              'تعذّر تحميل ${failed.toString().arabicNumber} صفحة — ستتم إعادة المحاولة تلقائياً عند الفتح التالي',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.tajawal(
                fontSize: 12,
                color: Colors.orange.shade700,
              ),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
