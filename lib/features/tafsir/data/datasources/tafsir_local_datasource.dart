import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/database/daos/tafsir_dao.dart';
import 'package:atheer/features/tafsir/data/models/tafsir_model.dart';

abstract class TafsirLocalDataSource {
  Future<TafsirModel?> getCachedTafsir(int ayahNumber, String edition);
  Future<void> cacheTafsir(TafsirModel tafsir);
}

class TafsirLocalDataSourceImpl implements TafsirLocalDataSource {
  final TafsirDao tafsirDao;

  TafsirLocalDataSourceImpl(this.tafsirDao);

  @override
  Future<TafsirModel?> getCachedTafsir(int ayahNumber, String edition) async {
    try {
      final result = await tafsirDao.getTafsir(ayahNumber, edition);
      if (result == null) return null;
      return TafsirModel.fromTableData(result);
    } catch (e) {
      throw CacheException('Failed to get cached tafsir: $e');
    }
  }

  @override
  Future<void> cacheTafsir(TafsirModel tafsir) async {
    try {
      await tafsirDao.cacheTafsir(tafsir.toCompanion());
    } catch (e) {
      throw CacheException('Failed to cache tafsir: $e');
    }
  }
}
