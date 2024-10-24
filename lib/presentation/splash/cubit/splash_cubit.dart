import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/presentation/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends BaseCubit<SplashBuildable, SplashListenable> {
  SplashCubit() : super(const SplashBuildable()) {
    _init();
  }

  void _init() {
    Timer(
      const Duration(milliseconds: 300),
      () {
        invoke(const SplashListenable(effect: SplashEffect.home));
      },
    );
  }
}
