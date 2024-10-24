import 'package:auto_route/auto_route.dart';
import 'package:card_settings/presentation/home/home_page.dart';
import 'package:card_settings/presentation/settings/settings_page.dart';
import 'package:card_settings/presentation/splash/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}
