import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:card_settings/common/constants/constants.dart';
import 'package:card_settings/domain/model/dio_interceptor/dio_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  Dio dio(DioInterceptor dioInterceptor) {
    final dio = Dio();

    dio.options.baseUrl = Constants.baseUrl;

    dio.interceptors.add(dioInterceptor);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        error: kDebugMode,
        compact: true,
        maxWidth: 90,
      ),
    );

    return dio;
  }
}
