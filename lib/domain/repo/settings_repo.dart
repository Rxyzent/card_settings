import 'package:card_settings/domain/model/bacground_settings/background_settings.dart';

abstract class SettingsRepo{
  BackgroundSettings? getSettings();

  Future<void> sendBackgroundSettings(BackgroundSettings settings);

  void setSettings(BackgroundSettings settings);
 }