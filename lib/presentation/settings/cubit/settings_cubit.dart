import 'dart:ui';

import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsCubit extends BaseCubit<SettingsBuildable, SettingsListenable> {
  SettingsCubit() : super(const SettingsBuildable()) {
    _init();
  }

  void _init() {
    final Map<String,Alignment> beginAlignments = Map.from(alignments);
    final Map<String,Alignment> endAlignments = Map.from(alignments);
    beginAlignments.remove(buildable.endAlignment);
    endAlignments.remove(buildable.beginAlignment);
    build(
      (buildable) => buildable.copyWith(
        beginAlignments: beginAlignments,
        endAlignments: endAlignments,
      ),
    );
  }

  void setSettingType(SettingType settingType) {
    build((buildable) => buildable.copyWith(settingType: settingType));
  }

  void setBlurValue(double value) {
    build((buildable) => buildable.copyWith(blurValue: value));
  }

  void changeGradientState(bool value) {
    build((buildable) => buildable.copyWith(gradientState: value));
  }

  void setColor(Color color) {
    build((buildable) => buildable
        .copyWith(color: color, useImage: false, gradientColors: [color]));
  }

  void displayWarning() =>
      display.warning('You have reached maximum count of colors');

  void addGradientColor(Color color) {
    if (buildable.gradientColors.length == 5) return;
    final newGradientColors = [...buildable.gradientColors];
    newGradientColors.add(color);
    build((buildable) => buildable.copyWith(gradientColors: newGradientColors));
  }

  void removeGradientColor() {
    if (buildable.gradientColors.isEmpty) return;
    final newGradientColors = [...buildable.gradientColors];
    newGradientColors.removeLast();
    build((buildable) => buildable.copyWith(gradientColors: newGradientColors));
  }

  void setAlignment(String alignment, bool isBegin) {
    if (isBegin) {
      final Map<String,Alignment> newEndAlignments = Map.from(alignments);
      newEndAlignments.remove(alignment);
      build((buildable) => buildable.copyWith(
          beginAlignment: alignment, endAlignments: newEndAlignments));
    } else {
      final Map<String,Alignment> newBeginAlignments = Map.from(alignments);
      newBeginAlignments.remove(alignment);
      build((buildable) => buildable.copyWith(
          endAlignment: alignment, beginAlignments: newBeginAlignments));
    }
  }

  void saveImage(String path){

  }
}
