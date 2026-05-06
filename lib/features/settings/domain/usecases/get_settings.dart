import 'package:atheer/features/settings/domain/entities/app_settings.dart';
import 'package:atheer/features/settings/domain/repositories/settings_repository.dart';

class GetSettings {
  final SettingsRepository repository;

  GetSettings(this.repository);

  Future<AppSettings> call() => repository.getSettings();
}
