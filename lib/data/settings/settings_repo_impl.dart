import 'package:card_settings/data/settings/settings_api.dart';
import 'package:card_settings/domain/model/background_settings/background_settings.dart';
import 'package:card_settings/domain/model/storage/storage.dart';
import 'package:card_settings/domain/repo/settings_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SettingsRepo)
class SettingsRepoImpl extends SettingsRepo{
  SettingsRepoImpl(this._storage, this._api);

  final Storage _storage;
  final SettingsApi _api;

  @override
  BackgroundSettings? getSettings() {
    return _storage.settings.call();
  }

  @override
  Future<void> sendBackgroundSettings(BackgroundSettings settings) async{
    await _storage.settings.set(settings);
    await _api.sendSettings(settings);
  }

  @override
  void setSettings(BackgroundSettings settings) {
    _storage.settings.set(settings);
  }

}