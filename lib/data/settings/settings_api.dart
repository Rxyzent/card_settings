import 'package:card_settings/domain/model/background_settings/background_settings.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsApi {
  SettingsApi(this._dio);

  final Dio _dio;

  Future<Response> sendSettings(BackgroundSettings settings) async{
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(settings.photo?.path ?? ''),
      'imageUrl':settings.imageUrl,
      'blur': settings.blur,
      'zoom': settings.zoom,
      'color': settings.color,
      'gradientBegin':settings.gradientBegin,
      'gradientEnd':settings.gradientEnd,
      'gradientColors':settings.gradientColors,
    });
    return _dio.post('url-path',data: formData);
  }
}