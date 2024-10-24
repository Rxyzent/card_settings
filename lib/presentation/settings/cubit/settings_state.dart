import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsBuildable with _$SettingsBuildable {
  const factory SettingsBuildable() = _SettingsBuildable;
}

@freezed
class SettingsListenable with _$SettingsListenable {
  const factory SettingsListenable() = _SettingsListenable;
}