import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class MushafDownloadProgress {
  final int downloaded;
  final int total;
  final int failed;

  const MushafDownloadProgress({
    required this.downloaded,
    required this.total,
    this.failed = 0,
  });

  double get ratio => total == 0 ? 0 : downloaded / total;
}

/// Downloads 604 Mushaf page images once to the app's documents directory,
/// then the reader works fully offline using local files. Source is the
/// easyquran.com Hafs Tajweed edition — thin clean border, green surah
/// header, and tajweed coloring that complements the app's green/gold theme.
class MushafDownloader {
  static const int totalPages = 604;
  static const String _urlTemplate =
      'https://raw.githubusercontent.com/QuranHub/quran-pages-images/main/easyquran.com/hafs-tajweed/{p}.jpg';
  static const int _concurrency = 8;

  final Dio _dio;

  MushafDownloader({Dio? dio}) : _dio = dio ?? Dio();

  Future<String> getPagesDir() async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory('${docs.path}/mushaf_pages_easyquran_tajweed');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir.path;
  }

  /// Deletes any leftover files from older page sources so stale pages
  /// don't linger on disk after switching editions.
  Future<void> cleanLegacyFiles() async {
    final docs = await getApplicationDocumentsDirectory();
    const legacyDirs = ['mushaf_pages', 'mushaf_pages_kfgqpc'];
    for (final legacyName in legacyDirs) {
      final legacy = Directory('${docs.path}/$legacyName');
      if (legacy.existsSync()) {
        try {
          await legacy.delete(recursive: true);
        } catch (_) {}
      }
    }
    final dir = Directory(await getPagesDir());
    if (!dir.existsSync()) return;
    for (final entry in dir.listSync()) {
      if (entry is File && entry.path.toLowerCase().endsWith('.png')) {
        try {
          await entry.delete();
        } catch (_) {}
      }
    }
  }

  Future<String> pathForPage(int page) async {
    final dir = await getPagesDir();
    return '$dir/$page.jpg';
  }

  Future<bool> isFullyDownloaded() async {
    final dir = await getPagesDir();
    const samples = [1, 100, 300, 500, 604];
    for (final p in samples) {
      final f = File('$dir/$p.jpg');
      if (!f.existsSync() || f.lengthSync() < 1024) return false;
    }
    return true;
  }

  Future<int> downloadedCount() async {
    final dir = await getPagesDir();
    int count = 0;
    for (int p = 1; p <= totalPages; p++) {
      final f = File('$dir/$p.jpg');
      if (f.existsSync() && f.lengthSync() >= 1024) count++;
    }
    return count;
  }

  /// Downloads every missing page. Emits a progress event after each batch.
  Stream<MushafDownloadProgress> downloadAll() async* {
    await cleanLegacyFiles();
    final dir = await getPagesDir();
    int done = 0;
    int failed = 0;

    final missing = <int>[];
    for (int p = 1; p <= totalPages; p++) {
      final f = File('$dir/$p.jpg');
      if (f.existsSync() && f.lengthSync() >= 1024) {
        done++;
      } else {
        missing.add(p);
      }
    }

    yield MushafDownloadProgress(downloaded: done, total: totalPages);

    for (int i = 0; i < missing.length; i += _concurrency) {
      final batch = missing.skip(i).take(_concurrency).toList();
      final results = await Future.wait(batch.map((p) => _downloadOne(dir, p)));
      for (final ok in results) {
        if (ok) {
          done++;
        } else {
          failed++;
        }
      }
      yield MushafDownloadProgress(
        downloaded: done,
        total: totalPages,
        failed: failed,
      );
    }
  }

  Future<bool> _downloadOne(String dir, int page) async {
    final path = '$dir/$page.jpg';
    final url = _urlTemplate.replaceFirst('{p}', page.toString());
    try {
      await _dio.download(
        url,
        path,
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 30),
        ),
      );
      final f = File(path);
      if (f.existsSync() && f.lengthSync() >= 1024) return true;
      if (f.existsSync()) await f.delete();
      return false;
    } catch (_) {
      final f = File(path);
      if (f.existsSync()) {
        try {
          await f.delete();
        } catch (_) {}
      }
      return false;
    }
  }
}
