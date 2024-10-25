import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'background_settings.freezed.dart';
part 'background_settings.g.dart';

@freezed
class BackgroundSettings with _$BackgroundSettings{
  @HiveType(typeId: 0)
  const factory BackgroundSettings({
    @HiveField(0) String? imageUrl,
    @HiveField(1) Photo? photo,
    @HiveField(2) double? blur,
    @HiveField(3) String? color,
    @HiveField(4) String? gradientBegin,
    @HiveField(5) String? gradientEnd,
    @HiveField(6) List<String>? gradientColors,
    @HiveField(7) double? zoom,
    @HiveField(8) String? backgroundState,
}) = _BackgroundSettings;
  factory BackgroundSettings.fromJson(Map<String, dynamic> json) =>
      _$BackgroundSettingsFromJson(json);
}

@freezed
class Photo with _$Photo{
  @HiveType(typeId: 1)
  const factory Photo({
    @HiveField(0) String? path,
    @HiveField(1) String? type,
}) = _Photo;
  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);
}
