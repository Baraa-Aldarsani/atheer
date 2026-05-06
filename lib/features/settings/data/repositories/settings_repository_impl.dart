import 'package:atheer/features/settings/domain/entities/app_settings.dart';
import 'package:atheer/features/settings/domain/repositories/settings_repository.dart';
import 'package:atheer/features/settings/data/datasources/settings_local_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl(this.localDataSource);

  @override
  Future<AppSettings> getSettings() => localDataSource.getSettings();

  @override
  Future<void> saveSettings(AppSettings settings) => localDataSource.saveSettings(settings);
}
