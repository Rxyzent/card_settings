import 'dart:math';

import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/common/constants/constants.dart';
import 'package:card_settings/domain/model/bacground_settings/background_settings.dart';
import 'package:card_settings/domain/repo/settings_repo.dart';
import 'package:card_settings/presentation/home/cubit/home_state.dart';
import 'package:card_settings/presentation/settings/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends BaseCubit<HomeBuildable, HomeListenable> {
  HomeCubit(this._repo) : super(const HomeBuildable()) {
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
        (buildable) => buildable.copyWith(settings: newSettings),
      );
      _repo.setSettings(newSettings);
    } else {
      build((buildable) => buildable.copyWith(settings: settings));
    }
  }

  void setSettings(BackgroundSettings settings) {
    build((buildable) => buildable.copyWith(settings: settings));
  }
}
