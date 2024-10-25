import 'package:auto_route/auto_route.dart';
import 'package:card_settings/common/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:card_settings/common/base/base_page.dart';
import 'package:card_settings/common/router/app_router.dart';
import 'package:card_settings/presentation/splash/cubit/splash_cubit.dart';
import 'package:card_settings/presentation/splash/cubit/splash_state.dart';

@RoutePage()
class SplashPage extends BasePage<SplashCubit,SplashBuildable,SplashListenable>{
  const SplashPage({super.key});

  @override
  void listener(BuildContext context, SplashListenable state) {
    super.listener(context, state);
    switch (state.effect) {
      case SplashEffect.home:
        context.router.replace( const HomeRoute());
        break;

    }
  }

  @override
  Widget builder(BuildContext context, SplashBuildable state) {
   return const Scaffold(
     body: SafeArea(
       child: Center(
         child: LoadingView(),
       ),
     ),
   );
  }

}