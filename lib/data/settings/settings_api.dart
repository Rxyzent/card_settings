import 'package:card_settings/domain/model/bacground_settings/background_settings.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsApi {
  SettingsApi(this._dio);

  final Dio _dio;

  Future<Response> sendSettings(BackgroundSettings settings) async{
    final request = settings.toJson();
    print(request);
    return _dio.post('path',data: request);
  }
}