// Placeholder for audio caching (downloaded files)
abstract class AudioLocalDataSource {
  Future<String?> getLocalAudioPath(int ayahNumber, String reciterId);
  Future<void> saveAudioPath(int ayahNumber, String reciterId, String filePath);
}

class AudioLocalDataSourceImpl implements AudioLocalDataSource {
  // TODO: Implement with AudioCacheTable DAO when needed
  @override
  Future<String?> getLocalAudioPath(int ayahNumber, String reciterId) async {
    return null;
  }

  @override
  Future<void> saveAudioPath(int ayahNumber, String reciterId, String filePath) async {
    // TODO: Implement
  }
}
