import 'package:get_it/get_it.dart';
import 'package:card_settings/common/di/injection.config.dart';
import 'package:card_settings/common/router/app_router.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  getIt.registerLazySingleton(() => AppRouter());
}
