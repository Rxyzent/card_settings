import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/domain/repo/main_repo.dart';
import 'package:card_settings/presentation/main/cubit/main_state.dart';

@injectable
class MainCubit extends BaseCubit<MainBuildable, MainListenable> {
  MainCubit(this._repo) : super(const MainBuildable()){
    _init();
  }

  final MainRepo _repo;

  void _init() async{
    getThemeMode();
  }


  void select(String language) {
    build((buildable) => buildable.copyWith(language: language));
  }

  void changeTheme(bool value) async{
    build((buildable) => buildable.copyWith(themeMode: value));
    await _repo.setThemeMode(value);
  }

  void getThemeMode() async {
    final themeMode = _repo.getThemeMode();
    final currentThemeMode = PlatformDispatcher.instance.platformBrightness == Brightness.light;
    if(themeMode == null){
      _repo.setThemeMode(currentThemeMode);
    }
    build((buildable) => buildable.copyWith(themeMode: themeMode ?? currentThemeMode));
  }

}