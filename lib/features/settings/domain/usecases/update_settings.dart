import 'package:atheer/features/settings/domain/entities/app_settings.dart';
import 'package:atheer/features/settings/domain/repositories/settings_repository.dart';

class UpdateSettings {
  final SettingsRepository repository;

  UpdateSettings(this.repository);

  Future<void> call(AppSettings settings) => repository.saveSettings(settings);
}
