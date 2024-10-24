// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:card_settings/common/di/app_module.dart' as _i981;
import 'package:card_settings/common/di/network_module.dart' as _i583;
import 'package:card_settings/common/widgets/display/display.dart' as _i138;
import 'package:card_settings/common/widgets/display/display_impl.dart' as _i55;
import 'package:card_settings/data/main/main_repo_impl.dart' as _i213;
import 'package:card_settings/domain/model/colors/dark_theme_colors.dart'
    as _i853;
import 'package:card_settings/domain/model/colors/theme_colors.dart' as _i188;
import 'package:card_settings/domain/model/dio_interceptor/dio_interceptor.dart'
    as _i271;
import 'package:card_settings/domain/model/storage/storage.dart' as _i193;
import 'package:card_settings/domain/repo/main_repo.dart' as _i613;
import 'package:card_settings/presentation/home/cubit/home_cubit.dart' as _i998;
import 'package:card_settings/presentation/main/cubit/main_cubit.dart' as _i267;
import 'package:card_settings/presentation/settings/cubit/settings_cubit.dart'
    as _i116;
import 'package:card_settings/presentation/splash/cubit/splash_cubit.dart'
    as _i964;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i116.SettingsCubit>(() => _i116.SettingsCubit());
    gh.factory<_i998.HomeCubit>(() => _i998.HomeCubit());
    gh.factory<_i964.SplashCubit>(() => _i964.SplashCubit());
    gh.singleton<_i853.DarkThemeColors>(() => _i853.DarkThemeColors());
    gh.lazySingleton<_i974.Logger>(() => appModule.logger);
    await gh.lazySingletonAsync<_i193.Storage>(
      () => _i193.Storage.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i188.ThemeColors>(() => _i188.ThemeColors());
    gh.singleton<_i138.Display>(() => _i55.DisplayImpl());
    gh.factory<_i613.MainRepo>(() => _i213.MainRepoImpl(gh<_i193.Storage>()));
    gh.lazySingleton<_i271.DioInterceptor>(
        () => _i271.DioInterceptor(gh<_i193.Storage>()));
    gh.factory<_i361.Dio>(() => networkModule.dio(gh<_i271.DioInterceptor>()));
    gh.factory<_i267.MainCubit>(() => _i267.MainCubit(gh<_i613.MainRepo>()));
    return this;
  }
}

class _$AppModule extends _i981.AppModule {}

class _$NetworkModule extends _i583.NetworkModule {}
