import 'package:card_settings/common/di/injection.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';
import 'package:card_settings/common/gen/assets.gen.dart';
import 'package:card_settings/common/gen/strings.dart';
import 'package:card_settings/common/router/app_router.dart';
import 'package:card_settings/common/utils/fixed_csv_asset_loader.dart';
import 'package:card_settings/common/widgets/display/display_widget.dart';
import 'package:card_settings/presentation/main/cubit/main_cubit.dart';
import 'package:card_settings/presentation/main/cubit/main_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/base/base_builder.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
        (value) => runApp(
      EasyLocalization(
        supportedLocales: Strings.supportedLocales,
        path: Assets.localization.translations,
        fallbackLocale: Strings.supportedLocales.first,
        startLocale: Strings.supportedLocales.first,
        assetLoader: FixedCsvAssetLoader(),
        child: const MyApp(),
      ),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubit>(),
      child: BaseBuilder<MainCubit, MainBuildable, MainListenable>(
        properties: (buildable) => [buildable.themeMode],
        builder: (context, state) {
          return DisplayWidget(
            child: MaterialApp.router(
              title: 'CardSettings',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              routerConfig: getIt<AppRouter>().config(),
              color: context.colors.primary,
              locale: context.locale,
              theme: context.lightTheme,
              darkTheme: context.darkTheme,
              themeMode: ThemeMode.light,//state.themeMode ? ThemeMode.light : ThemeMode.dark,
            ),
          );
        },
      ),
    );
  }
}
