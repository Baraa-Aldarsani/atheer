class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.alquran.cloud/v1';
  static const String allSurahs = '/surah';
  static const String surahByNumber = '/surah/{number}';
  static const String surahEdition = '/surah/{number}/{edition}';
  static const String pageByNumber = '/page/{number}';
  static const String juzByNumber = '/juz/{number}';
  static const String search = '/search/{keyword}/all/ar';
  static const String ayahEditions = '/ayah/{number}/editions/{edition}';

  // Editions
  static const String uthmaniEdition = 'quran-uthmani';
  static const String defaultAudioEdition = 'ar.alafasy';
  static const String defaultTafsirEdition = 'ar.muyassar';
}
