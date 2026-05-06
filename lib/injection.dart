import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:atheer/core/network/api_client.dart';
import 'package:atheer/core/network/network_info.dart';
import 'package:atheer/core/services/quran_data_loader.dart';
import 'package:atheer/database/app_database.dart';

// Quran
import 'package:atheer/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:atheer/features/quran/data/datasources/quran_local_datasource.dart';
import 'package:atheer/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:atheer/features/quran/domain/repositories/quran_repository.dart';
import 'package:atheer/features/quran/domain/usecases/get_all_surahs.dart';
import 'package:atheer/features/quran/domain/usecases/get_surah_ayahs.dart';
import 'package:atheer/features/quran/domain/usecases/get_page_ayahs.dart';
import 'package:atheer/features/quran/domain/usecases/get_juz_ayahs.dart';
import 'package:atheer/features/quran/presentation/bloc/surah_list/surah_list_cubit.dart';
import 'package:atheer/features/quran/presentation/bloc/reader/reader_cubit.dart';
import 'package:atheer/features/quran/presentation/bloc/mushaf/mushaf_cubit.dart';

// Tafsir
import 'package:atheer/features/tafsir/data/datasources/tafsir_remote_datasource.dart';
import 'package:atheer/features/tafsir/data/datasources/tafsir_local_datasource.dart';
import 'package:atheer/features/tafsir/data/repositories/tafsir_repository_impl.dart';
import 'package:atheer/features/tafsir/domain/repositories/tafsir_repository.dart';
import 'package:atheer/features/tafsir/domain/usecases/get_ayah_tafsir.dart';
import 'package:atheer/features/tafsir/presentation/bloc/tafsir_cubit.dart';

// Search
import 'package:atheer/features/search/data/datasources/search_local_datasource.dart';
import 'package:atheer/features/search/data/repositories/search_repository_impl.dart';
import 'package:atheer/features/search/domain/repositories/search_repository.dart';
import 'package:atheer/features/search/domain/usecases/search_quran.dart';
import 'package:atheer/features/search/presentation/bloc/search_cubit.dart';

// Favorites
import 'package:atheer/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:atheer/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:atheer/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:atheer/features/favorites/domain/usecases/get_favorites.dart';
import 'package:atheer/features/favorites/domain/usecases/toggle_favorite.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_cubit.dart';

// Notes
import 'package:atheer/features/notes/data/datasources/notes_local_datasource.dart';
import 'package:atheer/features/notes/data/repositories/notes_repository_impl.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';
import 'package:atheer/features/notes/domain/usecases/get_notes.dart';
import 'package:atheer/features/notes/domain/usecases/add_note.dart';
import 'package:atheer/features/notes/domain/usecases/update_note.dart';
import 'package:atheer/features/notes/domain/usecases/delete_note.dart';
import 'package:atheer/features/notes/domain/usecases/search_notes.dart';
import 'package:atheer/features/notes/domain/usecases/get_note_for_ayah.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_cubit.dart';

// Audio
import 'package:atheer/features/audio/data/datasources/audio_remote_datasource.dart';
import 'package:atheer/features/audio/data/repositories/audio_repository_impl.dart';
import 'package:atheer/features/audio/domain/repositories/audio_repository.dart';
import 'package:atheer/features/audio/domain/usecases/get_surah_audio.dart';
import 'package:atheer/features/audio/domain/usecases/get_reciters.dart';
import 'package:atheer/features/audio/presentation/bloc/audio_player/audio_player_cubit.dart';
import 'package:atheer/features/audio/presentation/bloc/reciter/reciter_cubit.dart';

// Settings
import 'package:atheer/features/settings/data/datasources/settings_local_datasource.dart';
import 'package:atheer/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:atheer/features/settings/domain/repositories/settings_repository.dart';
import 'package:atheer/features/settings/domain/usecases/get_settings.dart';
import 'package:atheer/features/settings/domain/usecases/update_settings.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_cubit.dart';

// Notifications
import 'package:atheer/features/notifications/data/datasources/notification_local_datasource.dart';
import 'package:atheer/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:atheer/features/notifications/domain/repositories/notification_repository.dart';
import 'package:atheer/features/notifications/domain/usecases/schedule_notification.dart';
import 'package:atheer/features/notifications/domain/usecases/cancel_notification.dart';
import 'package:atheer/features/notifications/presentation/bloc/notification_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ==================== External ====================
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => FlutterLocalNotificationsPlugin());

  // ==================== Core ====================
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // ==================== Database ====================
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => sl<AppDatabase>().quranDao);
  sl.registerLazySingleton(() => sl<AppDatabase>().favoritesDao);
  sl.registerLazySingleton(() => sl<AppDatabase>().notesDao);
  sl.registerLazySingleton(() => sl<AppDatabase>().tafsirDao);

  // ==================== Data Loader ====================
  sl.registerLazySingleton(() => QuranDataLoader(sl()));

  // ==================== Quran Feature ====================
  // Data sources
  sl.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<QuranLocalDataSource>(
    () => QuranLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllSurahs(sl()));
  sl.registerLazySingleton(() => GetSurahAyahs(sl()));
  sl.registerLazySingleton(() => GetPageAyahs(sl()));
  sl.registerLazySingleton(() => GetJuzAyahs(sl()));

  // Cubits
  sl.registerFactory(() => SurahListCubit(getAllSurahs: sl()));
  sl.registerFactory(() => ReaderCubit(getSurahAyahs: sl()));
  sl.registerFactory(() => MushafCubit(getPageAyahs: sl()));

  // ==================== Tafsir Feature ====================
  sl.registerLazySingleton<TafsirRemoteDataSource>(
    () => TafsirRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TafsirLocalDataSource>(
    () => TafsirLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TafsirRepository>(
    () => TafsirRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetAyahTafsir(sl()));
  sl.registerFactory(() => TafsirCubit(getAyahTafsir: sl(), getNoteForAyah: sl()));

  // ==================== Search Feature ====================
  sl.registerLazySingleton<SearchLocalDataSource>(
    () => SearchLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(localDataSource: sl(), quranDao: sl()),
  );
  sl.registerLazySingleton(() => SearchQuran(sl()));
  sl.registerFactory(() => SearchCubit(searchQuran: sl()));

  // ==================== Favorites Feature ====================
  sl.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetFavorites(sl()));
  sl.registerLazySingleton(() => ToggleFavorite(sl()));
  sl.registerLazySingleton(() => FavoritesCubit(getFavorites: sl(), toggleFavorite: sl()));

  // ==================== Notes Feature ====================
  sl.registerLazySingleton<NotesLocalDataSource>(
    () => NotesLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<NotesRepository>(
    () => NotesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetNotes(sl()));
  sl.registerLazySingleton(() => AddNote(sl()));
  sl.registerLazySingleton(() => UpdateNote(sl()));
  sl.registerLazySingleton(() => DeleteNote(sl()));
  sl.registerLazySingleton(() => SearchNotes(sl()));
  sl.registerLazySingleton(() => GetNoteForAyah(sl()));
  sl.registerLazySingleton(() => NotesCubit(
    getNotes: sl(),
    addNote: sl(),
    updateNote: sl(),
    deleteNote: sl(),
    searchNotes: sl(),
    getNoteForAyah: sl(),
  ));

  // ==================== Audio Feature ====================
  sl.registerLazySingleton<AudioRemoteDataSource>(
    () => AudioRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AudioRepository>(
    () => AudioRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton(() => GetSurahAudio(sl()));
  sl.registerLazySingleton(() => GetReciters(sl()));
  sl.registerFactory(() => AudioPlayerCubit(getSurahAudio: sl()));
  sl.registerFactory(() => ReciterCubit(getReciters: sl()));

  // ==================== Settings Feature ====================
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetSettings(sl()));
  sl.registerLazySingleton(() => UpdateSettings(sl()));
  sl.registerLazySingleton(() => SettingsCubit(getSettings: sl(), updateSettings: sl()));

  // ==================== Notifications Feature ====================
  sl.registerLazySingleton<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => ScheduleNotification(sl()));
  sl.registerLazySingleton(() => CancelNotification(sl()));
  sl.registerFactory(() => NotificationCubit(
    scheduleNotification: sl(),
    cancelNotification: sl(),
  ));
}
