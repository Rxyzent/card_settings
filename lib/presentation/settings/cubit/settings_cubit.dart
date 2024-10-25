import 'dart:math';

import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/common/constants/constants.dart';
import 'package:card_settings/domain/model/background_settings/background_settings.dart';
import 'package:card_settings/domain/repo/settings_repo.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsCubit extends BaseCubit<SettingsBuildable, SettingsListenable> {
  SettingsCubit(this._repo) : super(const SettingsBuildable()) {
    _init();
  }

  final SettingsRepo _repo;

  void _init() {
    final settings = _repo.getSettings();
    if (settings == null) {
      final Map<String, Alignment> beginAlignments = Map.from(alignments);
      final Map<String, Alignment> endAlignments = Map.from(alignments);
      beginAlignments.remove('bottomRight');
      endAlignments.remove('topLeft');
      final random = Random();
      final newSettings = BackgroundSettings(
        imageUrl: Constants
            .defaultImages[random.nextInt(Constants.defaultImages.length)],
        blur: 0.0,
        color: '#8d42f5',
        gradientBegin: 'topLeft',
        gradientEnd: 'bottomRight',
        gradientColors: [],
        zoom: 1.0,
        backgroundState: 'SOLID',
      );
      build(
        (buildable) => buildable.copyWith(
          settings: newSettings,
          beginAlignments: beginAlignments,
          endAlignments: endAlignments,
        ),
      );
    } else {
      final Map<String, Alignment> beginAlignments = Map.from(alignments);
      final Map<String, Alignment> endAlignments = Map.from(alignments);
      beginAlignments.remove(settings.gradientEnd);
      endAlignments.remove(settings.gradientBegin);
      build((buildable) => buildable.copyWith(
            settings: settings,
            beginAlignments: beginAlignments,
            endAlignments: endAlignments,
          ));
    }
  }

  void setZoom(double zoom) {
    final newSettings = buildable.settings!.copyWith(zoom: zoom);
    build((buildable) => buildable.copyWith(settings: newSettings));
  }

  void setSettingType(SettingType settingType) {
    var newBackgroundState = buildable.settings!.backgroundState;
    switch (settingType) {
      case SettingType.color:
        newBackgroundState = 'SOLID';
        break;
      case SettingType.image:
        newBackgroundState = 'IMAGE';
        break;
      case SettingType.blur:
        break;
      case SettingType.none:
        break;
    }
    final newSettings =
        buildable.settings!.copyWith(backgroundState: newBackgroundState);
    build((buildable) =>
        buildable.copyWith(settingType: settingType, settings: newSettings));
  }

  void setBlurValue(double value) {
    final newSettings = buildable.settings!.copyWith(blur: value);
    build((buildable) => buildable.copyWith(settings: newSettings));
  }

  void changeGradientState(bool value) {
    if (value) {
      final newSettings =
          buildable.settings!.copyWith(backgroundState: 'GRADIENT');
      build((buildable) =>
          buildable.copyWith(gradientState: value, settings: newSettings));
    } else {
      final newSettings =
          buildable.settings!.copyWith(backgroundState: 'SOLID');
      build((buildable) =>
          buildable.copyWith(gradientState: value, settings: newSettings));
    }
  }

  void setColor(Color color) {
    final newSettings = buildable.settings!.copyWith(
      color: _colorToHexString(color),
      backgroundState: 'SOLID',
    );
    build((buildable) => buildable.copyWith(settings: newSettings));
  }

  void displayWarning() =>
      display.warning('You have reached maximum count of colors');

  void addGradientColor(Color color) {
    if (buildable.settings!.gradientColors!.length == 5) return;
    final newGradientColors = [...?buildable.settings!.gradientColors];
    newGradientColors.add(_colorToHexString(color));
    final newSettings =
        buildable.settings!.copyWith(gradientColors: newGradientColors);
    build((buildable) => buildable.copyWith(settings: newSettings));
  }

  void removeGradientColor() {
    if (buildable.settings!.gradientColors!.isEmpty) return;
    final newGradientColors = [...?buildable.settings!.gradientColors];
    newGradientColors.removeLast();
    final newSettings =
        buildable.settings!.copyWith(gradientColors: newGradientColors);
    build((buildable) => buildable.copyWith(settings: newSettings));
  }

  void setAlignment(String alignment, bool isBegin) {
    if (isBegin) {
      final Map<String, Alignment> newEndAlignments = Map.from(alignments);
      newEndAlignments.remove(alignment);
      final newSettings =
          buildable.settings!.copyWith(gradientBegin: alignment);
      build((buildable) => buildable.copyWith(
          settings: newSettings, endAlignments: newEndAlignments));
    } else {
      final Map<String, Alignment> newBeginAlignments = Map.from(alignments);
      newBeginAlignments.remove(alignment);
      final newSettings = buildable.settings!.copyWith(gradientEnd: alignment);
      build((buildable) => buildable.copyWith(
          settings: newSettings, beginAlignments: newBeginAlignments));
    }
  }

  void saveImage(String? imageUrl, XFile? photo) async {
    if (photo != null) {
      final imageFormat = photo.path.split(".").last;
      final newPhoto = Photo(
        path: photo.path,
        type: imageFormat,
      );
      final newSettings = buildable.settings!.copyWith(
        photo: newPhoto,
        imageUrl: null,
        backgroundState: 'PHOTO',
      );
      build(
        (buildable) => buildable.copyWith(settings: newSettings),
      );
    } else if (imageUrl != null) {
      final newSettings = buildable.settings!.copyWith(
        imageUrl: imageUrl,
        photo: null,
        backgroundState: 'IMAGE',
      );
      build(
        (buildable) => buildable.copyWith(settings: newSettings),
      );
    }
  }

  Future<void> sendSettings() => callable(
        future: _repo.sendBackgroundSettings(buildable.settings!),
      );

  String _colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }
}
