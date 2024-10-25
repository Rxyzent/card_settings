import 'package:card_settings/domain/model/background_settings/background_settings.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsBuildable with _$SettingsBuildable {
  const factory SettingsBuildable({
    BackgroundSettings? settings,
    @Default(SettingType.none) SettingType settingType,
    @Default(false) bool gradientState,
    Map<String,Alignment>? beginAlignments,
    Map<String,Alignment>? endAlignments,
}) = _SettingsBuildable;
}

@freezed
class SettingsListenable with _$SettingsListenable {
  const factory SettingsListenable() = _SettingsListenable;
}
enum SettingType{image,blur,color,none}

final Map<String, Alignment> alignments = {
  'topLeft': Alignment.topLeft,
  'topCenter': Alignment.topCenter,
  'topRight': Alignment.topRight,
  'centerLeft': Alignment.centerLeft,
  'center': Alignment.center,
  'centerRight': Alignment.centerRight,
  'bottomLeft': Alignment.bottomLeft,
  'bottomCenter': Alignment.bottomCenter,
  'bottomRight': Alignment.bottomRight,
};