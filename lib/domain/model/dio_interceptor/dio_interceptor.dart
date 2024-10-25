import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:card_settings/common/gen/strings.dart';
import 'package:card_settings/domain/model/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class DioInterceptor extends QueuedInterceptor {
  final Storage _storage;

  DioInterceptor(this._storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _storage.token.call();
    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    final preferences = await SharedPreferences.getInstance();
    final locale = preferences.getString('locale')?.toLocale().languageCode ??
        Strings.supportedLocales.first.languageCode;
    options.headers.addAll({
      'Accept-Language': locale,
    });
    handler.next(options);
  }
}
